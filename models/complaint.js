const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const complaintSchema = new Schema({
    body: String,
    mob_id: Number,
    cust_id: Number,
    rating: Number
});

module.exports = mongoose.model("Complaint", complaintSchema);