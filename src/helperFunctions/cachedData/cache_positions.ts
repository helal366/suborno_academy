import { prisma } from "../../lib/prisma.js";
interface ICachePosition{
    id: string,
    position_name: string
}

let cacheValidPositions: Promise<ICachePosition[]> | null = null;

export const getValidPositions = async():Promise<ICachePosition[]> =>{
    if(!cacheValidPositions){
        cacheValidPositions=(async()=>{
            try {
                 return await prisma.userPosition.findMany({select: {id: true, position_name: true}});
                
            } catch (error) {
                cacheValidPositions=null;
                throw error
            }
        })()
    }
    return cacheValidPositions
}

// get position names
export const getValidPositionNames = async()=>{
    const positions = await getValidPositions();
    return positions.map((position)=>position.position_name)
}

// if position update or new position create
export const clearCachePositions = ():void=>{
    cacheValidPositions = null;
}