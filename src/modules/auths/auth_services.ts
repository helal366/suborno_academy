import { StatusCodes } from "http-status-codes";
import { prisma } from "../../lib/prisma.js";
import { AppError } from "../../utils/appError.js";
import { IAuthLogin } from "./auth_interfaces.js";
import bcrypt from "bcryptjs";
import { JwtPayload, SignOptions } from "jsonwebtoken";
import { jwtTokens } from "../../utils/jwtTokens.js";
import { envVars } from "../../configs/index.js";
import { TAuthRegistrationPayload } from "./auth_zod_validation.js";

const authLogin = async (payload: IAuthLogin) => {
  const { user_name, user_password } = payload;
  const existingAuth = await prisma.user.findUnique({
    where: {
      user_name,
    },
    include: {
      position: true,
    },
  });
  if (!existingAuth) {
    throw new AppError("No credential exists.", StatusCodes.BAD_REQUEST);
  }
  if (existingAuth.active_status === "INACTIVE") {
    throw new AppError("Inactive user.", StatusCodes.UNAUTHORIZED);
  }
  const isPasswordValid = await bcrypt.compare(
    user_password,
    existingAuth.user_password as string,
  );
  if (!isPasswordValid) {
    throw new AppError("Wrong password", StatusCodes.UNAUTHORIZED);
  }
  // console.log("jwt access tokens: ",envVars.JWT_ACCESS_EXPIRES_IN)
  const jwtPayload: JwtPayload = {
    user_id: existingAuth.id,
    full_name: existingAuth.full_name,
    role_name: existingAuth.role_name,
    position_name: existingAuth.position?.position_name,
    user_name: existingAuth.user_name,
  };
  // console.log({jwtPayload})
  const accessToken = jwtTokens.createToken(
    jwtPayload,
    envVars.JWT_ACCESS_SECRET,
    envVars.JWT_ACCESS_EXPIRES_IN as SignOptions,
  );

  const refreshToken = jwtTokens.createToken(
    jwtPayload,
    envVars.JWT_REFRESH_SECRET,
    envVars.JWT_REFRESH_EXPIRES_IN as SignOptions,
  );
  const validRoles = (await prisma.userRole.findMany()).map(
    (role) => role.role_name,
  );
  // console.log({validRoles})
  return { accessToken, refreshToken };
};

const authRegister= async(payload:TAuthRegistrationPayload)=>{
  const {full_name, mobile_number}=payload
  const isExist = await prisma.user.findUnique({
    where:{full_name, mobile_number}
  });
  if(!isExist){
    throw new AppError("User already exists.", StatusCodes.CONFLICT)
  };
  
}
export const authServices = {
  authLogin,
  authRegister
};
