#!/bin/bash
echo '******CREANDO APP ANGULAR Y NODE JS CON MONGODB******'

./1_main-generate_arquetipo_apiNode.sh
./2_main-generate_api_models.sh
./3_main-generate_serverjs.sh


#para poner a funcionar en ubuntu, se crea en la ruta luisangel/ el directorio: /data/db
#se ejecuta en Ubuntu así: mongod --dbpath ~/data/db

#`cd ./generate_api_bak_nodejs/_API_NodeJS-Generated/ && mongod --dbpath ~/data/db`
#`cd ./generate_api_bak_nodejs/_API_NodeJS-Generated/ && mongo --dbpath ~/data/db`
#`cd ./generate_api_bak_nodejs/_API_NodeJS-Generated/ && npm start`

./1_main-generate_arquetipo_apiAngular.sh

`cp -r ./_API_NodeJS-Generated/modelsUtil ./_API_Angular-Generated/src/app/ `

./2_main-generate_app.sh
