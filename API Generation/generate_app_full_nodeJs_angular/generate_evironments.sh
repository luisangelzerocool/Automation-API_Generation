#!/bin/bash
_nombreProject=$1


#environment.ts
environment='
export const environment = {
  production: false
};
'
echo "$environment" > ./$_nombreProject/src/environments/environment.ts
echo '  - environment.ts, OK!'

#environment.prod.ts
environmentprod='
export const environment = {
  production: true
};
'
echo "$environmentprod" > ./$_nombreProject/src/environments/environment.prod.ts
echo '  - environment.prod.ts, OK!'