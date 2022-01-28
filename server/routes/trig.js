const express = require('express');
const router = express.Router();
const trigController = require('../controllers/trigController');
const { isLoggedIn } = require('../../middleware');

router.get('/', isLoggedIn, trigController.view);

module.exports = router;