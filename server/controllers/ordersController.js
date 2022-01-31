const mysql = require('mysql');

let connection = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
    multipleStatements: true
});

// View orders
exports.view = (req, res) => {

    connection.query('SELECT * FROM orders WHERE status = "active"', (err, rows) => {

        if (!err) {
            let removedOrders = req.query.removed;
            res.render('orders/home-orders', { rows, removedOrders });
        } else {
            console.log(err);
        }
        console.log('The data from  table: \n', rows);
    });
}

// Find orders by Search
exports.find = (req, res) => {
    let searchTerm = req.body.search;
    // orders the connection
    connection.query('SELECT * FROM orders WHERE Ord_ID LIKE ? OR Ord_Date LIKE ?', ['%' + searchTerm + '%', '%' + searchTerm + '%'], (err, rows) => {
        if (!err) {
            res.render('orders/home-orders', { rows });
        } else {
            console.log(err);
        }
        console.log('The data from orders table: \n', rows);
    });
}

exports.form = (req, res) => {
    res.render('orders/add-orders');
}

// Add new orders
exports.create = (req, res) => {
    const { Ord_ID, Ord_Date, Ord_Price, Quantity, Invoice, Mob_ID, Cust_ID } = req.body;


    connection.query('INSERT INTO orders SET Ord_ID=?,Ord_Date =?, Ord_Price=?, Quantity = ?,Invoice = ?,Mob_ID=?,Cust_ID=?', [Ord_ID, Ord_Date, Ord_Price, Quantity, Invoice, Mob_ID, Cust_ID], (err, rows) => {
        if (!err) {
            res.render('orders/add-orders', { alert: 'orders placed successfully.' });
        } else {
            console.log(err);
            req.flash('error', 'Enter proper details!')
            res.redirect('/orders/addorders')

        }
        console.log('The data from orders table: \n', rows);
    });
}


// Edit orders
exports.edit = (req, res) => {

    connection.query('SELECT * FROM orders WHERE Ord_ID = ?', [req.params.Ord_ID], (err, rows) => {
        if (!err) {
            res.render('orders/edit-orders', { rows });
        } else {
            console.log(err);

        }
        console.log('The data from orders table: \n', rows);
    });
}


// Update orders
exports.update = (req, res) => {
    const { Ord_ID, Ord_Date, Ord_Price, Quantity, Invoice, Mob_ID, Cust_ID } = req.body;

    connection.query('UPDATE orders SET Ord_Date = ?, Ord_Price=?, Quantity = ?, Invoice = ?,Mob_ID=?,Cust_ID=? WHERE Ord_ID = ?', [Ord_Date, Ord_Price, Quantity, Invoice, Mob_ID, Cust_ID, req.params.Ord_ID], (err, rows) => {

        if (!err) {

            connection.query('SELECT * FROM orders WHERE Ord_ID = ?', [req.params.Ord_ID], (err, rows) => {


                if (!err) {
                    res.render('orders/edit-orders', { rows, alert: `${Ord_ID} has been updated.` });
                } else {
                    console.log(err);

                }
                console.log('The data from orders table: \n', rows);
            });
        } else {
            console.log(err);
            req.flash('error', 'Enter proper details!')
            res.redirect(`/orders/editorders/${Ord_ID}`)

        }
        console.log('The data from orders table: \n', rows);
    });
}

// Delete orders
exports.delete = (req, res) => {

    connection.query('DELETE FROM orders WHERE Ord_ID = ?', [req.params.Ord_ID], (err, rows) => {

        if (!err) {
            let removedorders = encodeURIComponent('orders successfully removed.');
            res.redirect('/orders/?removed=' + removedorders);
        } else {
            console.log(err);
        }
        console.log('The data from orders table: \n', rows);

    });

    // Hide a record

    //  connection.query('UPDATE orders SET status = ? WHERE Ord_ID = ?', ['removed', req.params.Ord_ID], (err, rows) => {
    //       if (!err) {
    //         let removedorders = encodeURIComponent('Orders successfully removed.');
    //     res.redirect('/orders/?removed=' + removedorders);
    //      } else {
    // console.log(err);
    //    }
    //    console.log('The data from beer table are: \n', rows);
    // });

}

// View orders
exports.viewall = (req, res) => {

    connection.query('SELECT * FROM orders WHERE Ord_ID = ?', [req.params.Ord_ID], (err, rows1) => {
        if (!err) {
            let customer = rows1[0].Cust_ID
            let mobile = rows1[0].Mob_ID
            let order = rows1[0].Ord_ID;
            connection.query('SELECT * FROM mobile WHERE Mob_ID = ?;SELECT * FROM specs where Mobile_ID=?;SELECT * FROM customer WHERE Customer_ID = ?;SELECT * FROM orders WHERE Ord_ID = ?', [mobile, mobile, customer, order], (err, rows) => {
                if (!err) {
                    s1 = { ...rows[0] }
                    s2 = { ...rows[1] }
                    s3 = { ...rows[2] }
                    s4 = { ...rows[3] }
                    const f1 = Object.assign(s1[0], s2[0], s3[0], s4[0])
                    let ans = []
                    ans.push(f1)
                    console.log("The combined data is:\n", ans)
                    res.render('orders/view-orders', { ans });
                } else {
                    console.log(err);
                }

            });


        } else {
            console.log(err);
        }
        console.log('The data from orders table: \n', rows1);
    });

}