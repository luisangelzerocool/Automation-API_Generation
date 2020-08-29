
const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const invoiceSchema = new Schema({

    identification:{type:String},details:{type:String},valuer:{type:String},

}, {
    collection: 'invoice'
});

module.exports = mongoose.model('invoice', invoiceSchema);

