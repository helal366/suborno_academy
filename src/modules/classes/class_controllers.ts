import { NextFunction, Request, Response } from "express";
import { catchAsync } from "../../utils/catchAsync.js";
import { AppError } from "../../utils/appError.js";
import { StatusCodes } from "http-status-codes";
import { classServices } from "./class_services.js";
import { sendResponse } from "../../utils/sendResponse.js";
import { IDeleteClassName, IUpdateClassName } from "./class_interfaces.js";

const createClass = catchAsync(
  async (req: Request, res: Response, next: NextFunction) => {
    const class_name = req.body.class_name;
    if (!class_name) {
      throw new AppError("Class name is required.", StatusCodes.BAD_REQUEST);
    }
    if (
      Array.isArray(class_name) ||
      typeof class_name !== "string" ||
      class_name.trim() === ""
    ) {
      throw new AppError("Invalid class name", StatusCodes.BAD_REQUEST);
    }
    const result = await classServices.createClass(class_name);
    sendResponse(res, {
      success: true,
      statusCode: StatusCodes.CREATED,
      message: `Class name: ${result.class_name} created successfully.`,
      data: result,
    });
  },
);

const getAllClassNames = catchAsync(async(req: Request, res: Response, next: NextFunction)=>{
  const result = await classServices.getAllClassNames();
  sendResponse(res, {
    success: true,
    statusCode: StatusCodes.OK,
    message: "All class names retrieved successfully.",
    data: result
  })
});

const updateClassName=catchAsync(async(req: Request, res: Response, next: NextFunction)=>{
  const payload = req.body as IUpdateClassName;
  const result = await classServices.updateClassName(payload);
  sendResponse(res, {
    success: true,
    statusCode: StatusCodes.OK,
    message: `Class name updated successfully.`,
    data: result
  })
});

const deleteClassName=catchAsync(async(req:Request, res: Response, next:NextFunction)=>{
  const payload = req.body as IDeleteClassName;
  await classServices.deleteClassName(payload);
  sendResponse(res, {
    success:true,
    statusCode: StatusCodes.OK,
    message: `Class name: ${payload.class_name} deleted successfully.`
  })
})
export const classControllers = {
  createClass,
  getAllClassNames,
  updateClassName,
  deleteClassName
};
