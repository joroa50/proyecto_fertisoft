const  mysql = require (  'mysql2/promise');
//const { connection } = require('../database'); // Solo necesitamos la conexión a la base de datos
async function empleado(req,res) {
    console.log(req.params.username)
    console.log(req.params.password)
    const connection = await  mysql.createConnection({
        host: 'localhost',
        user: 'root',
        database: 'mydb',
      })
    const usuario = req.params.username
    const contrasena = req.params.password
    const usuarios= await connection.execute ("select * from usuarios where usuario = '"+ usuario + "' and contrasena='"+contrasena+"'")
    console.log (usuarios)
    if (usuarios[0].length) {
        res.send({logeado: true})      
    } else {
        res.send({logeado: false})  
    }
    // if (req.params.username == "chris" && req.params.password == "12345" ) {
    //     res.send({logeado: true})   
    // } else {  res.send({logeado: false})
        
    // }
    
   }
   module.exports = { empleado }