const { pool } = require('../database'); // Solo necesitamos la conexión a la base de datos
async function empleado(req,res) {
    console.log(req.params.username)
    console.log(req.params.password)
    
    const usuario = req.params.username
    const contrasena = req.params.password
    const usuarios= await pool.query ("select * from usuarios where usuario = '"+ usuario + "' and contrasena='"+contrasena+"'")
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