import { prisma } from "../../lib/prisma.js";

let cachedRoles: string[] | null = null;
export const getValidRoles = async():Promise<string[]> =>{
    if(!cachedRoles){
        const rolesFromDB = await prisma.userRole.findMany({select:{role_name: true}});
        cachedRoles = rolesFromDB.map((role)=>role.role_name)
    };
    return cachedRoles;
};

// if role update
export const clearCacheRoles = async():Promise<void> =>{
    cachedRoles = null;
}