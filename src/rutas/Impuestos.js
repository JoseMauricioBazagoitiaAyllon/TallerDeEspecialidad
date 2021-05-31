const mysqlConnection  = require('../BaseDeDatos');
// GET all 

function MI(req, res){
  console.log('Get all descuento');
  mysqlConnection.query('SELECT * FROM impuesto', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });  
};

// GET only one
function MAI(req, res){
  const { Cod_Imp } = req.params;
  console.log('Get a descuento');
  mysqlConnection.query('SELECT * FROM impuesto WHERE Cod_Imp = ?', [Cod_Imp], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
};
//Insertar
function II(req, res){
  const {Nombre_Imp,Porcentaje_Imp} = req.body;
  console.log(Nombre_Imp,Porcentaje_Imp);
  mysqlConnection.query('insert into impuesto(Nombre_Imp,Porcentaje_Imp)values(?,?)' ,[Nombre_Imp,Porcentaje_Imp], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Impuesto Agregado'});
    } else {
      console.log(err);
    }
  });
};
//Actualizar
function AI(req, res){
  const { Cod_Imp } = req.params;
  const { Nombre_Imp, Porcentaje_Imp} = req.body;
  console.log(Nombre_Imp,Cod_Imp,)
  console.log('update empleado');
  mysqlConnection.query('update impuesto set Nombre_Imp = ?, Porcentaje_Imp = ? where Cod_Imp = ?', [Nombre_Imp, Porcentaje_Imp,Cod_Imp],
       (err, rows, fields) => {
        if(!err) {
          res.json({status: 'Impuesto Actualizado'});
        } else {
          console.log(err);
        }
      });
};
//Eliminar
function EI(req, res){
  const { Cod_Imp } = req.params;
  console.log('delete Dep');
  mysqlConnection.query('DELETE FROM impuesto WHERE Cod_Imp = ?', [Cod_Imp], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Impuesto Eliminado'});
    } else {
      console.log(err);
    }
  });
};
module.exports = {MI,MAI,II,AI,EI};