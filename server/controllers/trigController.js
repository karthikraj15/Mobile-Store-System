const mysql = require('mysql');

let connection = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME
});

exports.view = (req, res) => {

    connection.query('SELECT * FROM trig', (err, rows) => {

        if (!err) {
            console.log('The data from  table: \n', rows);
            res.render('trig/home-trig', { rows });
        } else {
            console.log(err);
        }
        //   console.log('The data from  table: \n', rows);
    });
}
