import { Router } from "express";
import { userControllers } from "./user_controllers.js";

export const userRouter:Router=Router(); 
userRouter.patch("/", userControllers.updateUser);

// 