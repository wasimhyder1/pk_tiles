require('dotenv').config();
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const mysql = require('mysql2/promise');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

const app = express();

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Database connection
const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

// JWT Secret
const JWT_SECRET = process.env.JWT_SECRET || '786';

// Routes will go here

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});

// Register endpoint
app.post('/register', async (req, res) => {
  try {
    const { name, email, password } = req.body;
    
    // Validate input
    if (!name || !email || !password) {
      return res.status(400).json({ message: 'All fields are required' });
    }
    
    // Check if user already exists
    const [existingUser] = await pool.query('SELECT * FROM users WHERE email = ?', [email]);
    if (existingUser.length > 0) {
      return res.status(409).json({ message: 'User already exists' });
    }
    
    // Hash password
    const hashedPassword = await bcrypt.hash(password, 10);
    
    // Insert new user
    const [result] = await pool.query(
      'INSERT INTO users (name, email, password) VALUES (?, ?, ?)',
      [name, email, hashedPassword]
    );
    
    // Create token
    const token = jwt.sign(
      { userId: result.insertId, email },
      JWT_SECRET,
      { expiresIn: '1h' }
    );
    
    res.status(201).json({ token, userId: result.insertId });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
});

// Login endpoint
app.post('/login', async (req, res) => {
  try {
    const { email, password } = req.body;
    
    // Validate input
    if (!email || !password) {
      return res.status(400).json({ message: 'Email and password are required' });
    }
    
    // Check if user exists
    const [users] = await pool.query('SELECT * FROM users WHERE email = ?', [email]);
    if (users.length === 0) {
      return res.status(401).json({ message: 'Invalid credentials' });
    }
    
    const user = users[0];
    
    // Compare passwords
    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      return res.status(401).json({ message: 'Invalid Password' });
    }
    
    // Create token
    const token = jwt.sign(
      { userId: user.id, email: user.email },
      JWT_SECRET,
      { expiresIn: '1h' }
    );
    
    res.json({ token, userId: user.id });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
});

// Protected route example
app.get('/protected', authenticateToken, (req, res) => {
  res.json({ message: 'This is protected data', user: req.user });
});

// Middleware to authenticate token
function authenticateToken(req, res, next) {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1];
  
  if (!token) {
    return res.status(401).json({ message: 'No token provided' });
  }
  
  jwt.verify(token, JWT_SECRET, (err, user) => {
    if (err) {
      return res.status(403).json({ message: 'Invalid or expired token' });
    }
    req.user = user;
    next();
  });
}

// get data for slip house from db
app.get('/api/data-by-date', async (req, res) => {
  const { date } = req.query;
  try {
    const [result] = await pool.query(
      "SELECT * FROM slip_house WHERE date= ? GROUP BY date", [date]);
    res.json(result);
  } 
  catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
});

app.get('/api/data-by-date2', async (req, res) => {
  const { date } = req.query;
  try {
    const [result] = await pool.query(
      "SELECT * FROM slip_house WHERE date= ?", [date]);
    res.json(result);
  } 
  catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
});

// insert data in slip house table
app.post('/api/slip_data', (req, res) => {
  const { user_id, supervisor_name, shift, date, day, standard, sieve, p_s_parameter, checktime_1, checktime_2, checktime_3, write_verified_data1, write_verified_data2, ball_mill_4, ball_mill_3, ball_mill_2, ball_mill_1, moisture_1, p_check_time1, moisture_2, p_check_time2 } = req.body;
  
  const sql = 'INSERT INTO slip_house (user_id, supervisor_name, shift, date, day, standard, sieve, p_s_parameter, checktime_1, checktime_2, checktime_3, write_verified_data1, write_verified_data2, ball_mill_4, ball_mill_3, ball_mill_2, ball_mill_1, moisture_1, p_check_time1, moisture_2, p_check_time2) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
  pool.query(sql, [user_id, supervisor_name, shift, date, day, standard, sieve, p_s_parameter, checktime_1, checktime_2, checktime_3, write_verified_data1, write_verified_data2, ball_mill_4, ball_mill_3, ball_mill_2, ball_mill_1, moisture_1, p_check_time1, moisture_2, p_check_time2], (err, result) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    res.json({ id: result.insertId, supervisor_name });
  });
});

