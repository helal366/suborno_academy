import { Router } from "express";
import { authControllers } from "./auth_controllers.js";
import { validateZodSchema } from "../../middlewares/validateZodSchema.js";
import { authRegistrationZodSchema } from "./auth_zod_validation.js";

export const authRouter:Router=Router();
authRouter.post("/login", authControllers.authLogin);
authRouter.post("/user_register", validateZodSchema(authRegistrationZodSchema), authControllers.authRegister);