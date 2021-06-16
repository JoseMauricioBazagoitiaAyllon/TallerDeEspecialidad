const mysqlConnection  = require('../BaseDeDatos');
// GET all 

function MFP(req, res){
  console.log('Get all facturas presentadas');
  mysqlConnection.query('SELECT * FROM facturas_presentadas', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  }); 
};

// GET only one
function MAFP(req, res){
  const { Cod_FacturasPresentadas } = req.params; 
  console.log('Get a factura presentada');
  mysqlConnection.query('SELECT * FROM facturas_presentadas WHERE Cod_FacturasPresentadas = ?', [Cod_FacturasPresentadas], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
};
//Insertar
function IFP(req, res){
  console.log('insertar');
  const {Cod_Factura,Mes_Emision,Mes_Descargo,Cod_Empleados} = req.body;
  console.log(Cod_Factura,Mes_Emision,Mes_Descargo,Cod_Empleados);
  mysqlConnection.query('insert into facturas_presentadas(Cod_Factura,Mes_Emision,Mes_Descargo,Cod_Empleados)values(?,?,?,?)', [Cod_Factura,Mes_Emision,Mes_Descargo,Cod_Empleados], (err, rows, fields) => {
      if(!err) {
        res.json({status: 'factura Agregado'});
      } else {
        console.log(err);
      }
  });
};
//Actualizar
function AFP(req, res){
  const { Cod_Factura,Mes_Emision,Mes_Descargo,Cod_Empleados } = req.body;
  const { Cod_FacturasPresentadas} = req.params;
  console.log(Cod_Factura,Mes_Emision,Mes_Descargo,Cod_Empleados,Cod_FacturasPresentadas)
  console.log('update empleado');
  mysqlConnection.query('update facturas_presentadas set Cod_Factura = ?,Mes_Emision = ?,Mes_Descargo = ?,Cod_Empleados = ? where Cod_FacturasPresentadas = ?', [Cod_Factura,Mes_Emision,Mes_Descargo,Cod_Empleados,Cod_FacturasPresentadas], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'factura Actualizada'});
    } else {
      console.log(err);
    }
  });
};
//Eliminar
function EFP(req, res){
  const { Cod_FacturasPresentadas } = req.params;
  console.log('delete Dep');
  mysqlConnection.query('DELETE FROM facturas_presentadas WHERE Cod_FacturasPresentadas = ?', [Cod_FacturasPresentadas], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'factura Eliminada'});
    } else {
      console.log(err);
    }
  });
};
module.exports = {MFP,MAFP,IFP,AFP,EFP};