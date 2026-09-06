import { NextFunction, Request, Response } from "express";
import { catchAsync } from "../../utils/catchAsync.js";
import { ICreateUserRequest, IUpdateUserRequest } from "./user_interfaces.js";
import { sendResponse } from "../../utils/sendResponse.js";
import { StatusCodes } from "http-status-codes";
import { AppError } from "../../utils/appError.js";
import { userServices } from "./user_services.js";

const createUser=catchAsync(async(req:Request, res:Response, next:NextFunction)=>{
    // if(!req.user){
    //     throw new AppError("Please login", StatusCodes.UNAUTHORIZED)
    // }
    // const userRole = req.user?.role_name;
    const payload=req.body as ICreateUserRequest;
    const requiredFields:(keyof ICreateUserRequest)[]=["full_name", "mobile_number", "position_name", "gender"]
    const missingFields=requiredFields.filter(field=>{
        const value = payload[field];
        return (value===undefined || value ===null || (typeof value === "string" && value.trim()==="" || Array.isArray(value)))
    });
    if(missingFields.length > 0){
        throw new AppError(`${missingFields.join(", ")} required`,StatusCodes.BAD_REQUEST)
    }
    const result = await userServices.createUser(payload)
    sendResponse(res,{
        success: true,
        statusCode:StatusCodes.CREATED,
        message: "User created successfully.",
        data: result
    })
});

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
    createUser,
    updateUser
}