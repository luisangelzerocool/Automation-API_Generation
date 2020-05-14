
const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const invoiceSchema = new Schema({

    a1:{type:String},a2:{type:String},a3:{type:String},

}, {
    collection: 'invoice'
});

module.exports = mongoose.model('invoice', invoiceSchema);

