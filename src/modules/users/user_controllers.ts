import { NextFunction, Request, Response } from "express";
import { catchAsync } from "../../utils/catchAsync.js";
import { IUpdateUserRequest } from "./user_interfaces.js";
import { sendResponse } from "../../utils/sendResponse.js";
import { StatusCodes } from "http-status-codes";
import { AppError } from "../../utils/appError.js";
import { userServices } from "./user_services.js";


const updateUser=catchAsync(async(req:Request, res:Response, next:NextFunction)=>{
    const payload = req.body as IUpdateUserRequest;

    const providedFields = Object.keys(payload) as (keyof IUpdateUserRequest)[];
    if(providedFields.length ===0){
        throw new AppError("At least one field must be provided for update.", StatusCodes.BAD_REQUEST)
    }

    const invalidFields = providedFields.filter(field=>{
        const value = payload[field];
        return (
            (typeof value === "string" && value === "") || (Array.isArray(value))
        )
    });

    if(invalidFields.length >0 ){
        throw new AppError(`Invalid value of fields: ${invalidFields.join(", ")}`, StatusCodes.BAD_REQUEST)
    }

    const result = await userServices.updateUser(payload);

    sendResponse(res, {
        success: true,
        statusCode: StatusCodes.OK,
        message: "Your profile has been updated successfully.",
        data: result
    });
})
export const userControllers={
    updateUser
}