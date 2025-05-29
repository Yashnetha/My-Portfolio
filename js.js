const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const app = express();
app.use(bodyParser.json()); // For parsing JSON data
// MySQL Connection
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'yourpassword',
    database: 'LIBRARY'
});

db.connect((err) => {
    if (err) throw err;
    console.log('Connected to MySQL');
});

// Endpoint to fetch all books
app.get('/books', (req, res) => {
    const query = 'SELECT * FROM Books';
    db.query(query, (err, results) => {
        if (err) throw err;
        res.json(results);
    });
});

// Endpoint to add a new book
app.post('/add_book', (req, res) => {
    const { Title, Author, Genre } = req.body;
    const query = 'INSERT INTO Books (Title, Author, Genre, Availability) VALUES (?, ?, ?, ?)';
    db.query(query, [Title, Author, Genre, true], (err, result) => {
        if (err) throw err;
        res.json({ message: 'Book added successfully!', bookID: result.insertId });
    });
});

// Start the server
app.listen(3000, () => {
    console.log('Server running on port 3000');
});
