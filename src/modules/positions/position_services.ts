import { StatusCodes } from "http-status-codes";
import { prisma } from "../../lib/prisma.js";
import { AppError } from "../../utils/appError.js";
import { TPositionCreateZodSchema } from "./position_zod_validation.js";
import { clearCachePositions, getValidPositionNames} from "../../helperFunctions/cachedData/cache_positions.js";
import { getValidRoles } from "../../helperFunctions/cachedData/cache_roles.js";
import { ICacheRole } from "../../commonInterfaces/commonInterfaces.js";

const createPosition = async (payload: TPositionCreateZodSchema) => {
  const { position_name, role_name } = payload;
  const clean_position_name = position_name.toUpperCase();
  const clean_role_name = role_name.toUpperCase();

  // role existance check from cache
  const validRoles:ICacheRole[] = await getValidRoles();
  const existingRole = validRoles.find((singleRole)=> singleRole.role_name === clean_role_name)

  if (!existingRole) {
    throw new AppError("Invalid role provided.", StatusCodes.BAD_REQUEST);
  }

  // position existance check from cache
  const existingPositions:string[] = await getValidPositionNames()
  if (existingPositions.includes(clean_position_name)) {
    throw new AppError(`Position already exists`, StatusCodes.CONFLICT);
  }

  // create position with corresponding role
  const createdPosition = await prisma.userPosition.create({
    data: {
      position_name: clean_position_name,
      role_id: existingRole.id,
    },
  });

  clearCachePositions();
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
