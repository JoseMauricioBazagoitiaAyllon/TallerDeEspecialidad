const mysqlConnection  = require('../BaseDeDatos');
// GET all 

function MS(req, res){
  console.log('Get all departamento');
  mysqlConnection.query('SELECT * FROM sueldo', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  }); 
};

// GET only one
function MAS(req, res){
  const { Cod_Sueldo } = req.params; 
  console.log('Get a empleado');
  mysqlConnection.query('SELECT * FROM sueldo WHERE Cod_Sueldo = ?', [Cod_Sueldo], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
};
//Insertar
function IS(req, res){
  console.log('insertar');
  const {Cant_Sueldo_Dia, Cant_Sueldo_Horas_Extras} = req.body;
  console.log(Cant_Sueldo_Dia, Cant_Sueldo_Horas_Extras);
  mysqlConnection.query('insert into Sueldo(Cant_Sueldo_Dia,Cant_Sueldo_horas_extras)values(?,?)', [Cant_Sueldo_Dia, Cant_Sueldo_Horas_Extras], (err, rows, fields) => {
      if(!err) {
        res.json({status: 'Sueldo Agregado'});
      } else {
        console.log(err);
      }
  });
};
//Actualizar
function AS(req, res){
  const { Cod_Sueldo } = req.params;
  const { Cant_Sueldo_Dia, Cant_Sueldo_Horas_Extras} = req.body;
  console.log(Cod_Sueldo,Cant_Sueldo_Dia, Cant_Sueldo_Horas_Extras)
  console.log('update empleado');
  mysqlConnection.query('update Sueldo set Cant_Sueldo_Dia = ?, Cant_Sueldo_Horas_Extras = ? where Cod_Sueldo = ?', [Cant_Sueldo_Dia, Cant_Sueldo_Horas_Extras,Cod_Sueldo], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'departamento Actualizado'});
    } else {
      console.log(err);
    }
  });
};
//Eliminar
function ES(req, res){
  const { Cod_Sueldo } = req.params;
  console.log('delete Dep');
  mysqlConnection.query('DELETE FROM sueldo WHERE Cod_Sueldo = ?', [Cod_Sueldo], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Sueldo Eliminado'});
    } else {
      console.log(err);
    }
  });
};
module.exports = {MS,MAS,IS,AS,ES};