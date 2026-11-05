// src/config/db.js
const mysql = require('mysql2/promise');

const pool = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
    waitForConnections: true, // ถ้าท่อเต็ม ให้รอคิว
    connectionLimit: 10,      // สร้างท่อเชื่อมต่อสูงสุด 10 ท่อ
    queueLimit: 0
});

module.exports = pool;
