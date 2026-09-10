import { ICacheRole } from "../../commonInterfaces/commonInterfaces.js";
import { prisma } from "../../lib/prisma.js";

let cacheValidRoles: Promise<ICacheRole[]> | null = null;
export const getValidRoles = async():Promise<ICacheRole[]> =>{
    if(!cacheValidRoles){
        cacheValidRoles = (async() =>{
            try {
                return  await prisma.userRole.findMany({select:{id: true, role_name: true}});               
            } catch (error) {
                cacheValidRoles=null;
                throw error 
            }
        } )()
            
    };
    return cacheValidRoles;
};

// get valid role names
export const getValidRoleNames=async(): Promise<string[]> =>{
    const rolesFromDB = await getValidRoles();
    return rolesFromDB.map((role)=> role.role_name)
}

// if role update or create new role
export const clearCacheRoles = ():void=>{
    cacheValidRoles = null;
}