//insert data in press table
app.post('/api/press_data', (req, res) => {
  const { user_id, supervisor_name, shift, date, day, thickness, cycle, size, pressure_kn_1, pressure_kn_2, pressure_kn_3, pressure_kn_4, checking_time } = req.body;
  
  const sql = 'INSERT INTO press (user_id, supervisor_name, shift, date, day, thickness, cycle, size, pressure_kn_1, pressure_kn_2, pressure_kn_3, pressure_kn_4, checking_time) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
  pool.query(sql, [user_id, supervisor_name, shift, date, day, thickness, cycle, size, pressure_kn_1, pressure_kn_2, pressure_kn_3, pressure_kn_4, checking_time], (err, result) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    res.json({ id: result.insertId, supervisor_name });
  });
});

// get data for press from db
app.get('/api/press-by-date', async (req, res) => {
  const { date } = req.query;
  try {
    const [result] = await pool.query(
      "SELECT * FROM press WHERE date= ? GROUP BY date", [date]);
    res.json(result);
  } 
  catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
});

app.get('/api/press-by-date2', async (req, res) => {
  const { date } = req.query;
  try {
    const [result] = await pool.query(
      "SELECT * FROM press WHERE date= ?", [date]);
    res.json(result);
  } 
  catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
});

// insert data in GPD table
app.post('/api/gpd_data', (req, res) => {
  const { user_id, supervisor_name, shift, date, day, write_verified_data, ball_mill_4, ball_mill_3, ball_mill_2, ball_mill_1, emptied_ball_mills, loaded_ball_mills, ute_stock, glaze_stock, engobe_stock, tank_1, material_1, stock_1, tank_2, material_2, stock_2 } = req.body;
  
  const sql = 'INSERT INTO gpd (user_id, supervisor_name, shift, date, day, write_verified_data, ball_mill_4, ball_mill_3, ball_mill_2, ball_mill_1, emptied_ball_mills, loaded_ball_mills, ute_stock, glaze_stock, engobe_stock, tank_1, material_1, stock_1, tank_2, material_2, stock_2) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
  pool.query(sql, [user_id, supervisor_name, shift, date, day, write_verified_data, ball_mill_4, ball_mill_3, ball_mill_2, ball_mill_1, emptied_ball_mills, loaded_ball_mills, ute_stock, glaze_stock, engobe_stock, tank_1, material_1, stock_1, tank_2, material_2, stock_2], (err, result) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    res.json({ id: result.insertId, supervisor_name });
  });
});

// get data for GPD from db
app.get('/api/gpd-by-date', async (req, res) => {
  const { date } = req.query;
  try {
    const [result] = await pool.query(
      "SELECT * FROM gpd WHERE date= ? GROUP BY date", [date]);
    res.json(result);
  } 
  catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
});

app.get('/api/gpd-by-date2', async (req, res) => {
  const { date } = req.query;
  try {
    const [result] = await pool.query(
      "SELECT * FROM gpd WHERE date= ?", [date]);
    res.json(result);
  } 
  catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
});

// insert data in Glazeline table
app.post('/api/glazeline_data', (req, res) => {
  const { user_id, supervisor_name, shift, date, day, glaze_pickup_1, engobe_pickup_1, density_1, viscosity_1, glaze_pickup_2, engobe_pickup_2, density_2, viscosity_2, checking_time } = req.body;
  
  const sql = 'INSERT INTO glazeline (user_id, supervisor_name, shift, date, day, glaze_pickup_1, engobe_pickup_1, density_1, viscosity_1, glaze_pickup_2, engobe_pickup_2, density_2, viscosity_2, checking_time) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
  pool.query(sql, [user_id, supervisor_name, shift, date, day, glaze_pickup_1, engobe_pickup_1, density_1, viscosity_1, glaze_pickup_2, engobe_pickup_2, density_2, viscosity_2, checking_time], (err, result) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    res.json({ id: result.insertId, supervisor_name });
  });
});

// get data for Glazeline from db
app.get('/api/glaze-by-date', async (req, res) => {
  const { date } = req.query;
  try {
    const [result] = await pool.query(
      "SELECT * FROM glazeline WHERE date= ? GROUP BY date", [date]);
    res.json(result);
  } 
  catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
});

app.get('/api/glaze-by-date2', async (req, res) => {
  const { date } = req.query;
  try {
    const [result] = await pool.query(
      "SELECT * FROM glazeline WHERE date= ?", [date]);
    res.json(result);
  } 
  catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
});