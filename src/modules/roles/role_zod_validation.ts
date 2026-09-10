import z4 from "zod/v4";

export const roleCreateZodSchema = z4.object({
    role_name: z4.string("Invalid Role Name Format.").trim()
})

export type TRoleCreateZodSchema = z4.infer<typeof roleCreateZodSchema>