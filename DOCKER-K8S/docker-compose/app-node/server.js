const express = require("express");
const mysql = require("mysql2/promise");

const dbConfig = {
  host: process.env.DB_HOST || "localhost",
  user: process.env.DB_USER || "root",
  password: process.env.DB_PASSWORD || "",
  database: process.env.DB_NAME || "demonode",
};

const pool = mysql.createPool({
  ...dbConfig,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

const app = express();
const port = 80;

app.get("/", (req, res) => {
  res.send(`
    <h1>Hello Dockerfile (from jeremy) 👋</h1>
    <p><a href="/error">💥 Crash the container</a></p>
  `);
});

app.get("/demo", async (req, res) => {
  try {
    const [ rows ] = await pool.query("SELECT id, label FROM demo");
    const items = rows.map((r) => `<li>${r.id} - ${r.label}</li>`).join("");

    res.send(`<h1>Table</h1><ul>${ items }</ul>`);
  }

  catch (err) {
    console.error("MySQL Error:", err);
    res.status(500).send("Error on data retrieving...");
  }
});

app.get("/error", (req, res) => {
  console.log("💥 Crashing the process...");

  // Laisse le temps au client de recevoir la réponse
  res.status(500).send("💥 Crashing the container...");

  setTimeout(() => {
    process.exit(1);
  }, 100);
});

app.listen(port, "0.0.0.0", () => {
  console.log(`🚀 Server listening on 0.0.0.0:${port}`);
});
