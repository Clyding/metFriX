let mysql = require(mysql)

let connection = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    database: process.env.DB_NAME,
    password: process.env.DB_PASSWORD,
    port: process.env.DB_PORT
})

module.exports = pool.promise(); 

connection.connect((err) => {
    if (err) return console.error(err.message);
  
    console.log('Connected to the MySQL server.');
});
  
connection.end((err) => {
    if (err) return console.error(err.message);
  
    console.log('Close the database connection.');
});