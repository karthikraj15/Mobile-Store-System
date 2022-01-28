const mysql = require('mysql');
const { isLoggedIn } = require('../../middleware');

let connection = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME
});

// View companies
exports.view = (req, res) => {

    connection.query('SELECT * FROM company WHERE status = "active"', (err, rows) => {

        if (!err) {
            let removedCompany = req.query.removed;
            res.render('company/home-company', { rows, removedCompany });
        } else {
            console.log(err);
        }
        console.log('The data from customer table: \n', rows);
    });
}

// Find company by Search
exports.find = (req, res) => {
    let searchTerm = req.body.search;
    // company the connection
    connection.query('SELECT * FROM company WHERE Comp_ID LIKE ? OR Comp_Name LIKE ?', ['%' + searchTerm + '%', '%' + searchTerm + '%'], (err, rows) => {
        if (!err) {
            res.render('company/home-company', { rows });
        } else {
            console.log(err);
        }
        console.log('The data from company table: \n', rows);
    });
}

exports.form = (req, res) => {
    res.render('company/add-company');
}

// Add new company
exports.create = (req, res) => {
    const { Comp_ID, Comp_Name, Email, Location, Estd, Details } = req.body;


    connection.query('INSERT INTO company SET Comp_ID=?,Comp_Name = ?, Email = ?,Location = ?,Estd=?,Details=?', [Comp_ID, Comp_Name, Email, Location, Estd, Details], (err, rows) => {
        if (!err) {
            res.render('company/add-company', { alert: 'company added successfully.' });
        } else {
            console.log(err);
        }
        console.log('The data from company table: \n', rows);
    });
}


// Edit company
exports.edit = (req, res) => {

    connection.query('SELECT * FROM company WHERE Comp_ID = ?', [req.params.Comp_ID], (err, rows) => {
        if (!err) {
            res.render('company/edit-company', { rows });
        } else {
            console.log(err);
        }
        console.log('The data from company table: \n', rows);
    });
}


// Update company
exports.update = (req, res) => {
    const { Comp_Name, Email, Location, Estd, Details } = req.body;

    connection.query('UPDATE company SET Comp_Name = ?, Email = ?, Location = ?,Estd=?,Details=? WHERE Comp_ID = ?', [Comp_Name, Email, Location, Estd, Details, req.params.Comp_ID], (err, rows) => {

        if (!err) {

            connection.query('SELECT * FROM company WHERE Comp_ID = ?', [req.params.Comp_ID], (err, rows) => {


                if (!err) {
                    res.render('company/edit-company', { rows, alert: `${Comp_Name} has been updated.` });
                } else {
                    console.log(err);
                }
                console.log('The data from company table: \n', rows);
            });
        } else {
            console.log(err);
        }
        console.log('The data from company table: \n', rows);
    });
}

// Delete company
exports.delete = (req, res) => {

    connection.query('DELETE FROM company WHERE Comp_ID = ?', [req.params.Comp_ID], (err, rows) => {

        if (!err) {
            let removedcompany = encodeURIComponent('Company successfully removed.');
            res.redirect('/company/?removed=' + removedcompany);
        } else {
            console.log(err);
        }
        console.log('The data from company table: \n', rows);

    });

    // Hide a record

    //  connection.query('UPDATE company SET status = ? WHERE Comp_ID = ?', ['removed', req.params.Comp_ID], (err, rows) => {
    //       if (!err) {
    //         let removedcompany = encodeURIComponent('Company successfully removed.');
    //     res.redirect('/company/?removed=' + removedcompany);
    //      } else {
    // console.log(err);
    //    }
    //    console.log('The data from beer table are: \n', rows);
    // });

}

// View companies
exports.viewall = (req, res) => {

    connection.query('SELECT * FROM company WHERE Comp_ID = ?', [req.params.Comp_ID], (err, rows) => {
        if (!err) {
            res.render('company/view-company', { rows });
        } else {
            console.log(err);
        }
        console.log('The data from company table: \n', rows);
    });

}