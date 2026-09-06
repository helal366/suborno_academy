import { NextFunction, Request, Response } from "express";
import { catchAsync } from "../../utils/catchAsync.js";
import { authServices } from "./auth_services.js";
import { IAuthLogin } from "./auth_interfaces.js";
import { sendResponse } from "../../utils/sendResponse.js";
import { StatusCodes } from "http-status-codes";

const authLogin=catchAsync(async(req:Request, res:Response, next:NextFunction)=>{
    const payload = req.body as IAuthLogin;
    const {accessToken, refreshToken} = await authServices.authLogin(payload);
    res.cookie("accessToken",accessToken,{
        httpOnly:true,
        secure:false,
        sameSite:"none",
        maxAge:1000*60*60*24*1 // 1 day
    })
    res.cookie("refreshToken",refreshToken,{
        httpOnly:true,
        secure:false,   
        sameSite:"none",
        maxAge:1000*60*60*24*7 // 7 days
    })
    sendResponse(res, {
        success: true,
        statusCode: StatusCodes.OK,
        message: "Credential login successful.",
        data: {accessToken, refreshToken}
    })
});
export const authControllers={
    authLogin
}