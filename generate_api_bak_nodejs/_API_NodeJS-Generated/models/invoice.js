
const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const invoiceSchema = new Schema({

    numero:{type:String},detalle:{type:String},valor:{type:String},

}, {
    collection: 'invoice'
});

module.exports = mongoose.model('invoice', invoiceSchema);

