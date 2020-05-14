
const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const mimodelSchema = new Schema({

    uno:{type:String},dos:{type:String},tres:{type:String},

}, {
    collection: 'mimodel'
});

module.exports = mongoose.model('mimodel', mimodelSchema);

