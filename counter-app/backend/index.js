require('dotenv').config();
const express = require('express');
const mysql   = require('mysql2/promise');
const app = express();
app.use(express.json());

let pool;
(async () => {
  pool = await mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
    waitForConnections: true,
    connectionLimit: 10
  });
  // ensure table
  await pool.query(`
    CREATE TABLE IF NOT EXISTS counter (
      id INT PRIMARY KEY AUTO_INCREMENT,
      value INT NOT NULL DEFAULT 0
    );
  `);
  // init row
  await pool.query(`INSERT IGNORE INTO counter (id, value) VALUES (1,0)`);
})();

app.get('/api/count', async (_, res) => {
  const [rows] = await pool.query(`SELECT value FROM counter WHERE id=1`);
  res.json({ count: rows[0].value });
});

app.post('/api/increment', async (_, res) => {
  await pool.query(`UPDATE counter SET value = value + 1 WHERE id=1`);
  const [rows] = await pool.query(`SELECT value FROM counter WHERE id=1`);
  res.json({ count: rows[0].value });
});

const port = process.env.PORT || 3001;
app.listen(port, ()=> console.log("port:",port));