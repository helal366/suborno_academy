import { StatusCodes } from "http-status-codes";
import { prisma } from "../../lib/prisma.js";
import { AppError } from "../../utils/appError.js";

const createResponsibility = async (responsibility_name: string) => {
  const cleanResponsibility = responsibility_name.trim().toUpperCase();
  const existingresponsibility_name =
    await prisma.teacherHonourableResponsibility.findUnique({
      where: {
        responsibility_name: cleanResponsibility,
      },
    });
  if (existingresponsibility_name) {
    throw new AppError("Responsibility already exists.", StatusCodes.CONFLICT);
  }
  const responsilibity = prisma.teacherHonourableResponsibility.create({
    data: {
      responsibility_name: cleanResponsibility,
    },
  });
  return responsilibity;
};

const getAllResponsibilities = async () => {
  const allResponsibilites =
    await prisma.teacherHonourableResponsibility.findMany();
  const responsibilitiesInArray = allResponsibilites.map(
    (responsibility) => responsibility.responsibility_name,
  );
  return {
    responsibilitiesInArray,
    allResponsibilites,
  };
};

const getSingleResponsibilityDetails = async (responsibility_name: string) => {
  const cleanResponsibility = responsibility_name.trim().toUpperCase();
  const singleResponsibility =
    await prisma.teacherHonourableResponsibility.findUniqueOrThrow({
      where: {
        responsibility_name: cleanResponsibility,
      },
    });
  return singleResponsibility;
};

const deleteSingleResponsibility = async (responsibility_name: string) => {
  const cleanResponsibility = responsibility_name.trim().toUpperCase();
  const existingresponsibility_name =
    await prisma.teacherHonourableResponsibility.findUnique({
      where: {
        responsibility_name: cleanResponsibility,
      },
    });
  if (!existingresponsibility_name) {
    throw new AppError("Responsibility not exists.", StatusCodes.BAD_REQUEST);
  }
  await prisma.teacherHonourableResponsibility.delete({
    where: {
      responsibility_name: cleanResponsibility,
    },
  });
};

const updateSingleResponsibility = async (
  presentResponsibility: string,
  updateResponsibility: string,
) => {
  const cleanPresentResponsibility = presentResponsibility.trim().toUpperCase();
  const cleanUpdateResponsibility = updateResponsibility.trim().toUpperCase();
  await prisma.teacherHonourableResponsibility.findUniqueOrThrow({
    where: {
      responsibility_name: cleanPresentResponsibility,
    },
  });
  const updatedResponsibility =
    await prisma.teacherHonourableResponsibility.update({
      where: {
        responsibility_name: cleanPresentResponsibility,
      },
      data: {
        responsibility_name: cleanUpdateResponsibility,
      },
    });
  return updatedResponsibility;
};
export const responsibilityServices = {
  createResponsibility,
  getAllResponsibilities,
  getSingleResponsibilityDetails,
  deleteSingleResponsibility,
  updateSingleResponsibility,
};
