const express = require('express');
const pool = require('./connect');
require('dotenv').config();

const app = express();
app.use(express.json());

// Gets all movies
app.get('/movies', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM Movies');
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Gets a specific movie and its reviews
app.get('/movies/:id', async (req, res) => {
  const movieId = req.params.id;
  try {
    // Gets movie details
    const [movie] = await pool.query('SELECT * FROM Movies WHERE MovieID = ?', [movieId]);
    if (movie.length === 0) return res.status(404).json({ error: 'Movie not found' });

    // Gets reviews for the movie
    const [reviews] = await pool.query('SELECT * FROM Reviews WHERE MovieID = ?', [movieId]);

    // Combines results
    res.json({
      movie: movie[0],
      reviews,
    });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Gets the movies watched by a user
app.get('/users/:username/movies', async (req, res) => {
  const username = req.params.username;
  try {
    const [movies] = await pool.query(`
      SELECT m.MovieID, m.Title, m.Genre, m.Year
      FROM MoviesWatched mw
      JOIN Movies m ON mw.MovieID = m.MovieID
      WHERE mw.Username = ?
    `, [username]);

    res.json(movies);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Starts the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
