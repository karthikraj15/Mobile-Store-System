const express = require('express');
const router = express.Router();
const companyController = require('../controllers/companyController');
const { isLoggedIn } = require('../../middleware');



// Routes
router.get('/', isLoggedIn, companyController.view);
router.post('/', isLoggedIn, companyController.find);
router.get('/addcompany', isLoggedIn, companyController.form);
router.post('/addcompany', isLoggedIn, companyController.create);
router.get('/editcompany/:Comp_ID', isLoggedIn, companyController.edit);
router.post('/editcompany/:Comp_ID', isLoggedIn, companyController.update);
router.get('/viewcompany/:Comp_ID', isLoggedIn, companyController.viewall);
router.get('/:Comp_ID', isLoggedIn, companyController.delete);

module.exports = router;