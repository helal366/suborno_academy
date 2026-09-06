import { NextFunction, Request, Response } from "express";
import { catchAsync } from "../../utils/catchAsync.js";
import { sendResponse } from "../../utils/sendResponse.js";
import { StatusCodes } from "http-status-codes";
import { AppError } from "../../utils/appError.js";
import { responsibilityServices } from "./responsibilities_services.js";

const createResponsibility = catchAsync(
  async (req: Request, res: Response, next: NextFunction) => {
    const { responsibility_name } = req.body;
    if (
      !responsibility_name ||
      Array.isArray(responsibility_name) ||
      typeof responsibility_name !== "string" ||
      responsibility_name.trim() === ""
    ) {
      throw new AppError(
        "Invalid Responsibility Name",
        StatusCodes.BAD_REQUEST,
      );
    }
    const result =
      await responsibilityServices.createResponsibility(responsibility_name);
    sendResponse(res, {
      success: true,
      statusCode: StatusCodes.CREATED,
      message: "Responsibility created successfully.",
      data: result,
    });
  },
);

const getAllResponsibilities = catchAsync(
  async (req: Request, res: Response, next: NextFunction) => {
    const result = await responsibilityServices.getAllResponsibilities();
    sendResponse(res, {
      success: true,
      statusCode: StatusCodes.CREATED,
      message: "Responsibilities retrieved successfully.",
      data: result,
    });
  },
);

const getSingleResponsibilityDetails = catchAsync(
  async (req: Request, res: Response, next: NextFunction) => {
    const { responsibility_name } = req.body;
    if (
      !responsibility_name ||
      Array.isArray(responsibility_name) ||
      typeof responsibility_name !== "string" ||
      responsibility_name.trim() === ""
    ) {
      throw new AppError(
        "Invalid Responsibility Name",
        StatusCodes.BAD_REQUEST,
      );
    }
    const result =
      await responsibilityServices.getSingleResponsibilityDetails(
        responsibility_name,
      );
    sendResponse(res, {
      success: true,
      statusCode: StatusCodes.CREATED,
      message: "Responsibility retrieved successfully.",
      data: result,
    });
  },
);

const deleteSingleResponsibility = catchAsync(
  async (req: Request, res: Response, next: NextFunction) => {
    const { responsibility_name } = req.body;
    if (
      !responsibility_name ||
      Array.isArray(responsibility_name) ||
      typeof responsibility_name !== "string" ||
      responsibility_name.trim() === ""
    ) {
      throw new AppError(
        "Invalid Responsibility Name",
        StatusCodes.BAD_REQUEST,
      );
    }
    await responsibilityServices.deleteSingleResponsibility(
      responsibility_name,
    );
    sendResponse(res, {
      success: true,
      statusCode: StatusCodes.CREATED,
      message: "Responsibility deleted successfully.",
    });
  },
);

const updateSingleResponsibility = catchAsync(
  async (req: Request, res: Response, next: NextFunction) => {
    const { presentResponsibility, updateResponsibility } = req.body;
    if (
      !presentResponsibility ||
      Array.isArray(presentResponsibility) ||
      typeof presentResponsibility !== "string" ||
      presentResponsibility.trim() === ""
    ) {
      throw new AppError(
        "Invalid Present Responsibility Name",
        StatusCodes.BAD_REQUEST,
      );
    }
    if (
      !updateResponsibility ||
      Array.isArray(updateResponsibility) ||
      typeof updateResponsibility !== "string" ||
      updateResponsibility.trim() === ""
    ) {
      throw new AppError(
        "Invalid Update Responsibility Name",
        StatusCodes.BAD_REQUEST,
      );
    }
    const result = await responsibilityServices.updateSingleResponsibility(
      presentResponsibility,
      updateResponsibility,
    );
    sendResponse(res, {
      success: true,
      statusCode: StatusCodes.CREATED,
      message: "Responsibility updated successfully.",
      data: result,
    });
  },
);

export const responsibilityController = {
  createResponsibility,
  getAllResponsibilities,
  getSingleResponsibilityDetails,
  deleteSingleResponsibility,
  updateSingleResponsibility,
};
