const express = require('express');
const router = express.Router();
const mobileController = require('../controllers/mobileController');
const { isLoggedIn } = require('../../middleware');

// Routes
router.get('/', mobileController.view);
router.post('/', mobileController.find);
router.get('/addmobile', isLoggedIn, mobileController.form);
router.post('/addmobile', isLoggedIn, mobileController.create);
router.get('/editmobile/:Mob_ID', isLoggedIn, mobileController.edit);
router.post('/editmobile/:Mob_ID', isLoggedIn, mobileController.update);
router.get('/viewmobile/:Mob_ID', mobileController.viewall);
router.get('/:Mob_ID', isLoggedIn, mobileController.delete);

module.exports = router;