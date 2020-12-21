#!/bin/bash
_modelo=$1
_modeloSchema=$2
_atributos=(`cat /tempfiles/atributosFile`)

#creo una estructura para los atributos y sus tipos String
atributosEstructurados=""
for i in "${_atributos[@]}"
do
atributosEstructurados=$atributosEstructurados"${i}"
atributosEstructurados=$atributosEstructurados':{type:String},'
done


#Model.js
modelo="
const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const $_modeloSchema = new Schema({

    $atributosEstructurados

}, {
    collection: '$_modelo'
});

module.exports = mongoose.model('$_modelo', $_modeloSchema);
"
echo "$modelo" > ./_API_NodeJS-Generated/models/$_modelo.js 
echo '  - modelo.js, OK!'

