const express = require('express');
const router = express.Router();
const storeController = require('../controllers/storeController');
const { isLoggedIn } = require('../../middleware');

// Routes
router.get('/', isLoggedIn, storeController.view);
router.post('/', isLoggedIn, storeController.find);
router.get('/addstore', isLoggedIn, storeController.form);
router.post('/addstore', isLoggedIn, storeController.create);
router.get('/editstore/:Store_ID', isLoggedIn, storeController.edit);
router.post('/editstore/:Store_ID', isLoggedIn, storeController.update);
router.get('/viewstore/:Store_ID', isLoggedIn, storeController.viewall);
router.get('/:Store_ID', isLoggedIn, storeController.delete);

module.exports = router;