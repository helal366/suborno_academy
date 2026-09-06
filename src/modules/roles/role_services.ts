import { StatusCodes } from "http-status-codes";
import { prisma } from "../../lib/prisma.js";
import { AppError } from "../../utils/appError.js";

const createRole = async (role_name: string) => {
  const clean_role_name = role_name.trim().toUpperCase();
  const existingRole = await prisma.userRole.findUnique({
    where: {
      role_name: clean_role_name,
    },
  });
  if (existingRole) {
    throw new AppError("Role already exists", StatusCodes.CONFLICT);
  }
  const createdRole = await prisma.userRole.create({
    data: {
      role_name: clean_role_name,
    },
  });
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
