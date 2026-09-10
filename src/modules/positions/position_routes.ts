import { Router } from "express";
import { positionControllers } from "./position_controllers.js";
import { userAuth } from "../../middlewares/userAuth.js";
import { validateZodSchema } from "../../middlewares/validateZodSchema.js";
import { positionCreateZodSchema } from "./position_zod_validation.js";

export const positionRouter: Router = Router();
positionRouter.post(
  "/create",
  validateZodSchema(positionCreateZodSchema),
//   userAuth("SUPER_ADMIN"),
  positionControllers.createPosition,
);
positionRouter.delete(
  "/delete",
  userAuth("SUPER_ADMIN"),
  positionControllers.deletePosition,
);
positionRouter.get(
  "/",
  userAuth("SUPER_ADMIN", "ADMIN"),
  positionControllers.getAllPositions,
);
positionRouter.patch(
  "/update",
  userAuth("SUPER_ADMIN"),
  positionControllers.updatePosition,
); //incomplete
//
