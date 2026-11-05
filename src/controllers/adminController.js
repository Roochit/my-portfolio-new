// src/controllers/adminController.js
const Project = require('../models/projectModel');
const Admin = require('../models/adminModel');

// --- Auth ---
exports.loginPage = (req, res) => {
    res.render('auth/login', { error: null });
};

exports.login = async (req, res) => {
    const { username, password } = req.body;
    const admin = await Admin.findByUsername(username);
    if (admin) {
        const isMatch = await Admin.verifyPassword(password, admin.password);
        if (isMatch) {
            return res.redirect('/admin/products');
        }
    }
    res.render('auth/login', { error: 'ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง' });
};

// --- Product / Project CRUD (Views: src/views/product-back) ---
exports.productList = async (req, res) => {
    const projects = await Project.getAll();
    res.render('product-back/product_list', { projects });
};

exports.productCreatePage = (req, res) => {
    res.render('product-back/product_create');
};

exports.productCreate = async (req, res) => {
    await Project.create(req.body);
    res.redirect('/admin/products');
};

exports.productEditPage = async (req, res) => {
    const project = await Project.getById(req.params.id);
    if (!project) return res.redirect('/admin/products');
    res.render('product-back/product_edit', { project });
};

exports.productUpdate = async (req, res) => {
    await Project.update(req.params.id, req.body);
    res.redirect('/admin/products');
};

exports.productDelete = async (req, res) => {
    await Project.delete(req.params.id);
    res.redirect('/admin/products');
};

// --- Admin Users CRUD (Views: src/views/admin) ---
exports.adminList = async (req, res) => {
    const admins = await Admin.getAll();
    res.render('admin/admin_list', { admins });
};

exports.adminCreatePage = (req, res) => {
    res.render('admin/admin_create', { error: null });
};

exports.adminCreate = async (req, res) => {
    const { username, password } = req.body;
    if (!username || !password) {
        return res.render('admin/admin_create', { error: 'กรุณากรอกข้อมูลให้ครบถ้วน' });
    }
    await Admin.create({ username, password });
    res.redirect('/admin/admins');
};

exports.adminEditPage = async (req, res) => {
    const admin = await Admin.getById(req.params.id);
    if (!admin) return res.redirect('/admin/admins');
    res.render('admin/admin_edit', { admin, error: null });
};

exports.adminUpdate = async (req, res) => {
    await Admin.update(req.params.id, req.body);
    res.redirect('/admin/admins');
};

exports.adminDelete = async (req, res) => {
    await Admin.delete(req.params.id);
    res.redirect('/admin/admins');
};
