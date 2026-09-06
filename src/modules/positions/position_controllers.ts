import { NextFunction, Request, Response } from "express";
import { catchAsync } from "../../utils/catchAsync.js";
import { AppError } from "../../utils/appError.js";
import { StatusCodes } from "http-status-codes";
import { positionServices } from "./position_services.js";
import { sendResponse } from "../../utils/sendResponse.js";
import { ICreatePosition } from "./position_interfaces.js";

const createPosition = catchAsync(
  async (req: Request, res: Response, next: NextFunction) => {
    const payload: ICreatePosition = req.body;
    const { position_name, role_name } = payload;
    if (!position_name || !role_name || typeof position_name !== "string" || typeof role_name !== "string" || position_name.trim() === "" || role_name.trim() === "" ) {
      throw new AppError("Invalid or missing field_values.", StatusCodes.BAD_REQUEST);
    }
    const result = await positionServices.createPosition(payload);
    sendResponse(res, {
      success: true,
      statusCode: StatusCodes.CREATED,
      message: "Position created successfully.",
      data: result,
    });
  },
);

const deletePosition = catchAsync(
  async (req: Request, res: Response, next: NextFunction) => {
    const { position_name } = req.body;
    if (
      !position_name ||
      Array.isArray(position_name) ||
      typeof position_name !== "string" ||
      position_name.trim() === ""
    ) {
      throw new AppError("Invalid position name", StatusCodes.BAD_REQUEST);
    }
    await positionServices.deletePosition(position_name);
    sendResponse(res, {
      success: true,
      statusCode: StatusCodes.OK,
      message: "Position deleted successfully.",
    });
  },
);

const getAllPositions = catchAsync(
  async (req: Request, res: Response, next: NextFunction) => {
    const allPositions = await positionServices.getAllPositions();
    sendResponse(res, {
      success: true,
      statusCode: StatusCodes.OK,
      message: "All Positions retrieved successfully.",
      data: allPositions,
    });
  },
);

const updatePosition = catchAsync(
  async (req: Request, res: Response, next: NextFunction) => {},
);
export const positionControllers = {
  createPosition,
  deletePosition,
  getAllPositions,
  updatePosition,
};
