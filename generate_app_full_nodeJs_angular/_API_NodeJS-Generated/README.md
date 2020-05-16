
# Arquetipo de API de NodeJS Generado Automaticamente

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


# Funcionamiento de la API
## Server Node JS
* Usamos el `server.js` para conectarnos a nuestra base de datos MongoDB y seteamos las routes y definimos el puerto donde correrá la app
* Usamos el archivo de modelo de la entidad `Employee.js` para construir nuestra entidad en la base de datos mongoDB, por medio de mongoose
* Usamos los routes para crear la lógica del negocio, el CRUD de la API. 

