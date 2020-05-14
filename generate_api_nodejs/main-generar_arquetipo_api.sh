#!/bin/bash

`rm -rf ./_API_NodeJS-Generated`
`mkdir ./_API_NodeJS-Generated`
`mkdir ./_API_NodeJS-Generated/models`
`mkdir ./_API_NodeJS-Generated/routes`

#Package.json
generar_packagejson.sh 
#Package-lock.json
generar_package-lockjson.sh 
#README.md
generar_readmemd.sh 


