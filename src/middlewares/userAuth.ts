import { NextFunction, Request, Response } from "express";
import { catchAsync } from "../utils/catchAsync.js";
import { jwtTokens } from "../utils/jwtTokens.js";
import { envVars } from "../configs/index.js";
import { sendResponse } from "../utils/sendResponse.js";
import { StatusCodes } from "http-status-codes";
import { prisma } from "../lib/prisma.js";
import { AppError } from "../utils/appError.js";
import type { JwtPayload } from "jsonwebtoken";

declare global {
  namespace Express {
    interface Request {
      user?: {
        user_id: string;
        full_name: string;
        role_name: string;
        position_name: string;
        user_name: string;
      };
    }
  }
}
export const userAuth = (...requiredRoles: string[]) => {
  return catchAsync(async (req: Request, res: Response, next: NextFunction) => {
    const authorization = req.headers.authorization;
    const token =
      req.cookies?.accessToken ??
      (authorization?.startsWith("Bearer ")
        ? authorization.slice("Bearer ".length).trim()
        : authorization);

    if (!token) {
      sendResponse(res, {
        success: false,
        message: "Authentication token is required",
        statusCode: StatusCodes.UNAUTHORIZED,
      });
      return;
    }

    const verifiedAccessToken = jwtTokens.verifyToken(
      token,
      envVars.JWT_ACCESS_SECRET,
    );
    if (!verifiedAccessToken.success) {
      sendResponse(res, {
        success: false,
        message: verifiedAccessToken.error,
        statusCode: StatusCodes.UNAUTHORIZED,
      });
      return;
    }

    const payload = verifiedAccessToken.data;
    const hasValidPayload = (
      value: string | JwtPayload,
    ): value is JwtPayload & {
      user_id: string;
      full_name: string;
      role_name: string;
      position_name?: string;
      user_name: string;
    } => {
      return (
        typeof value !== "string" &&
        typeof value.user_id === "string" &&
        typeof value.full_name === "string" &&
        typeof value.role_name === "string" &&
        typeof value.user_name === "string" &&
        (value.position_name === undefined ||
          typeof value.position_name === "string")
      );
    };

    if (!payload || !hasValidPayload(payload)) {
      sendResponse(res, {
        success: false,
        message: "Invalid token payload",
        statusCode: StatusCodes.UNAUTHORIZED,
      });
      return;
    }

    const validRoles = requiredRoles.length
      ? (await prisma.userRole.findMany()).map((role) => role.role_name)
      : [];

    const invalidRoles = requiredRoles.filter(
      (role) => !validRoles.includes(role),
    );
    // console.log(invalidRoles)
    if (invalidRoles.length > 0) {
      const role_singular_plural = invalidRoles.length === 1 ? "role" : "roles";
      sendResponse(res, {
        success: false,
        statusCode: StatusCodes.FORBIDDEN,
        message: `Invlid ${role_singular_plural} detected: ${invalidRoles.join(", ")}`,
      });
      return;
    }

    const user = await prisma.user.findUnique({
      where: {
        id: payload.user_id,
      },
      include: {
        position: true,
      },
    });
    if (!user) {
      throw new AppError("Please login", StatusCodes.UNAUTHORIZED);
    }
    if (user.active_status === "INACTIVE") {
      sendResponse(res, {
        success: false,
        statusCode: StatusCodes.FORBIDDEN,
        message: "User is inactive",
      });
      return;
    }

    if (
      user.role_name !== payload.role_name ||
      (requiredRoles.length > 0 &&
        !requiredRoles.includes(user.role_name ?? ""))
    ) {
      sendResponse(res, {
        success: false,
        message: "You do not have permission to access this resource",
        statusCode: StatusCodes.FORBIDDEN,
      });
      return;
    }

    req.user = {
      user_id: user.id,
      full_name: user.full_name,
      role_name: user.role_name ?? payload.role_name,
      position_name:
        user.position?.position_name ?? payload.position_name ?? "",
      user_name: user.user_name ?? payload.user_name,
    };
    next();
  });
};
