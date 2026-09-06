import { StatusCodes } from "http-status-codes";
import { prisma } from "../../lib/prisma.js";
import { AppError } from "../../utils/appError.js";
import { IDeleteClassName, IUpdateClassName } from "./class_interfaces.js";

const createClass = async (class_name: string) => {
  const cleanclass_name = class_name.trim().toUpperCase();
  const existingclass_name = await prisma.class.findUnique({
    where: {
      class_name: cleanclass_name,
    },
  });
  if (existingclass_name) {
    throw new AppError(
      "Provided class name already exists",
      StatusCodes.BAD_REQUEST,
    );
  }
  const createdclass_name = await prisma.class.create({
    data: {
      class_name: cleanclass_name,
    },
  });
  return createdclass_name;
};

const getAllClassNames= async()=>{
  const allClasses = await prisma.class.findMany();
  const allClassNames = allClasses.map(single=>single.class_name)
  return allClassNames;
};

const updateClassName= async(payload:IUpdateClassName)=>{
  const {present_class_name, new_class_name}=payload;
  const clean_present_class_name= present_class_name.trim().toUpperCase();
  const clean_new_class_name= new_class_name.trim().toUpperCase();
  const existing = await prisma.class.findUnique({
    where:{
      class_name: clean_present_class_name
    }
  });
  if(!existing){
    throw new AppError("Provided present class name not exists.",StatusCodes.BAD_REQUEST)
  };
  const updatedClassName = await prisma.class.update({
    where: {
      class_name: clean_present_class_name
    },
    data:{
      class_name: clean_new_class_name
    }
  });
  return updatedClassName
};

const deleteClassName = async(payload:IDeleteClassName)=>{
  const {class_name}=payload;
  const clean_class_name = class_name.trim().toUpperCase();
  const existing= await prisma.class.findUnique({
    where:{
      class_name: clean_class_name
    }
  });
  if(!existing){
    throw new AppError("Provided class name not exists.", StatusCodes.BAD_REQUEST)
  };
  await prisma.class.delete({
    where:{
      class_name: clean_class_name
    }
  });
}
export const classServices = {
  createClass,
  getAllClassNames,
  updateClassName,
  deleteClassName
};
