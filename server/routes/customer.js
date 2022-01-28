const express = require('express');
const router = express.Router();
const customerController = require('../controllers/customerController');
const { isLoggedIn } = require('../../middleware');

// Routes
router.get('/', isLoggedIn, customerController.view);
router.post('/', isLoggedIn, customerController.find);
router.get('/addcustomer', isLoggedIn, customerController.form);
router.post('/addcustomer', isLoggedIn, customerController.create);
router.get('/editcustomer/:Customer_ID', isLoggedIn, customerController.edit);
router.post('/editcustomer/:Customer_ID', isLoggedIn, customerController.update);
router.get('/viewcustomer/:Customer_ID', isLoggedIn, customerController.viewall);
router.get('/:Customer_ID', isLoggedIn, customerController.delete);

module.exports = router;