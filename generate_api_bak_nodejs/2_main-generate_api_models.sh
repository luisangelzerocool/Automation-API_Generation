#!/bin/bash
echo '******GENERANDO EL MODELO JS******'
echo 'Introduzca el modelo:'
read _modelo
echo 'Introduzca los atributos separados por espacios:'
read _atributos

`rm -rf /tempfiles`
`mkdir /tempfiles`

echo ${_atributos[@]} > /tempfiles/atributosFile
echo ${_atributos[@]} > ./_API_NodeJS-Generated/modelsUtil/$_modelo.txt #esta info la usaré en Angular para generar el front

_modeloSchema=$_modelo'Schema'
_modeloRouter=$_modelo'Router'
_modeloInstance=$_modelo'Instance'

#Model.js
./generate_modeljs.sh $_modelo $_modeloSchema 
#Route.js
./generate_routejs.sh $_modelo $_modeloRouter $_modeloInstance
#InfoAPI
./generate_info_api.sh $_modelo


