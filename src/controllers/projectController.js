// src/controllers/projectController.js
const Project = require('../models/projectModel');

exports.detail = async (req, res) => {
    try {
        const project = await Project.getById(req.params.id);
        if (!project) return res.status(404).send('Project Not Found');
        res.render('project-font/project_detail', { 
            title: `${project.title} | Portfolio`,
            project 
        });
    } catch (err) {
        res.status(500).send('Server Error');
    }
};
