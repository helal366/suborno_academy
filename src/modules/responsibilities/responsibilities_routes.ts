import { Router } from "express";
import { responsibilityController } from "./responsibilities_controllers.js";
import { userAuth } from "../../middlewares/userAuth.js";

export const responsibilityRouter:Router=Router();
responsibilityRouter.post("/create", userAuth("SUPER_ADMIN"), responsibilityController.createResponsibility);
responsibilityRouter.get("/", userAuth("SUPER_ADMIN"), responsibilityController.getAllResponsibilities);
responsibilityRouter.get("/singleResponsibility", userAuth("SUPER_ADMIN"), responsibilityController.getSingleResponsibilityDetails);
responsibilityRouter.delete("/", userAuth("SUPER_ADMIN"), responsibilityController.deleteSingleResponsibility);
responsibilityRouter.patch("/", userAuth("SUPER_ADMIN"), responsibilityController.updateSingleResponsibility);
// userAuth("SUPER_ADMIN"),