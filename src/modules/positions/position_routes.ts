import { Router } from "express";
import { positionControllers } from "./position_controllers.js";
import { userAuth } from "../../middlewares/userAuth.js";

export const positionRouter:Router=Router();
positionRouter.post("/create", userAuth("SUPER_ADMIN"), positionControllers.createPosition);
positionRouter.delete("/delete", userAuth("SUPER_ADMIN"), positionControllers.deletePosition);
positionRouter.get("/", userAuth("SUPER_ADMIN", "ADMIN"), positionControllers.getAllPositions);
positionRouter.patch("/update", userAuth("SUPER_ADMIN"), positionControllers.updatePosition)  //incomplete
// 