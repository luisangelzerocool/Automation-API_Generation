
var express = require('express');
var cors = require('cors');
var path = require('path');
var bodyParser = require('body-parser');
const mongoose = require('mongoose');
var app = express();

var port = process.env.PORT || 3000;
const mongoURI = 'mongodb://localhost:27017/luisdb';

mongoose.connect(mongoURI,{ useNewUrlParser: true })
.then(() => console.log('MongoDB Connected'))
.catch(err => console.log(err));

app.use(bodyParser.json());
app.use(cors());

//modelos:
var inventaryRouter= require('./routes/inventaryRouter'); 
app.use('/inventary', inventaryRouter);
var invoiceRouter= require('./routes/invoiceRouter'); 
app.use('/invoice', invoiceRouter);
var machineRouter= require('./routes/machineRouter'); 
app.use('/machine', machineRouter);


app.listen(port, function() {
    console.log('Server is running on port: ' + port);
})

