const mysql = require('mysql');

// Connection Pool
let connection = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME
});

// View customers
exports.view = (req, res) => {
    connection.query('SELECT * FROM customer WHERE status = "active"', (err, rows) => {
        if (!err) {
            let removedCustomer = req.query.removed;
            res.render('customer/home-customer', { rows, removedCustomer });
        } else {
            console.log(err);
        }
        console.log('The data from  table: \n', rows);
    });
}

// Find customer by Search
exports.find = (req, res) => {
    let searchTerm = req.body.search;
    connection.query('SELECT * FROM customer WHERE Customer_ID LIKE ? OR Cust_Name LIKE ?', ['%' + searchTerm + '%', '%' + searchTerm + '%'], (err, rows) => {
        if (!err) {
            res.render('customer/home-customer', { rows });
        } else {
            console.log(err);
        }
        console.log('The data from customer table: \n', rows);
    });
}

exports.form = (req, res) => {
    res.render('customer/add-customer');
}

// Add new customer
exports.create = (req, res) => {
    const { Customer_ID, Cust_Name, Email, Phone, Address } = req.body;

    connection.query('INSERT INTO customer SET Customer_ID=?,Cust_Name = ?, Email = ?, Phone = ?, Address = ?', [Customer_ID, Cust_Name, Email, Phone, Address], (err, rows) => {
        if (!err) {
            res.render('customer/add-customer', { alert: 'customer registered successfully.' });
        } else {
            console.log(err);
        }
        console.log('The data from customer table: \n', rows);
    });
}


// Edit customer
exports.edit = (req, res) => {

    connection.query('SELECT * FROM customer WHERE Customer_ID = ?', [req.params.Customer_ID], (err, rows) => {
        if (!err) {
            res.render('customer/edit-customer', { rows });
        } else {
            console.log(err);
        }
        console.log('The data from customer table: \n', rows);
    });
}


// Update customer
exports.update = (req, res) => {
    const { Cust_Name, Email, Phone, Address } = req.body;

    connection.query('UPDATE customer SET Cust_Name = ?, Email = ?, Phone = ?,Address = ? WHERE Customer_ID = ?', [Cust_Name, Email, Phone, Address, req.params.Customer_ID], (err, rows) => {

        if (!err) {

            connection.query('SELECT * FROM customer WHERE Customer_ID = ?', [req.params.Customer_ID], (err, rows) => {


                if (!err) {
                    res.render('customer/edit-customer', { rows, alert: `${Cust_Name} has been updated.` });
                } else {
                    console.log(err);
                }
                console.log('The data from customer table: \n', rows);
            });
        } else {
            console.log(err);
        }
        console.log('The data from customer table: \n', rows);
    });
}

// Delete customer
exports.delete = (req, res) => {

    connection.query('DELETE FROM customer WHERE Customer_ID = ?', [req.params.Customer_ID], (err, rows) => {

        if (!err) {
            let removedcustomer = encodeURIComponent('Customer successfully removed.');
            res.redirect('/customer/?removed=' + removedcustomer);
        } else {
            console.log(err);
        }
        console.log('The data from customer table: \n', rows);

    });

    // Hide a record

    //  connection.query('UPDATE customer SET status = ? WHERE Customer_ID = ?', ['removed', req.params.Customer_ID], (err, rows) => {
    //       if (!err) {
    //         let removedcustomer = encodeURIComponent('Customer successfully removed.');
    //     res.redirect('/customer/?removed=' + removedcustomer);
    //      } else {
    // console.log(err);
    //    }
    //    console.log('The data from beer table are: \n', rows);
    // });

}

// View customers
exports.viewall = (req, res) => {

    connection.query('SELECT * FROM customer WHERE Customer_ID = ?', [req.params.Customer_ID], (err, rows) => {
        if (!err) {
            res.render('customer/view-customer', { rows });
        } else {
            console.log(err);
        }
        console.log('The data from customer table: \n', rows);
    });

}