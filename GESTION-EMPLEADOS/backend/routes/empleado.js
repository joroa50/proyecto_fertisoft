function empleado(req,res) {
    console.log(req.params.username)
    console.log(req.params.password)
    if (req.params.username == "chris" && req.params.password == "12345" ) {
        res.send({logeado: true})   
    } else {  res.send({logeado: false})
        
    }
    
   }
   module.exports = { empleado }