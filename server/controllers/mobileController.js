const mysql = require('mysql');

const express = require('express');
const catchAsync = require('../../utils/catchAsync');
const Complaint = require('../../models/complaint');

let connection = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
    multipleStatements: true
});

// View mobiles
exports.view = (req, res) => {

    connection.query('SELECT * FROM mobile WHERE status = "active"', (err, rows) => {

        if (!err) {
            let removedMobile = req.query.removed;
            var mobilechunks = [];
            var chunkSize = 3;
            for (var i = 0; i < rows.length; i += chunkSize) {
                mobilechunks.push(rows.slice(i, i + chunkSize))
            }
            res.render('mobile/home-mobile', { mobilechunks, removedMobile });
        } else {
            console.log(err);
        }
        // console.log('The data from  table: \n', rows);
    });
}

// Find mobile by Search
exports.find = (req, res) => {
    let searchTerm = req.body.search;
    // mobile the connection
    connection.query('SELECT * FROM mobile WHERE Mob_ID LIKE ? OR Mob_Name LIKE ?', ['%' + searchTerm + '%', '%' + searchTerm + '%'], (err, rows) => {
        if (!err) {
            var mobilechunks = [];
            var chunkSize = 3;
            for (var i = 0; i < rows.length; i += chunkSize) {
                mobilechunks.push(rows.slice(i, i + chunkSize))
            }
            res.render('mobile/home-mobile', { mobilechunks });
        } else {
            console.log(err);
        }
        console.log('The data from mobile table: \n', rows);
    });
}

exports.form = (req, res) => {
    res.render('mobile/add-mobile');
}

// Add new mobile
exports.create = (req, res) => {
    const { Mob_ID, Mob_Name, Mob_image, Mfd_Date, Price, Comp_ID, Stock, Mobile_ID, Processor, Camera, Display_Size, Battery, RAM, Storage } = req.body;


    connection.query('INSERT INTO mobile SET Mob_ID=?,Mob_Name = ?,Mob_image=?, Mfd_Date = ?,Price = ?,Comp_ID=?,Stock=? ; INSERT INTO specs SET Mobile_ID=?,Processor=?,Camera=?,Display_Size=?,Battery=?,RAM=?,Storage=?', [Mob_ID, Mob_Name, Mob_image, Mfd_Date, Price, Comp_ID, Stock, Mob_ID, Processor, Camera, Display_Size, Battery, RAM, Storage], (err, rows) => {
        if (!err) {
            res.render('mobile/add-mobile', { alert: 'mobile added successfully.' });
        } else {
            console.log(err);
            req.flash('error', 'Enter proper details!')
            res.redirect('/mobile/addmobile')
        }
        //   console.log('The data from mobile table: \n', rows[1]);
        // console.log('The data from specs table: \n', rows[2]);
    });
}


// Edit mobile
exports.edit = (req, res) => {

    connection.query('SELECT * FROM mobile WHERE Mob_ID = ?;SELECT * FROM specs where Mobile_ID=?', [req.params.Mob_ID, req.params.Mob_ID], (err, rows) => {

        if (!err) {
            s1 = { ...rows[0] }
            s2 = { ...rows[1] }
            const f1 = Object.assign(s1[0], s2[0])
            let ans = []
            ans.push(f1)
            console.log("The combined data is:\n", ans)
            res.render('mobile/edit-mobile', { ans });
        }
        else {
            console.log(err);
        }
    });
}


// Update mobile
exports.update = (req, res) => {
    const { Mob_Name, Mob_image, Mfd_Date, Price, Comp_ID, Stock, Processor, Camera, Display_Size, Battery, RAM, Storage } = req.body;

    connection.query('UPDATE mobile SET Mob_Name = ?,Mob_image=?, Mfd_Date = ?, Price = ?,Comp_ID=?,Stock=? WHERE Mob_ID = ? ; UPDATE specs SET Processor = ?, Camera = ?, Display_Size= ?,Battery=?,RAM=?,Storage=? WHERE Mobile_ID = ?', [Mob_Name, Mob_image, Mfd_Date, Price, Comp_ID, Stock, req.params.Mob_ID, Processor, Camera, Display_Size, Battery, RAM, Storage, req.params.Mob_ID], (err, rows) => {

        if (!err) {

            connection.query('SELECT * FROM mobile WHERE Mob_ID = ?; SELECT * FROM specs where Mobile_ID=?', [req.params.Mob_ID, req.params.Mob_ID], (err, rows) => {

                if (!err) {
                    res.render('mobile/edit-mobile', { rows, alert: `${Mob_Name} has been updated.` });
                } else {
                    console.log(err);
                }
                console.log('The data from mobile table: \n', rows);
            });
        } else {
            console.log(err);
        }
        console.log('The data from mobile table: \n', rows);
    });
}

// Delete mobile
exports.delete = (req, res) => {

    connection.query('DELETE FROM mobile WHERE Mob_ID = ?', [req.params.Mob_ID], (err, rows) => {

        if (!err) {
            let removedmobile = encodeURIComponent('mobile successfully removed.');
            res.redirect('/mobile/?removed=' + removedmobile);
        } else {
            console.log(err);
        }
        console.log('The data from mobile table: \n', rows);

    });

    // Hide a record

    //  connection.query('UPDATE mobile SET status = ? WHERE Mob_ID = ?', ['removed', req.params.Mob_ID], (err, rows) => {
    //       if (!err) {
    //         let removedmobile = encodeURIComponent('Mobile successfully removed.');
    //     res.redirect('/mobile/?removed=' + removedmobile);
    //      } else {
    // console.log(err);
    //    }
    //    console.log('The data from beer table are: \n', rows);
    // });

}

// View mobiles
exports.viewall = (req, res) => {

    connection.query('SELECT * FROM mobile WHERE Mob_ID = ?;SELECT * FROM specs where Mobile_ID=?', [req.params.Mob_ID, req.params.Mob_ID], (err, rows) => {
        if (!err) {
            s1 = { ...rows[0] }
            s2 = { ...rows[1] }
            const f1 = Object.assign(s1[0], s2[0])
            let ans = []
            ans.push(f1)
            console.log("The combined data is:\n", ans)
            let compaint = null;
            async function asyncCall() {
                const complaint = await Complaint.find({ mob_id: req.params.Mob_ID }).lean()
                let s3 = { complaint }
                console.log(s3)
                res.render('mobile/view-mobile', { ans, id: req.params.Mob_ID, s3 });
            }
            asyncCall();

        } else {
            console.log(err);
        }
        console.log('The data from mobile table: \n', rows);
    });

}
