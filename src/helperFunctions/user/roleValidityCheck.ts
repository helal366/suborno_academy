import { StatusCodes } from "http-status-codes";
import { prisma } from "../../lib/prisma.js";
import { AppError } from "../../utils/appError.js";

export const availableRoles = async () => {
  const roles = await prisma.userRole.findMany();
  const rolesInArray: string[] = roles.map((role) => role.role_name);
  return rolesInArray as string[];
};

export const checkRoleValidity = async (role_name: string) => {
  // Directly count matching entries via index without pulling table arrays
  const roleExists = await prisma.userRole.count({
    where: { role_name },
  });

  if (roleExists === 0) {
    throw new AppError("Provided role is not valid", StatusCodes.BAD_REQUEST);
  }
};
