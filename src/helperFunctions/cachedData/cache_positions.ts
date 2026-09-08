import { prisma } from "../../lib/prisma.js";

let cachePositions: string[] | null = null;

export const getValidPositions = async():Promise<string[]>=>{
    if(!cachePositions){
        const positionsFromDB = await prisma.userPosition.findMany({select: {position_name: true}});
        cachePositions = positionsFromDB.map((position)=> position.position_name);
    }
    return cachePositions
}

// if position update
export const clearCachePositions = async():Promise<void>=>{
    cachePositions = null;
}