import { StatusCodes } from "http-status-codes";
import { prisma } from "../../lib/prisma.js";
import { AppError } from "../../utils/appError.js";
import { ICreateUserRequest, IUpdateUserRequest } from "./user_interfaces.js";
// import { checkRoleValidity } from "../../helperFunctions/user/roleValidityCheck.js";
import { checkPositionValidity } from "../../helperFunctions/user/positionValidityCheck.js";
import { validateStrictBDMobile } from "../../helperFunctions/user/mobileNumberValidityCheck.js";
import bcrypt from "bcryptjs";
import { envVars } from "../../configs/index.js";

const createUser = async (payload: ICreateUserRequest) => {
  const mobileNumber = await validateStrictBDMobile(payload.mobile_number);
  const existingUser = await prisma.user.findUnique({
    where: {
      user_full_name_mobile_unique: {
        full_name: payload.full_name,
        mobile_number: mobileNumber,
      },
    },
    select: { id: true },
  });
  if (existingUser) {
    throw new AppError("User already exists.", StatusCodes.CONFLICT);
  }

  const existingCount = await prisma.user.count({
    where: {
      mobile_number: mobileNumber,
    },
  });

  const unique_user_name =
    existingCount === 0 ? mobileNumber : `${mobileNumber}-${existingCount + 1}`;
  // const clean_role_name = payload?.role_name ?payload.role_name.trim().toUpperCase() : null;
  const clean_position_name = payload.position_name.trim().toUpperCase();
  // role and position and mobile number validity check
  // if(clean_role_name){
  //   await checkRoleValidity(clean_role_name);
  // }
  const clean_role_name = await checkPositionValidity(clean_position_name);

  /**
 * const text = "abcdQ2ABefgh34CDijk56EFmnop78GHqsrst9QZJuvwxQ5KLyz87MNabcd98Pefgh76QRijk54STmnop32UVqrstQQWX";
let passwordString:string="";
const createpasswordString=(digit:number)=>{
    for(let i=0; i<digit; i++){
        const index = Math.floor(Math.random()*text.length);
        const random = text[index];
        passwordString+=random;
    }
    return passwordString
}
const password = createpasswordString(6)
console.log({ password });
 */
  const defaultPassword = payload.user_password || "sm1234ps";
  const hashedPassword = await bcrypt.hash(
    defaultPassword,
    Number(envVars.BCRYPT_SALT_ROUND),
  );

  const parsedDOB = payload.date_of_birth
    ? new Date(payload.date_of_birth)
    : null;

  // Use payload status or fallback to schema default (ACTIVE)
  const initialStatus = payload.active_status || "ACTIVE";
  const now = new Date();

  const position = await prisma.userPosition.findUnique({
    where: {
      position_name: clean_position_name,
    },
    select: {
      position_id: true,
      position_name: true,
    },
  });

  if (!position) {
    throw new AppError("Position not found.", StatusCodes.BAD_REQUEST);
  }
  const finalPayload = {
    ...payload,
    role_name: clean_role_name,
    position_id: position?.position_id,
    mobile_number: mobileNumber,
    date_of_birth: parsedDOB,
    user_name: unique_user_name,
    user_password: hashedPassword,
    active_status: initialStatus,
    nationality: "Bangladeshi",
  };

  const createdUser = await prisma.$transaction(async (tx) => {
    const user = await tx.user.create({
      data: finalPayload,
    });

    const activationHistoryData = {
      user_id: user.id,
      active_status: initialStatus,
      activation_time: initialStatus === "ACTIVE" ? now : null,
      inactivation_time: initialStatus === "INACTIVE" ? now : null,
    };
    await tx.userActiveInactiveHistory.create({
      data: activationHistoryData,
    });
    return user;
  });

  const { user_password, ...secureUser } = createdUser;
  return secureUser;
};

const updateUser = async (payload: IUpdateUserRequest) => {
  return null;
};
export const userServices = {
  createUser,
  updateUser,
};
