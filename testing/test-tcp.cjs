require("dotenv").config();

const pg = require("pg");

const { Pool } = pg;

const hostname =
  "ep-still-lake-axm7mt2r.c-4.us-east-2.aws.neon.tech";

const url = new URL(process.env.NEON_DB_LINK_DIRECT);

const pool = new Pool({
  host: "16.59.10.57",
  port: 5432,
  user: decodeURIComponent(url.username),
  password: decodeURIComponent(url.password),
  database: url.pathname.slice(1),

  ssl: {
    rejectUnauthorized: true,
    servername: hostname,
  },

  connectionTimeoutMillis: 10000,
});

async function testDatabase() {
  try {
    console.log("Testing pg with fixed IPv4...");

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