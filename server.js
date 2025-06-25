// server.js
const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(bodyParser.json());

// MySQL connection
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'pk_tiles_db'
});

db.connect(err => {
  if (err) throw err;
  console.log('Connected to MySQL database');
});

// API endpoints for articles data
app.get('/api/articles', (req, res) => {
  db.query('SELECT * FROM articles', (err, results) => {
    if (err) throw err;
    res.json(results);
  });
});

// app.post('/api/users', (req, res) => {
//   const { name, email, age } = req.body;
//   db.query(
//     'INSERT INTO users (name, email, age) VALUES (?, ?, ?)',
//     [name, email, age],
//     (err, result) => {
//       if (err) throw err;
//       res.json({ id: result.insertId, name, email, age });
//     }
//   );
// });

// Add more CRUD endpoints as needed

const PORT = 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});