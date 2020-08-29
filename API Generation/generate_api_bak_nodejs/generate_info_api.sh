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
Ruta Base de la API: ${_modelo}

# CREATE: 
url: localhost:3000/${_modelo}/add
metodo: post

# FIND-ALL: 
url: localhost:3000/${_modelo}/
metodo: get

# FIND: 
url: localhost:3000/${_modelo}/edit/:id
metodo: get

# UPDATE: 
url: localhost:3000/${_modelo}/update/:id
metodo: post

# DELETE: 
url: localhost:3000/${_modelo}/delete/:id
metodo: get
"


echo "$infoAPI" > ./_API_NodeJS-Generated/infoAPI/'infoAPI_'$_modelo.txt
echo 'infoAPI.txt generado correctamente!'


