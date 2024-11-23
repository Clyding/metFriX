const pool = require("./connect");

async function addToMoviesWatched(username, movieId) {
    const sqlCheck = 
    'SELECT 1 FROM MoviesWatched WHERE username = ? AND movieId = ?;';

    const sqlInsert = 
    'INSERT INTO MoviesWatched (Username, MovieID) VALUES (?, ?);';

    try {
        const connection = await pool.getConnection();

        const [rows] = await connection.execute(sqlCheck, [username, movieId]);

        if (rows.length == 0) {
            await connection.execute(sqlInsert, [username, movieId]);

            console.log('Added movieID ${movieId} for ${username}.');
        } else {
            console.log('Movie ID ${movieId} already exists for user ${username}.');
        }

        connection.release()
    }

    catch (error) {
        console.error ("Error adding Movies to the WatchedList:", error);
        
    }

    

}