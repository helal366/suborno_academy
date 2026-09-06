import { Router } from "express";
import { classControllers } from "./class_controllers.js";
import { userAuth } from "../../middlewares/userAuth.js";

export const classRouter:Router=Router();
classRouter.post("/create", userAuth("SUPER_ADMIN"), classControllers.createClass);
classRouter.get("/", classControllers.getAllClassNames );
classRouter.patch("/single_update", userAuth("SUPER_ADMIN"), classControllers.updateClassName);
classRouter.delete("/", userAuth("SUPER_ADMIN"), classControllers.deleteClassName);