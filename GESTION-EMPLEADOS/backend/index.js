const express = require('express');   
const morgan = require('morgan');
const cors = require('cors');
const app = express();
const {empleado} = require ("./routes/empleado.js")
const { mongoose } = require('./database'); // Solo necesitamos la conexión a la base de datos

// Configuraciones
app.set('port', process.env.PORT || 3000);
app.use(morgan('dev'));
app.use(express.json());
app.use(cors({ origin: 'http://127.0.0.1:3001' }));

// Rutas de nuestro servidor
app.use('/api/empleados/:nombre', empleado)
app.use('/:username/:password', empleado)

// Iniciando el servidor
app.listen(app.get('port'), () => {
  console.log('Servidor activo en el puerto', app.get('port'));
});