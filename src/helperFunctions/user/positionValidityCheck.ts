import { StatusCodes } from "http-status-codes";
import { prisma } from "../../lib/prisma.js";
import { AppError } from "../../utils/appError.js";

export const availablePositions = async () => {
  const positions = await prisma.userPosition.findMany();
  const positionsInArray: string[] = positions.map(
    (position) => position.position_name,
  );
  return positionsInArray as string[];
};

export const checkPositionValidity = async (position_name: string) => {
  const positionExists = await prisma.userPosition.findUnique({
    where: { position_name },
  });

  if (!positionExists) {
    throw new AppError(
      "Provided position is not valid",
      StatusCodes.BAD_REQUEST,
    );
  }
  return positionExists.role_name;
};
