const mysqlConnection  = require('../BaseDeDatos');
// GET all 

function MDes(req, res){
  console.log('Get all descuento');
  mysqlConnection.query('SELECT * FROM descuento', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  }); 
};

// GET only one
function MADes(req, res){
  const { Cod_Descuento } = req.params; 
  console.log('Get a descuento');
  mysqlConnection.query('SELECT * FROM descuento WHERE Cod_Descuento = ?', [Cod_Descuento], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
};
//Insertar
function IDes(req, res){
  const {Nombre_Des,Porcentaje_Des} = req.body;
  console.log(Nombre_Des,Porcentaje_Des);
  mysqlConnection.query('insert into descuento(Nombre_Des,Porcentaje_Des)values(?,?)', [Nombre_Des,Porcentaje_Des], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Descuento Agregado'});
    } else {
      console.log(err);
    }
  });
};
//Actualizar
function ADes(req, res){
  const { Cod_Descuento } = req.params;
  const { Nombre_Des, Porcentaje_Des} = req.body;
  console.log(Nombre_Des,Cod_Descuento,Porcentaje_Des)
  console.log('update empleado');
  mysqlConnection.query('update descuento set Nombre_Des = ?, Porcentaje_Des = ? where Cod_Descuento = ?', [Nombre_Des,Porcentaje_Des,Cod_Descuento], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Descuento Actualizado'});
    } else {
      console.log(err);
    }
  });
};
//Eliminar
function EDes(req, res){
  const { Cod_Descuento } = req.params;
  console.log('delete Dep');
  mysqlConnection.query('DELETE FROM descuento WHERE Cod_Descuento = ?', [Cod_Descuento], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Descuento Eliminado'});
    } else {
      console.log(err);
    }
  });
};
module.exports = {MDes,MADes,IDes,ADes,EDes};