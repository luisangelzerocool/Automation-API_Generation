#!/bin/bash
echo '******GENERANDO EL ARQUETIPO******'
echo ''

`rm -rf ./_API_NodeJS-Generated`
`mkdir ./_API_NodeJS-Generated`
`mkdir ./_API_NodeJS-Generated/models`
`mkdir ./_API_NodeJS-Generated/routes`
`mkdir ./_API_NodeJS-Generated/infoAPI`

#Package.json
./generar_packagejson.sh 
#Package-lock.json
./generar_package-lockjson.sh 
#README.md
./generar_readmemd.sh 


