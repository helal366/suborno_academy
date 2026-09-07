import cookieParser from "cookie-parser";
import express, { Application, Request, Response } from "express";
import cors from "cors";
import { html } from "./utils/html.js";
import { notFound } from "./middlewares/notFound.js";
import { globalErrorHandler } from "./middlewares/globalErrorHandler.js";
import { roleRouter } from "./modules/roles/role_routes.js";
import { positionRouter } from "./modules/positions/position_routes.js";
import { responsibilityRouter } from "./modules/responsibilities/responsibilities_routes.js";
import { userRouter } from "./modules/users/user_routes.js";
import { authRouter } from "./modules/auths/auth_routes.js";
import { classRouter } from "./modules/classes/class_routes.js";

const app:Application = express();
app.use(cors())
app.use(express.json());
app.use(express.urlencoded({extended:true}));
app.use(cookieParser())
app.get("/", (req:Request,res:Response)=>{
    res.send(html)
});
app.use("/api/v1/smps/auth", authRouter);
app.use("/api/v1/smps/user", userRouter);
app.use("/api/v1/smps/role", roleRouter);
app.use("/api/v1/smps/position", positionRouter);
app.use("/api/v1/smps/responsibillity", responsibilityRouter);
app.use("/api/v1/smps/class", classRouter)
app.use(notFound);
app.use(globalErrorHandler);
export default app;