const express = require('express');   
const morgan = require('morgan');
const cors = require('cors');
const app = express();
const {empleado} = require ("./routes/empleado.js")
const  mysql = require (  'mysql2/promise');
const {iniciar}=require("./database.js")

// Configuraciones
app.use(morgan('dev'));
app.use(express.json());
app.use(cors({ origin: '*' }));
app.use(cors({ origin: '*' }));
app.use(cors({ origin: '*' }));
app.use(cors({ origin: '*' }));

// Rutas de nuestro servidor
app.use('/api/empleados/:nombre', empleado)
app.use('/:username/:password', empleado)

// Iniciando el servidor
iniciar().then (()=>{app.listen (3002, () => {
  console.log('Servidor activo en el puerto', 3002);
});
})