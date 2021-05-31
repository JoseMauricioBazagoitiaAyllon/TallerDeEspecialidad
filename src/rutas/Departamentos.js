const mysqlConnection  = require('../BaseDeDatos');
// GET all 

function MDep(req, res){
  console.log('Get all departamento');
  mysqlConnection.query('SELECT * FROM departamento', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  }); 
};

// GET only one
function MADep(req, res){
  const { Cod_Dep } = req.params; 
  console.log('Get a empleado');
  mysqlConnection.query('SELECT * FROM departamento WHERE Cod_Dep = ?', [Cod_Dep], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
};
//Insertar
function IDep(req, res){
  console.log('insertar');
  const {Nombre_Dep} = req.body;
  console.log(Nombre_Dep);
  mysqlConnection.query('insert into departamento(Nombre_Dep)values(?)', [Nombre_Dep], (err, rows, fields) => {
      if(!err) {
        res.json({status: 'Departamento Agregado'});
      } else {
        console.log(err);
      }
  });
};
//Actualizar
function ADep(req, res){
  const { Nombre_Dep } = req.body;
  const { Cod_Dep } = req.params;
  console.log(Nombre_Dep,Cod_Dep)
  console.log('update empleado');
  mysqlConnection.query('update departamento set Nombre_Dep = ? where Cod_Dep = ?', [Nombre_Dep,Cod_Dep], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'departamento Actualizado'});
    } else {
      console.log(err);
    }
  });
};
//Eliminar
function EDep(req, res){
  const { id } = req.params;
  console.log('delete Dep');
  mysqlConnection.query('DELETE FROM departamento WHERE Cod_Dep = ?', [id], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'departamento Eliminado'});
    } else {
      console.log(err);
    }
  });
};
module.exports = {MDep,MADep,IDep,ADep,EDep};