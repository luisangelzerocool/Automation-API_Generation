
const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const machineSchema = new Schema({

    a1:{type:String},a2:{type:String},a3:{type:String},

}, {
    collection: 'machine'
});

module.exports = mongoose.model('machine', machineSchema);

