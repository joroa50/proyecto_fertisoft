const  mysql = require (  'mysql2');

 const connection =   mysql.createPool({
  host: 'localhost',
  user: 'root',
  database: 'mydb',
})

const pool=connection.promise()
async function iniciar() {
 await pool.getConnection()
 
}
iniciar()
module.exports={pool,iniciar}