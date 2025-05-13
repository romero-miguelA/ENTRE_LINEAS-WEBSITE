const express = require('express');
const mysql = require('mysql');
const cors = require('cors');
const path = require('path');

const app = express();
const PORT = 3000;

// Middlewares
app.use(cors());
app.use(express.json());

// Servir archivos estáticos del frontend
app.use(express.static(path.join(__dirname, '../frontend')));

// Conexión MySQL
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'Root',
    database: 'LibreriaDB'
});

db.connect(err => {
    if (err) {
        console.error('Error de conexión a la base de datos:', err);
        return;
    }
    console.log('Conectado a la base de datos MySQL');
});

// Ruta para registro
app.post('/registro', (req, res) => {
    const { nombre, apellidos, email, password, telefono } = req.body;

    const query = 'INSERT INTO usuarios (nombre, apellidos, email, password, telefono) VALUES (?, ?, ?, ?, ?)';
    db.query(query, [nombre, apellidos, email, password, telefono], (err, result) => {
        if (err) {
            console.error('Error al registrar usuario:', err);
            return res.status(500).json({ mensaje: 'Error al registrar' });
        }
        res.json({ mensaje: 'Usuario registrado exitosamente' });
    });
});

// Ruta para login
app.post('/login', (req, res) => {
    const { email, password } = req.body;

    if (!email || !password) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
    }

    const query = 'SELECT * FROM usuarios WHERE email = ? AND password = ?';

    db.query(query, [email, password], (err, results) => {
        if (err) {
            console.error('Error al hacer login:', err);
            return res.status(500).json({ error: 'Error del servidor' });
        }

        if (results.length > 0) {
            res.json({ message: 'Inicio de sesión exitoso' });
        } else {
            res.status(401).json({ error: 'Correo o contraseña incorrectos' });
        }
    });
});

// Redirigir "/" al registro.html
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '../frontend/registro.html'));
});

// Iniciar servidor
app.listen(PORT, () => {
    console.log(`Servidor corriendo en http://localhost:${PORT}`);
});
