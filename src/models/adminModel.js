// src/models/adminModel.js
const db = require('../config/db');
const bcrypt = require('bcryptjs');

class AdminModel {
    // ตรวจสอบรหัสผ่าน รองรับทั้งแบบ Bcrypt Hash และ Plaintext
    static async verifyPassword(plainPassword, storedPassword) {
        if (!plainPassword || !storedPassword) return false;
        if (storedPassword.startsWith('$2')) {
            try {
                return await bcrypt.compare(plainPassword, storedPassword);
            } catch {
                return false;
            }
        }
        return plainPassword === storedPassword;
    }

    static async findByUsername(username) {
        const [rows] = await db.query('SELECT * FROM admins WHERE username = ?', [username]);
        return rows[0] || null;
    }

    static async getAll() {
        const [rows] = await db.query('SELECT id, username, created_at FROM admins ORDER BY created_at DESC');
        return rows;
    }

    static async getById(id) {
        const [rows] = await db.query('SELECT id, username, password FROM admins WHERE id = ?', [id]);
        return rows[0] || null;
    }

    static async create(data) {
        const id = Date.now().toString();
        const hashedPassword = await bcrypt.hash(data.password, 10);
        const [result] = await db.query(
            'INSERT INTO admins (id, username, password) VALUES (?, ?, ?)',
            [id, data.username, hashedPassword]
        );
        return result;
    }

    static async update(id, data) {
        let sql = 'UPDATE admins SET username = ? WHERE id = ?';
        let params = [data.username, id];
        if (data.password && data.password.trim() !== '') {
            const hashedPassword = await bcrypt.hash(data.password, 10);
            sql = 'UPDATE admins SET username = ?, password = ? WHERE id = ?';
            params = [data.username, hashedPassword, id];
        }
        const [result] = await db.query(sql, params);
        return result;
    }

    static async delete(id) {
        const [result] = await db.query('DELETE FROM admins WHERE id = ?', [id]);
        return result;
    }
}

module.exports = AdminModel;
