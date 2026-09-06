import { StatusCodes } from "http-status-codes";
import { prisma } from "../../lib/prisma.js";
import { AppError } from "../../utils/appError.js";
import { ICreatePosition } from "./position_interfaces.js";

const createPosition = async (payload: ICreatePosition) => {
  const { position_name, role_name } = payload;
  const clean_position_name = position_name.trim().toUpperCase();
  const clean_role_name = role_name.trim().toUpperCase();
  const isRoleExists =
    (await prisma.userRole.count({
      where: {
        role_name: clean_role_name,
      },
    })) > 0;
  if (!isRoleExists) {
    throw new AppError("Invalid role provided.", StatusCodes.BAD_REQUEST);
  }
  const existing = await prisma.userPosition.findUnique({
    where: {
      position_name: clean_position_name,
    },
  });
  if (existing) {
    throw new AppError(`Position already exists`, StatusCodes.CONFLICT);
  }
  const createdPosition = await prisma.userPosition.create({
    data: {
      position_name: clean_position_name,
      role_name: clean_role_name,
    },
  });
  return createdPosition;
};

const deletePosition = async (position_name: string) => {
  const clean_position_name = position_name.trim().toUpperCase();
  const existing = await prisma.userPosition.findUnique({
    where: {
      position_name: clean_position_name,
    },
  });
  if (!existing) {
    throw new AppError("Position not found.", StatusCodes.BAD_REQUEST);
  }
  await prisma.userPosition.delete({
    where: {
      position_name: clean_position_name,
    },
  });
};

const getAllPositions = async () => {
  const allRetrievedPositions = await prisma.userPosition.findMany();
  const allPositions = allRetrievedPositions.map(
    (singlePosition) => singlePosition.position_name,
  );
  return allPositions;
};

const updatePosition = async () => {};
export const positionServices = {
  createPosition,
  deletePosition,
  getAllPositions,
  updatePosition,
};
