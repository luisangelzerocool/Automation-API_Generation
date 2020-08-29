
const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const inventarySchema = new Schema({

    identification:{type:String},details:{type:String},valuer:{type:String},

}, {
    collection: 'inventary'
});

module.exports = mongoose.model('inventary', inventarySchema);

