const mysqlConnection  = require('../BaseDeDatos');
// GET all 

function MEmp(req, res){
  console.log('Get all descuento');
  mysqlConnection.query('SELECT * FROM empleados', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  }); 
};

// GET only one
function MAEmp(req, res){
  const { Cod_Emp } = req.params; 
  console.log('Get a descuento');
  mysqlConnection.query('SELECT * FROM empleados WHERE Cod_Emp = ?', [Cod_Emp], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
};
//Insertar
function IEmp(req, res){
  const {Nombre_Emp,Celular,Direccion,Horas_Extras,Dias_P,Dias_A,Dias_F,Dias_totales,Años_Antiguedad
    ,Cod_Dep,Cod_Rol,Cod_Sueldo} = req.body;
  console.log(Nombre_Emp,Celular,Direccion,Horas_Extras,Dias_P,Dias_A,Dias_F,Dias_totales,Años_Antiguedad
        ,Cod_Dep,Cod_Rol,Cod_Sueldo);
  mysqlConnection.query('insert into empleados(Nombre_Emp,Celular,Direccion,Horas_Extras,Dias_P,Dias_A,Dias_F,Dias_totales,Años_Antiguedad,Cod_Dep,Cod_Rol,Cod_Sueldo)values(?,?,?,?,?,?,?,?,?,?,?,?)' ,
        [Nombre_Emp,Celular,Direccion,Horas_Extras,Dias_P,Dias_A,Dias_F,Dias_totales,Años_Antiguedad
       ,Cod_Dep,Cod_Rol,Cod_Sueldo], (err, rows, fields) => {
       if(!err) {
         res.json({status: 'Empleado Agregado'});
       } else {
         console.log(err);
       }
  });
};
//Actualizar
function AEmp(req, res){
  const { Cod_Emp } = req.params;
  const { Nombre_Emp,Celular,Direccion,Horas_Extras,Dias_P,Dias_A,Dias_F,Dias_totales,Años_Antiguedad
    ,Cod_Dep,Cod_Rol,Cod_Sueldo} = req.body;
  console.log(Nombre_Emp,Nombre_Emp,Celular,Direccion,Horas_Extras,Dias_P,Dias_A,Dias_F,Dias_totales,Años_Antiguedad
    ,Cod_Dep,Cod_Rol,Cod_Sueldo)
  console.log('update empleado');
  mysqlConnection.query('update empleados set Nombre_Emp = ?, Celular = ?,Direccion = ?,Horas_Extras = ?,Dias_P = ?,Dias_A = ?,Dias_F = ?,Dias_totales = ?,Años_Antiguedad = ?,Cod_Dep = ?,Cod_Rol = ?,Cod_Sueldo = ? where Cod_Emp = ?',
       [Nombre_Emp,Celular,Direccion,Horas_Extras,Dias_P,Dias_A,Dias_F,Dias_totales,Años_Antiguedad,Cod_Dep,Cod_Rol,Cod_Sueldo,Cod_Emp], (err, rows, fields) => {
        if(!err) {
          res.json({status: 'Empleado Actualizado'});
        } else {
          console.log(err);
        }
      });
};
//Eliminar
function EEmp(req, res){
  const { Cod_Emp } = req.params;
  console.log('delete Dep');
  mysqlConnection.query('DELETE FROM empleados WHERE Cod_Emp = ?', [Cod_Emp], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Empleado Eliminado'});
    } else {
      console.log(err);
    }
  });
};
module.exports = {MEmp,MAEmp,IEmp,AEmp,EEmp};


/*
  //Eliminar
router.delete('/Empleados/:Cod_Emp',verifyToken, (req, res) => {
  
  jwt.verify(req.token, 'secretkey', (error, authData) => {
    if(error){
        res.json({
            mensaje: "Acceso denegado"
        });
    }else{
      
    }
  });
  
});



module.exports = router;*/