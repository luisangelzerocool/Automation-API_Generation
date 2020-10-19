#!/bin/bash
echo '# Generando el Arquetipo de NodeJS...'

`rm -rf ./_API_NodeJS-Generated`
`mkdir ./_API_NodeJS-Generated`
`mkdir ./_API_NodeJS-Generated/models`
`mkdir ./_API_NodeJS-Generated/routes`
`mkdir ./_API_NodeJS-Generated/infoAPI`
`mkdir ./_API_NodeJS-Generated/modelsUtil`

#Package.json
./generate_packagejson.sh 
#README.md
./generate_readmemd.sh 


