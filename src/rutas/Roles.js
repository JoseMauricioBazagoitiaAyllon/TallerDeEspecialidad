const mysqlConnection  = require('../BaseDeDatos');
// GET all 

function MR(req, res){
  console.log('Get all descuento');
  mysqlConnection.query('SELECT * FROM rol', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });   
};

// GET only one
function MAR(req, res){
  const { Cod_Rol } = req.params; 
  console.log('Get a descuento');
  mysqlConnection.query('SELECT * FROM rol WHERE Cod_Rol = ?', [Cod_Rol], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
};
//Insertar
function IR(req, res){
  const {Nombre_Rol} = req.body;
  console.log(Nombre_Rol);
  mysqlConnection.query('insert into rol(Nombre_Rol)values(?)', [Nombre_Rol], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Rol Agregado'});
    } else {
        
      console.log();
      res.json({status: "Si quieres Insertar no olvides poner 'Cod_Rol = 0'"});
      console.log(err);
    }
  });
};
//Actualizar
function AR(req, res){
  const { Nombre_Rol } = req.body;
  const { Cod_Rol } = req.params;
  console.log(req.params);
  console.log(Nombre_Rol,Cod_Rol)
  console.log('update empleado');
  mysqlConnection.query('update rol set Nombre_Rol = ? where Cod_Rol = ?', [Nombre_Rol,Cod_Rol], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Rol Actualizado'});
    } else {
      console.log(err);
    }
  });
};
//Eliminar
function ER(req, res){
  const { Cod_Rol } = req.params;
  console.log('delete Dep');
  mysqlConnection.query('DELETE FROM rol WHERE Cod_Rol = ?', [Cod_Rol], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Empleado Eliminado'});
    } else {
      console.log(err);
    }
  });
};
module.exports = {MR,MAR,IR,AR,ER};