// src/routes/web.js
const express = require('express');
const router = express.Router();
const homeController = require('../controllers/homeController');
const projectController = require('../controllers/projectController');
const adminController = require('../controllers/adminController');

// --- Public Routes ---
router.get('/', homeController.index);
router.get('/projects/:id', projectController.detail);

// --- Auth Routes ---
router.get('/login', adminController.loginPage);
router.post('/login', adminController.login);

// --- Product/Project CRUD (Views: src/views/product-back) ---
router.get('/admin/products', adminController.productList);
router.get('/admin/products/create', adminController.productCreatePage);
router.post('/admin/products/create', adminController.productCreate);
router.get('/admin/products/:id/edit', adminController.productEditPage);
router.post('/admin/products/:id/edit', adminController.productUpdate);
router.post('/admin/products/:id/delete', adminController.productDelete);

// Aliases for /admin/projects
router.get('/admin/projects', (req, res) => res.redirect('/admin/products'));
router.get('/admin/projects/create', (req, res) => res.redirect('/admin/products/create'));
router.get('/admin/projects/:id/edit', (req, res) => res.redirect(`/admin/products/${req.params.id}/edit`));

// --- Admin Accounts CRUD (Views: src/views/admin) ---
router.get('/admin/admins', adminController.adminList);
router.get('/admin/admins/create', adminController.adminCreatePage);
router.post('/admin/admins/create', adminController.adminCreate);
router.get('/admin/admins/:id/edit', adminController.adminEditPage);
router.post('/admin/admins/:id/edit', adminController.adminUpdate);
router.post('/admin/admins/:id/delete', adminController.adminDelete);

module.exports = router;
