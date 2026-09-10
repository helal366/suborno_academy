import z4 from "zod/v4";

export const positionCreateZodSchema=z4.object({
    position_name: z4.string("Invalid Position Name Format").trim(),
    role_name: z4.string("Invalid Role Name Format.").trim()
})

export type TPositionCreateZodSchema=z4.infer<typeof positionCreateZodSchema>