const express = require("express");

const app = express();
const port = 80;

app.get("/", (req, res) => {
  res.send(`
    <h1>Hello Dockerfile 👋</h1>
    <p><a href="/error">💥 Crash the container</a></p>
  `);
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
