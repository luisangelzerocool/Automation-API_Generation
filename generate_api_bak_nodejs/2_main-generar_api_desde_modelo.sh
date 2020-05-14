#!/bin/bash
echo '******GENERANDO EL MODELO JS******'
echo ''
echo 'Introduzca el modelo'
read _modelo
echo 'Introduzca los atributos separados por espacios'
read _atributos

`rm -rf /tempfiles`
`mkdir /tempfiles`

echo ${_atributos[@]} > /tempfiles/atributosFile
_modeloSchema=$_modelo'Schema'
_modeloRouter=$_modelo'Router'
_modeloInstance=$_modelo'Instance'

#Model.js
./generar_modeljs.sh $_modelo $_modeloSchema 
#Route.js
./generar_routejs.sh $_modelo $_modeloRouter $_modeloInstance
#InfoAPI
./generar_info_api.sh $_modelo


