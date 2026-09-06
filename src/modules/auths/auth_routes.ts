import { Router } from "express";
import { authControllers } from "./auth_controllers.js";

export const authRouter:Router=Router();
authRouter.post("/login", authControllers.authLogin)