#!/bin/bash
_modelo=Invoice
_modeloMinus=invoice #este sirve para la ruta de la API
_nombreBD=ingeweb
_atributos=('atributo1' 'atributo2' 'atributo3')

echo ${_atributos[@]} > /tempfiles/atributosFile
_modeloSchema=$_modelo'Schema'
_modeloRouter=$_modelo'Router'
#Server.js
generar_serverjs.sh $_modeloRouter $_modeloMinus $_nombreBD
#Model.js
generar_modeljs.sh $_modelo $_modeloSchema 
#Route.js
generar_routejs.sh $_modelo $_modeloRouter $_modeloMinus 


