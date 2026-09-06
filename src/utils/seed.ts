import { prisma } from "../lib/prisma.js"

export const seedSuperAdmin=async()=>{
    try {
        const isSuperAdminExists = await prisma.user.findFirst({
            where:{
                role_name: "SUPER_ADMIN" 
            }
        });
        if(isSuperAdminExists){
           console.log("Super admin exists");
           return;
        }
        // const super_admin = await prisma.user.create({
        //   data: {
        //     full_name: "Faysal Ahmed",
        //     mobile_number: "01511556616",
        //     gender: "MALE",
        //     user_name: "01511556616",
        //     position: "PRINCIPAL"
        //   },
        // });
    } catch (error) {
        
    }
}