#!/bin/bash
_modelo=$1
_atributos=(`cat /tempfiles/atributosFile`)

#creo una estructura para los atributos y sus tipos String
atributosEstructurados=""
for i in "${_atributos[@]}"
do
atributosEstructurados=$atributosEstructurados"${i}"
done


#infoAPI.txt
infoAPI="
INFORMACIÓN DE LA API

Modelo: $_modelo
Atributos:
"${_atributos[@]}"
--------------------------------------------
Ruta Base de la API: ${_modelo}api

# CREATE: 
url: localhost:3000/${_modelo}api/add
metodo: post

# FIND-ALL: 
url: localhost:3000/${_modelo}api/findall
metodo: get

# FIND: 
url: localhost:3000/${_modelo}api/find/:id
metodo: get

# UPDATE: 
url: localhost:3000/${_modelo}api/update/:id
metodo: post

# DELETE: 
url: localhost:3000/${_modelo}api/delete/:id
metodo: get
"


echo "$infoAPI" > ./_API_NodeJS-Generated/infoAPI/'infoAPI_'$_modelo.txt
echo 'infoAPI.txt generado correctamente!'
echo 'RECUERDA QUE CAMBIASTE LA RUTA DE LA API DE EDIT POR FIND Y / POR FINDALL'


