#!/bin/bash
echo '******GENERANDO EL SERVER JS******'
echo 'Introduzca el nombre de la BD:'
read _nombreBD

# INICIO bloque de código que crea los modelos en el server, partiendo de los archivos que haya en la carpeta models
modelos=""
for modelo in `cd _API_NodeJS-Generated/models/ && find`; do #muestra . y muestra ./archivo.js
modeloConExt=`basename -s .txt "$modelo"` #Obtengo el nombre base del archivo.js me aparecerá sin ./archivo.js
modeloSinExt="${modeloConExt%.*}" #obtengo archivo sin extensión
if [ "${modeloSinExt}" != '' ];#como simpre lee un nombre . "vacio" entonces lo ovbio
then
modelos=$modelos"var ${modeloSinExt}Router= require('./routes/${modeloSinExt}Router'); 
app.use('/${modeloSinExt}', ${modeloSinExt}Router);
"
fi
done
# FIN bloque de código que crea los modelos en el server, partiendo de los archivos que haya en la carpeta models

#Server.js
server="
var express = require('express');
var cors = require('cors');
var path = require('path');
var bodyParser = require('body-parser');
const mongoose = require('mongoose');
var app = express();

var port = process.env.PORT || 3000;
const mongoURI = 'mongodb://localhost:27017/$_nombreBD';

mongoose.connect(mongoURI,{ useNewUrlParser: true })
.then(() => console.log('MongoDB Connected'))
.catch(err => console.log(err));

app.use(bodyParser.json());
app.use(cors());

//modelos:
$modelos

app.listen(port, function() {
    console.log('Server is running on port: ' + port);
})
"
echo "$server" > ./_API_NodeJS-Generated/server.js
echo 'Server.js generado correctamente!'

