const express = require('express');
const router = express.Router();
const ordersController = require('../controllers/ordersController');
const { isLoggedIn } = require('../../middleware');

// Routes
router.get('/', isLoggedIn, ordersController.view);
router.post('/', isLoggedIn, ordersController.find);
router.get('/addorders', isLoggedIn, ordersController.form);
router.post('/addorders', isLoggedIn, ordersController.create);
router.get('/editorders/:Ord_ID', isLoggedIn, ordersController.edit);
router.post('/editorders/:Ord_ID', isLoggedIn, ordersController.update);
router.get('/vieworders/:Ord_ID', isLoggedIn, ordersController.viewall);
router.get('/:Ord_ID', isLoggedIn, ordersController.delete);

module.exports = router; 