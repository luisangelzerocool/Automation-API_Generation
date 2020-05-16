
const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const machineSchema = new Schema({

    identification:{type:String},details:{type:String},valuer:{type:String},

}, {
    collection: 'machine'
});

module.exports = mongoose.model('machine', machineSchema);

