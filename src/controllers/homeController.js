// src/controllers/homeController.js
const Project = require('../models/projectModel');

exports.index = async (req, res) => {
    try {
        const category = req.query.category || 'all';
        const projects = await Project.getAll(category);
        res.render('index', { 
            title: 'Roochit | Portfolio',
            projects,
            currentCategory: category
        });
    } catch (err) {
        res.status(500).send('Server Error');
    }
};
