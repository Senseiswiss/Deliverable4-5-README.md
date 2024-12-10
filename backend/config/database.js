const { Pool } = require('pg');
require('dotenv').config();

const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: parseInt(process.env.DB_PORT || '5432'),
  // Add connection timeout and retry settings
  connectionTimeoutMillis: 5000,
  max: 20,
  idleTimeoutMillis: 30000,
  connectionRetryJitter: true
});

// Add basic error handling on the pool itself
pool.on('error', (err, client) => {
  console.error('Unexpected error on idle client', err);
});

// Add a basic test query function
pool.testConnection = async () => {
  try {
    const client = await pool.connect();
    await client.query('SELECT NOW()');
    client.release();
    return true;
  } catch (err) {
    console.error('Database connection test failed:', err);
    return false;
  }
};

module.exports = pool;
