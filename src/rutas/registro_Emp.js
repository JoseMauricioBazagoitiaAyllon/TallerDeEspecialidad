const mysqlConnection  = require('../BaseDeDatos');
// GET all 

function MREmp(req, res){
  console.log('Get all descuento');
  mysqlConnection.query('SELECT * FROM registros_emp', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  }); 
};

// GET only one
function MAREmp(req, res){
  const { cod_Registros_Emp } = req.params; 
  console.log('Get a descuento');
  mysqlConnection.query('SELECT * FROM registros_emp WHERE cod_Registros_Emp = ?', [cod_Registros_Emp], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
};
//Insertar
function IREmp(req, res){
  const {Cod_Emp,Horas_Extras,Dias_P
    ,Dias_A,Dias_F,Dias_Totales,Mes_vigente,Años_Antiguedad} = req.body;
  console.log(Cod_Emp,Horas_Extras,Dias_P
    ,Dias_A,Dias_F,Dias_Totales,Mes_vigente,Años_Antiguedad);
  mysqlConnection.query('insert into registros_emp(Cod_Emp,Horas_Extras,Dias_P,Dias_A,Dias_F,Dias_Totales,Mes_vigente,Años_Antiguedad)values(?,?,?,?,?,?,?,?)' ,
        [Cod_Emp,Horas_Extras,Dias_P
            ,Dias_A,Dias_F,Dias_Totales,Mes_vigente,Años_Antiguedad], (err, rows, fields) => {
       if(!err) {
         res.json({status: 'Registro Empleado Agregado'});
       } else {
         console.log(err);
       }
  });
};
//Actualizar
function AREmp(req, res){
  const { cod_Registros_Emp } = req.params;
  const { Cod_Emp,Horas_Extras,Dias_P
    ,Dias_A,Dias_F,Dias_Totales,Mes_vigente,Años_Antiguedad} = req.body;
  console.log(cod_Registros_Emp,Cod_Emp,Horas_Extras,Dias_P
    ,Dias_A,Dias_F,Dias_Totales,Mes_vigente,Años_Antiguedad)
  console.log('update registro empleado');
  mysqlConnection.query('update registros_emp set Cod_Emp = ?, Horas_Extras = ?,Dias_P = ?,Dias_A = ?,Dias_F = ?,Dias_Totales = ?, Mes_vigente = ?, Años_Antiguedad = ?  where cod_Registros_Emp = ?',
       [Cod_Emp,Horas_Extras,Dias_P
        ,Dias_A,Dias_F,Dias_Totales,Mes_vigente,Años_Antiguedad,cod_Registros_Emp], (err, rows, fields) => {
        if(!err) {
          res.json({status: 'Registro Empleado Actualizado'});
        } else {
          console.log(err);
        }
      });
};
//Eliminar
function EREmp(req, res){
  const { cod_Registros_Emp } = req.params;
  console.log('delete Dep');
  mysqlConnection.query('DELETE FROM registros_emp WHERE cod_Registros_Emp = ?', [cod_Registros_Emp], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Registros Empleado Eliminado'});
    } else {
      console.log(err);
    }
  });
};
module.exports = {MREmp,MAREmp,IREmp,AREmp,EREmp};
