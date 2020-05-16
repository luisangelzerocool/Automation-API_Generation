#!/bin/bash
echo '******GENERANDO EL ARQUETIPO******'

_nombreProject='_API_Angular-Generated'

`rm -rf ./$_nombreProject`
`mkdir ./$_nombreProject`
`mkdir ./$_nombreProject/src`
`mkdir ./$_nombreProject/src/environments`
`mkdir ./$_nombreProject/src/app`
`mkdir ./$_nombreProject/src/app/modelsUtil`
`mkdir ./$_nombreProject/src/app/tempFiles`

#Package.json
./generate_packagejson.sh $_nombreProject
#Package-lock.json
./generate_package-lockjson.sh $_nombreProject
#README.md
./generate_readmemd.sh $_nombreProject
#tslint.json
./generate_tslintjson.sh $_nombreProject
#Angular.json
./generate_angularjson.sh $_nombreProject
#.editorconfig
./generate_.editorconfig.sh $_nombreProject
#tsconfig.json
./generate_tsconfigjson.sh $_nombreProject
#filesAuxSrc
./generate_filesAuxsrc.sh $_nombreProject

#environments
./generate_evironments.sh $_nombreProject
#index.html
./generate_indexhtml.sh $_nombreProject

