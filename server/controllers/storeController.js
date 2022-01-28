const mysql = require('mysql');

let connection = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME
});

// View stores
exports.view = (req, res) => {

    connection.query('SELECT * FROM store WHERE status = "active"', (err, rows) => {

        if (!err) {
            let removedStore = req.query.removed;
            res.render('store/home-store', { rows, removedStore });
        } else {
            console.log(err);
        }
        console.log('The data from  table: \n', rows);
    });
}

// Find store by Search
exports.find = (req, res) => {
    let searchTerm = req.body.search;
    // store the connection
    connection.query('SELECT * FROM store WHERE Store_ID LIKE ? OR Store_Name LIKE ?', ['%' + searchTerm + '%', '%' + searchTerm + '%'], (err, rows) => {
        if (!err) {
            res.render('store/home-store', { rows });
        } else {
            console.log(err);
        }
        console.log('The data from store table: \n', rows);
    });
}

exports.form = (req, res) => {
    res.render('store/add-store');
}

// Add new store
exports.create = (req, res) => {
    const { Store_ID, Store_Name, Phone, Location, Comp_ID, Description } = req.body;


    connection.query('INSERT INTO store SET Store_ID=?,Store_Name = ?, Phone = ?,Location = ?,Comp_ID=?,Description=?', [Store_ID, Store_Name, Phone, Location, Comp_ID, Description], (err, rows) => {
        if (!err) {
            res.render('store/add-store', { alert: 'store added successfully.' });
        } else {
            console.log(err);
        }
        console.log('The data from store table: \n', rows);
    });
}


// Edit store
exports.edit = (req, res) => {

    connection.query('SELECT * FROM store WHERE Store_ID = ?', [req.params.Store_ID], (err, rows) => {
        if (!err) {
            res.render('store/edit-store', { rows });
        } else {
            console.log(err);
        }
        console.log('The data from store table: \n', rows);
    });
}


// Update store
exports.update = (req, res) => {
    const { Store_Name, Phone, Location, Comp_ID, Description } = req.body;

    connection.query('UPDATE store SET Store_Name = ?, Phone = ?, Location = ?,Comp_ID=?,Description=? WHERE Store_ID = ?', [Store_Name, Phone, Location, Comp_ID, Description, req.params.Store_ID], (err, rows) => {

        if (!err) {

            connection.query('SELECT * FROM store WHERE store_ID = ?', [req.params.Store_ID], (err, rows) => {


                if (!err) {
                    res.render('store/edit-store', { rows, alert: `${Store_Name} has been updated.` });
                } else {
                    console.log(err);
                }
                console.log('The data from store table: \n', rows);
            });
        } else {
            console.log(err);
        }
        console.log('The data from store table: \n', rows);
    });
}

// Delete store
exports.delete = (req, res) => {

    connection.query('DELETE FROM store WHERE Store_ID = ?', [req.params.Store_ID], (err, rows) => {

        if (!err) {
            let removedstore = encodeURIComponent('Store successfully removed.');
            res.redirect('/store/?removed=' + removedstore);
        } else {
            console.log(err);
        }
        console.log('The data from store table: \n', rows);

    });

    // Hide a record

    //  connection.query('UPDATE store SET status = ? WHERE Store_ID = ?', ['removed', req.params.Store_ID], (err, rows) => {
    //       if (!err) {
    //         let removedstore = encodeURIComponent('Store successfully removed.');
    //     res.redirect('/store/?removed=' + removedstore);
    //      } else {
    // console.log(err);
    //    }
    //    console.log('The data from beer table are: \n', rows);
    // });

}

// View stores
exports.viewall = (req, res) => {

    connection.query('SELECT * FROM store WHERE Store_ID = ?', [req.params.Store_ID], (err, rows) => {
        if (!err) {
            res.render('store/view-store', { rows });
        } else {
            console.log(err);
        }
        console.log('The data from store table: \n', rows);
    });

}