import { NextFunction, Request, Response } from "express";
import { catchAsync } from "../utils/catchAsync.js";
import { jwtTokens } from "../utils/jwtTokens.js";
import { envVars } from "../configs/index.js";
import { sendResponse } from "../utils/sendResponse.js";
import { StatusCodes } from "http-status-codes";
import { prisma } from "../lib/prisma.js";
import { AppError } from "../utils/appError.js";

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
    const token = req.cookies.accessToken
      ? req.cookies.accessToken
      : req.headers.authorization?.startsWith("Bearer")
        ? req.headers.authorization.split(" ")[1]
        : req.headers.authorization;
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

    if (
      !verifiedAccessToken.data ||
      typeof verifiedAccessToken.data === "string"
    ) {
      sendResponse(res, {
        success: false,
        message: "Invalid token payload",
        statusCode: StatusCodes.UNAUTHORIZED,
      });
      return;
    }
    // if (!requiredRoles.length) {
    //   sendResponse(res, {
    //     success: false,
    //     message: "The Role is not defined.",
    //     statusCode: StatusCodes.FORBIDDEN,
    //   });
    //   return;
    // }
    const userRole = verifiedAccessToken.data.role_name;
    const validRoles = (await prisma.userRole.findMany()).map(
      (role) => role.role_name,
    );

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
    // console.log(validRoles)
    if (requiredRoles.length > 0 && !validRoles.includes(userRole)) {
      sendResponse(res, {
        success: false,
        message: "Credential Role is invalid",
        statusCode: StatusCodes.FORBIDDEN,
      });
      return;
    }

    const { user_id, full_name, role_name, position_name, user_name } =
      verifiedAccessToken.data;
    // console.log(verifiedAccessToken);
    const user = await prisma.user.findUnique({
      where: {
        id: user_id,
      },
      omit: {
        user_password: true,
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
    req.user = { user_id, full_name, role_name, position_name, user_name };
    next();
  });
};
