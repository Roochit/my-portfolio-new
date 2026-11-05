// src/models/projectModel.js
const db = require('../config/db');

function extractYouTubeThumbnail(url) {
    if (!url) return null;
    const match = url.match(/(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=|video\/))([\w-]{11})/);
    return match ? `https://img.youtube.com/vi/${match[1]}/hqdefault.jpg` : null;
}

function formatProject(r) {
    const ytThumb = extractYouTubeThumbnail(r.videoUrl);
    const coverImage = (r.image && !r.image.startsWith('assets/')) 
        ? r.image 
        : (ytThumb || r.image || '');

    return {
        ...r,
        coverImage,
        youtubeThumbnail: ytThumb,
        tags: typeof r.tags === 'string' ? JSON.parse(r.tags || '[]') : (r.tags || [])
    };
}

class ProjectModel {
    static async getAll(category = null) {
        let sql = 'SELECT * FROM projects ORDER BY created_at DESC';
        const params = [];
        if (category && category !== 'all') {
            sql = 'SELECT * FROM projects WHERE category = ? ORDER BY created_at DESC';
            params.push(category);
        }
        const [rows] = await db.query(sql, params);
        return rows.map(formatProject);
    }

    static async getById(id) {
        const [rows] = await db.query('SELECT * FROM projects WHERE id = ?', [id]);
        if (rows.length === 0) return null;
        return formatProject(rows[0]);
    }

    static async create(data) {
        const id = Date.now().toString();
        const tags = Array.isArray(data.tags) 
            ? JSON.stringify(data.tags) 
            : JSON.stringify((data.tags || '').split(',').map(t => t.trim()).filter(Boolean));
        
        const ytThumb = extractYouTubeThumbnail(data.videoUrl);
        const finalImage = (data.image && data.image.trim() !== '') ? data.image.trim() : (ytThumb || '');

        const [result] = await db.query(
            'INSERT INTO projects (id, title, category, tags, image, videoUrl, docUrl, downloadUrl, description) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)',
            [id, data.title, data.category, tags, finalImage, data.videoUrl || '', data.docUrl || '', data.downloadUrl || '', data.description || '']
        );
        return result;
    }

    static async update(id, data) {
        const tags = Array.isArray(data.tags) 
            ? JSON.stringify(data.tags) 
            : JSON.stringify((data.tags || '').split(',').map(t => t.trim()).filter(Boolean));
        
        const ytThumb = extractYouTubeThumbnail(data.videoUrl);
        const finalImage = (data.image && data.image.trim() !== '') ? data.image.trim() : (ytThumb || '');

        const [result] = await db.query(
            'UPDATE projects SET title = ?, category = ?, tags = ?, image = ?, videoUrl = ?, docUrl = ?, downloadUrl = ?, description = ? WHERE id = ?',
            [data.title, data.category, tags, finalImage, data.videoUrl || '', data.docUrl || '', data.downloadUrl || '', data.description || '', id]
        );
        return result;
    }

    static async delete(id) {
        const [result] = await db.query('DELETE FROM projects WHERE id = ?', [id]);
        return result;
    }
}

module.exports = ProjectModel;
