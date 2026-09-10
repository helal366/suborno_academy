require("dotenv").config();

const net = require("node:net");
const pg = require("pg");

const { Pool } = pg;

console.log("Node autoSelectFamily:", net.getDefaultAutoSelectFamily());

net.setDefaultAutoSelectFamily(false);

console.log(
  "Node autoSelectFamily after change:",
  net.getDefaultAutoSelectFamily()
);

const pool = new Pool({
  connectionString: process.env.NEON_DB_LINK_DIRECT,

  ssl: {
    rejectUnauthorized: true,
    servername: "ep-still-lake-axm7mt2r.c-4.us-east-2.aws.neon.tech",
  },

  connectionTimeoutMillis: 10000,
});

async function testDatabase() {
  try {
    console.log("Testing pg with hostname...");

    const result = await pool.query("SELECT NOW()");

    console.log("✅ Query successful!");
    console.log(result.rows);
  } catch (error) {
    console.error("❌ Query failed:");
    console.error(error);
  } finally {
    await pool.end();
  }
}

testDatabase();