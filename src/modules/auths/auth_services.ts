import { StatusCodes } from "http-status-codes";
import { prisma } from "../../lib/prisma.js";
import { AppError } from "../../utils/appError.js";
import { IAuthLogin } from "./auth_interfaces.js";
import bcrypt from "bcryptjs";
import { JwtPayload, SignOptions } from "jsonwebtoken";
import { jwtTokens } from "../../utils/jwtTokens.js";
import { envVars } from "../../configs/index.js";
import { TAuthRegistrationPayload } from "./auth_zod_validation.js";
import {  getValidRoles} from "../../helperFunctions/cachedData/cache_roles.js";
import {  getValidPositions } from "../../helperFunctions/cachedData/cache_positions.js";
import { ICachePosition, ICacheRole } from "../../commonInterfaces/commonInterfaces.js";

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

// REGISTRATION
const authRegisterStaff= async(payload:TAuthRegistrationPayload)=>{
  const {full_name, mobile_number, email, position, role, ...otherFields}=payload
  const isExist = await prisma.user.findUnique({
    where: {user_full_name_mobile_unique:{full_name, mobile_number}}
  });

  // check required values
  if(isExist){
    throw new AppError("User already exists.", StatusCodes.CONFLICT);
  };
  if(!email){
    throw new AppError("Email is required", StatusCodes.NOT_FOUND);
  }
  if(!position){
    throw new AppError("Position not found", StatusCodes.NOT_FOUND);
  }
  if(!role){
    throw new AppError("Role not found.", StatusCodes.NOT_FOUND);
  };

  // check role is valid or not
  const validRoles:ICacheRole[] = await getValidRoles();
  const findRole = validRoles.find((singleRole)=>singleRole.role_name === role);
  if(!findRole){
    throw new AppError(`Provided Role ${role} is not valid`, StatusCodes.BAD_REQUEST)
  }

  // check position is valid or not
  const validPositions:ICachePosition[] = await getValidPositions();
  const findPosition = validPositions.find((singlePosition)=>singlePosition.position_name === position)
  if(!findPosition){
    throw new AppError(`Provided Position ${position} is not valid`, StatusCodes.BAD_REQUEST);
  }

  // set user name
  const usersWithSameMobileNumber = await prisma.user.count({where: {mobile_number}});
  let user_name:string;
  if(usersWithSameMobileNumber===0){
    user_name=mobile_number;
  }else{
    const len = usersWithSameMobileNumber;
    user_name = `${mobile_number}-${len}`;
  }

  // create password with helper function
  // const password = await createPassword();
  
  // CREATE USER
  const newUser = await prisma.user.create({
    data: {
      full_name, 
      mobile_number, 
      email, 
      position:{
        connect: {position_name: position, role_id: findRole.id}
      }, 
      ...otherFields,
      staff_profile: {
        create:{
          full_name,
          mobile_number, 
          current_position: {connect: {id: findPosition.id}},
          current_role: {connect:{id: findRole.id}}
        }
      }
    },
  })
}
export const authServices = {
  authLogin,
  authRegisterStaff
};
