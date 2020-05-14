#!/bin/bash
_modeloRouter=$1
_modeloMinus=$2
_nombreBD=$3

#Server.js
server="var express = require('express');
var cors = require('cors');
var path = require('path');
var bodyParser = require('body-parser');
const mongoose = require('mongoose');
var app = express();
var $_modeloRouter = require('./routes/$_modeloRouter');


var port = process.env.PORT || 3000;
const mongoURI = 'mongodb://localhost:27017/$_nombreBD';

mongoose.connect(mongoURI, { useNewUrlParser: true }).then(() => console.log('MongoDB Connected')).catch(err => console.log(err));

app.use(bodyParser.json());
app.use(cors());
app.use('/$_modeloMinus', $_modeloRouter);


app.listen(port, function() {
    console.log('Server is running on port: ' + port);
})"
echo $server > ./_API_NodeJS-Generated/server.js
echo 'Server.js generado correctamente!'

