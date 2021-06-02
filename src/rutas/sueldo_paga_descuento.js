const mysqlConnection  = require('../BaseDeDatos');
// GET all 

function MSPD(req, res){
  console.log('Get all descuento');
  mysqlConnection.query('SELECT * FROM sueldo_paga_descuento', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });   
};
// GET only one
function MASPD(req, res){
  const { Cod_Sueldo } = req.params; 
  console.log('Get a empleado');
  mysqlConnection.query('SELECT * FROM sueldo_paga_descuento WHERE Cod_Sueldo = ?', [Cod_Sueldo], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
};
//Insertar
function ISPD(req, res){
  console.log('insertar');
  const {Cod_Sueldo,Cod_Descuentos} = req.body;
  console.log(Cod_Sueldo,Cod_Descuentos);
  mymysqlConnection.query('insert into sueldo_paga_descuento(Cod_Sueldo,Cod_Descuentos)values(?,?)', [Cod_Sueldo,Cod_Descuentos], (err, rows, fields) => {
      if(!err) {
        res.json({status: 'SPD Agregado'});
      } else {
        console.log(err);
      }
  });
};
//Actualizar
function ASPD(req, res){
  const { Cod_Descuentos } = req.body;
  const { Cod_Sueldo } = req.params;
  console.log(req.params);
  console.log(Cod_Sueldo,Cod_Descuentos)
  console.log('update empleado');
  mysqlConnection.query('update sueldo_paga_descuento set Cod_Sueldo = ? Cod_Descuentos =? where Cod_Sueldo = ?', [Cod_Sueldo,Cod_Descuentos,Cod_Sueldo], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'SPD Actualizado'});
    } else {
      console.log(err);
    }
  });
};
//Eliminar
function ESPD(req, res){
  const { Cod_Sueldo } = req.params;
  console.log('delete admi');
  mysqlConnection.query('DELETE FROM sueldo_paga_descuento WHERE Cod_Sueldo = ?', [Cod_Sueldo], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'administrador Eliminado'});
    } else {
      console.log(err);
    }
  });
};



module.exports = {MSPD,MASPD,ISPD,ASPD,ESPD};