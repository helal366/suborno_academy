import { Router } from "express";
import { roleController } from "./role_controllers.js";
import { userAuth } from "../../middlewares/userAuth.js";
import { validateZodSchema } from "../../middlewares/validateZodSchema.js";
import { roleCreateZodSchema } from "./role_zod_validation.js";

export const roleRouter:Router=Router();

roleRouter.post("/create", 
    // userAuth("SUPER_ADMIN"), 
    validateZodSchema(roleCreateZodSchema),
    roleController.createRole);
roleRouter.delete("/delete", userAuth("SUPER_ADMIN"), roleController.deleteRole);
roleRouter.get("/", userAuth("SUPER_ADMIN"), roleController.getAllRoles);
roleRouter.patch("/update", userAuth("SUPER_ADMIN"), roleController.updateRole) //incomplete

// userAuth("SUPER_ADMIN"),