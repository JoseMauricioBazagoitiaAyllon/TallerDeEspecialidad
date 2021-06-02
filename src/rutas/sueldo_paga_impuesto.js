const mysqlConnection  = require('../BaseDeDatos');
// GET all 

function MSPI(req, res){
  console.log('Get all descuento');
  mysqlConnection.query('SELECT * FROM sueldo_paga_impuesto', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });   
};
// GET only one
function MASPI(req, res){
  const { Cod_Sueldo } = req.params; 
  console.log('Get a empleado');
  mysqlConnection.query('SELECT * FROM sueldo_paga_impuesto WHERE Cod_Sueldo = ?', [Cod_Sueldo], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
};
//Insertar
function ISPI(req, res){
  console.log('insertar');
  const {Cod_Sueldo,Cod_Imp} = req.body;
  console.log(Cod_Sueldo,Cod_Imp);
  mymysqlConnection.query('insert into sueldo_paga_impuesto(Cod_Sueldo,Cod_Imp)values(?,?)', [Cod_Sueldo,Cod_Imp], (err, rows, fields) => {
      if(!err) {
        res.json({status: 'SPI Agregado'});
      } else {
        console.log(err);
      }
  });
};
//Actualizar
function ASPI(req, res){
  const { Cod_Imp } = req.body;
  const { Cod_Sueldo } = req.params;
  console.log(req.params);
  console.log(Cod_Sueldo,Cod_Imp)
  console.log('update empleado');
  mysqlConnection.query('update sueldo_paga_impuesto set Cod_Sueldo = ? Cod_Imp =? where Cod_Sueldo = ?', [Cod_Sueldo,Cod_Imp,Cod_Sueldo], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'SPI Actualizado'});
    } else {
      console.log(err);
    }
  });
};
//Eliminar
function ESPI(req, res){
  const { Cod_Sueldo } = req.params;
  console.log('delete admi');
  mysqlConnection.query('DELETE FROM sueldo_paga_impuesto WHERE Cod_Sueldo = ?', [Cod_Sueldo], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'administrador Eliminado'});
    } else {
      console.log(err);
    }
  });
};
module.exports = {MSPI,MASPI,ISPI,ASPI,ESPI};