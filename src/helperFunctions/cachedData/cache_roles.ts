import { prisma } from "../../lib/prisma.js";
interface ICacheRole{
    id:string;
    role_name:string;
}

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
export const getValidRoleNames=async()=>{
    const rolesFromDB = await getValidRoles();
    return rolesFromDB.map((role)=> role.role_name)
}

// if role update or create new role
export const clearCacheRoles = ():void=>{
    cacheValidRoles = null;
}