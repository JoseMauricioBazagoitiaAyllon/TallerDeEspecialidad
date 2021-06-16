const mysqlConnection  = require('../BaseDeDatos');
// GET all 

function MF(req, res){
  console.log('Get all dacturas emitidas');
  mysqlConnection.query('SELECT * FROM factura', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  }); 
};

// GET only one
function MAF(req, res){
  const { Cod_Factura } = req.params; 
  console.log('Get a factura emitida');
  mysqlConnection.query('SELECT * FROM factura WHERE Cod_Factura = ?', [Cod_Factura], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
};
//Insertar
function IF(req, res){
  console.log('insertar');
  const {Empresa_Factura,Cantidad_Factura} = req.body;
  console.log(Empresa_Factura,Cantidad_Factura);
  mysqlConnection.query('insert into factura(Empresa_Factura,Cantidad_Factura)values(?,?)', [Empresa_Factura,Cantidad_Factura], (err, rows, fields) => {
      if(!err) {
        res.json({status: 'factura Agregado'});
      } else {
        console.log(err);
      }
  });
};
//Actualizar
function AF(req, res){
  const { Empresa_Factura,Cantidad_Factura } = req.body;
  const { Cod_Factura} = req.params;
  console.log(Empresa_Factura,Cantidad_Factura,Cod_Factura)
  console.log('update empleado');
  mysqlConnection.query('update factura set Empresa_Factura = ?, Cantidad_Factura= ? where Cod_Factura = ?', [Empresa_Factura,Cantidad_Factura,Cod_Factura,Empresa_Factura,Cantidad_Factura,Cod_Factura], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'factura Actualizada'});
    } else {
      console.log(err);
    }
  });
};
//Eliminar
function EF(req, res){
  const { Cod_Factura } = req.params;
  console.log('delete Dep');
  mysqlConnection.query('DELETE FROM factura WHERE Cod_Factura = ?', [Cod_Factura], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'factura Eliminada'});
    } else {
      console.log(err);
    }
  });
};
module.exports = {MF,MAF,IF,AF,EF};