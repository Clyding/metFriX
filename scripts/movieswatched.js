const pool = require("./connect");

async function addToMoviesWatched(username, movieId) {
    const sqlCheck = 
        'SELECT 1 FROM MoviesWatched WHERE Username = ? AND MovieID = ?;';

    const sqlInsert = 
        'INSERT INTO MoviesWatched (Username, MovieID) VALUES (?, ?);';

    try {
        // Get a connection from the pool
        const connection = await pool.getConnection();

        // Check if the movie already exists for the user
        const [rows] = await connection.execute(sqlCheck, [username, movieId]);

        if (rows.length === 0) {
            // If not found, insert the movie into MoviesWatched
            await connection.execute(sqlInsert, [username, movieId]);
            console.log(`Added MovieID ${movieId} for user ${username}.`);
        } else {
            console.log(`MovieID ${movieId} already exists for user ${username}.`);
        }

        // Release the connection back to the pool
        connection.release();
    } catch (error) {
        // Log the error message
        console.error("Error adding movie to the watched list:", error.message);
    } finally {
        connection.release();
    }
}

module.exports = addToMoviesWatched;
