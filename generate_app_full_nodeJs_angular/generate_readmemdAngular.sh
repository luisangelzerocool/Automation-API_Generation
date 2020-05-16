#!/bin/bash
_nombreProject=$1
#README.md
readme='
# Arquetipo de API de Angular Generado Automaticamente

# Versión

* Angular CLI: 9.0.7
* Node: 12.16.1
* OS: win32 x64

# Configuración Inicial
Después de generado el arquetipo, desde la ruta de la API se ejecuta `npm install`

## Ejecución de Base de Datos MongoDB
1. ejecuta el mongod 
2. ejecuta el mongo
3. ejecuta dentro de mongo: `use nombre_bd`

## Ejecución del servidor Node JS
1. desde el cmd nos ubicamos en la ruta del server
2. digitamos el comando `npm run dev`

## Ejecución del client de Angular
1. desde el cmd nos ubicamos en la ruta del server
2. digitamos el comando `npm start`


# Funcionamiento de la API
## Server Node JS
* Usamos el `server.js` para conectarnos a nuestra base de datos MongoDB y seteamos las routes y definimos el puerto donde correrá la app
* Usamos el archivo de modelo de la entidad `Employee.js` para construir nuestra entidad en la base de datos mongoDB, por medio de mongoose
* Usamos los routes para crear la lógica del negocio, el CRUD de la API. 

## Client Angular 
* Usamos el `proxy-config` para en vez de usar: localhost:3000/ usamos: /employees
* En `package.json` indicamos que inicie el server con el proxy que creamos anteriormente
* Usamos el `Authentication.service.ts` para crear los metodos que usaremos para nuestro servicio de autenticación
* Usamos el `Auth-guard.service.ts` para gestionar la sesión y ver si está logeado y no se le ha vencido la sesión
* Usamos el `app.module.ts` para declarar las rutas del lado del front y de más (otras restricciones)
* Usamos el `app.component.ts` para indicar el uso de nuestro servicio de autenticación en nuestro pagina base (menú)
* Usamos el `app.component.html` para pegar nuestro html del menú
* para los components adicionales, se usa lo mismo que se describió en los dos últimos puntos

'
echo "$readme" > ./$_nombreProject/README.md
echo 'README.md generado correctamente!'

