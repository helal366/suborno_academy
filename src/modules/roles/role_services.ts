import { StatusCodes } from "http-status-codes";
import { prisma } from "../../lib/prisma.js";
import { AppError } from "../../utils/appError.js";
import { TRoleCreateZodSchema } from "./role_zod_validation.js";
import { clearCacheRoles, getValidRoleNames } from "../../helperFunctions/cachedData/cache_roles.js";

const createRole = async (payload: TRoleCreateZodSchema) => {
  const clean_role_name = payload.role_name.toUpperCase();
  
  // check role existance
  const validRoles = await getValidRoleNames();
  if (validRoles.includes(clean_role_name)) {
    throw new AppError("Role already exists", StatusCodes.CONFLICT);
  }

  // create role
  const createdRole = await prisma.userRole.create({
    data: {
      role_name: clean_role_name,
    },
  });

  // clear cache roles
  clearCacheRoles();

  return createdRole;
};

const deleteRole = async (roleName: string) => {
  const cleanRoleName = roleName.trim().toUpperCase();
  const existingRole = await prisma.userRole.findUnique({
    where: { role_name: cleanRoleName },
  });
  if (!existingRole) {
    throw new AppError("Role not found", StatusCodes.NOT_FOUND);
  }
  await prisma.userRole.delete({
    where: { role_name: cleanRoleName },
  });
};
const getAllRoles = async () => {
  const allRetrievedRoles = await prisma.userRole.findMany();
  const allRoles = allRetrievedRoles.map(
    (singleRoleData) => singleRoleData.role_name,
  );
  return allRoles;
};
const updateRole = async (roleName: string) => {};
export const roleServices = {
  createRole,
  deleteRole,
  getAllRoles,
  updateRole,
};
