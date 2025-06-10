// server.js
const express = require('express');
const path = require('path');
const sum = require('./sum');

const app = express();
const port = process.env.PORT || 3000;

app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));

app.post('/api/sum', (req, res) => {
  const { a, b } = req.body;
  const result = sum(Number(a), Number(b));
  res.json({ result });
});

// only listen when run directly
if (require.main === module) {
  app.listen(port, () => {
    console.log(`🚀 Server listening on http://localhost:${port}`);
  });
}
module.exports = app;
