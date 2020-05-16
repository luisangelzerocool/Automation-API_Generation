#!/bin/bash
_nombreProject=$1
#tsconfig.json
tsconfig='
{
  "compileOnSave": false,
  "compilerOptions": {
    "baseUrl": "./",
    "outDir": "./dist/out-tsc",
    "sourceMap": true,
    "declaration": false,
    "module": "es2015",
    "moduleResolution": "node",
    "emitDecoratorMetadata": true,
    "experimentalDecorators": true,
    "target": "es5",
    "typeRoots": ["node_modules/@types"],
    "lib": ["es2017", "dom"]
  }
}

'
echo "$tsconfig" > ./$_nombreProject/tsconfig.json
echo 'tsconfig.json generado correctamente!'

