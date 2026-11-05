require('dotenv').config();

// server.js
const express = require('express');
const path = require('path');
const app = express();

// View Engine & Static Files
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'src/views'));
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// Routes (?)
const webRoutes = require('./src/routes/web'); // ? เชื่อมต่อไปยัง Route
app.use('/', webRoutes); // ?

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}`);
});
