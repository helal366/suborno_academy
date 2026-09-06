import "dotenv/config";
import pg from "pg";
import { PrismaPg } from "@prisma/adapter-pg";
import { PrismaClient } from "#db-client"; // Automatically maps to client.ts / client.js

const { Pool } = pg;
const pool = new Pool({ connectionString: process.env.NEON_DB_LINK });
const adapter = new PrismaPg(pool);

export const prisma = new PrismaClient({ adapter });
