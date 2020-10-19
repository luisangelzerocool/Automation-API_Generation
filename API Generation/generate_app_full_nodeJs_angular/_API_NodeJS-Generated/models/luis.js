
const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const luisSchema = new Schema({

    luis1:{type:String},luis2:{type:String},

}, {
    collection: 'luis'
});

module.exports = mongoose.model('luis', luisSchema);

