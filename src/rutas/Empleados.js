const express = require('express');
const router = express.Router();

const mysqlConnection  = require('../BaseDeDatos');

// Vista
router.get('/Empleados', (req, res) => {
    mysqlConnection.query('SELECT * FROM empleados', (err, rows, fields) => {
      if(!err) {
        res.json(rows);
      } else {
        console.log(err);
      }
    });  
  });
  // Ver uno
router.get('/Empleados/:Cod_Emp', (req, res) => {
  const { Cod_Emp } = req.params; 
  mysqlConnection.query('SELECT * FROM empleados WHERE Cod_Emp = ?', [Cod_Emp], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
});
//Insertar
router.post('/Empleados', (req, res) => {
  const {Cod_Emp,Nombre_Emp,Celular,Direccion,Horas_Extras,Dias_P,Dias_A,Dias_F,Dias_totales,Anhos_Antiguedad
,Cod_Dep,Cod_Rol,Cod_Sueldo} = req.body;
  console.log(Cod_Emp,Nombre_Emp,Celular,Direccion,Horas_Extras,Dias_P,Dias_A,Dias_F,Dias_totales,Anhos_Antiguedad
    ,Cod_Dep,Cod_Rol,Cod_Sueldo);
  const query = 'CALL EmpleadoAgregarOActualizar(?,?,?,?,?,?,?,?,?,?,?,?,?);'
    ;
  mysqlConnection.query(query, [Cod_Emp,Nombre_Emp,Celular,Direccion,Horas_Extras,Dias_P,Dias_A,Dias_F,Dias_totales,Anhos_Antiguedad
    ,Cod_Dep,Cod_Rol,Cod_Sueldo], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Empleado Agregado'});
    } else {
      console.log(err);
    }
  });
});
//Actualizar
router.put('/Empleados/:Cod_Emp', (req, res) => {
  const { Cod_Emp } = req.params;
  const { Nombre_Emp,Celular,Direccion,Horas_Extras,Dias_P,Dias_A,Dias_F,Dias_totales,Anhos_Antiguedad
    ,Cod_Dep,Cod_Rol,Cod_Sueldo} = req.body;
  console.log(Nombre_Emp,Nombre_Emp,Celular,Direccion,Horas_Extras,Dias_P,Dias_A,Dias_F,Dias_totales,Anhos_Antiguedad
    ,Cod_Dep,Cod_Rol,Cod_Sueldo)
  const query = 'CALL EmpleadoAgregarOActualizar(?,?,?,?,?,?,?,?,?,?,?,?,?);';
  mysqlConnection.query(query, [Cod_Emp,Nombre_Emp,Celular,Direccion,Horas_Extras,Dias_P,Dias_A,Dias_F,Dias_totales,Anhos_Antiguedad
    ,Cod_Dep,Cod_Rol,Cod_Sueldo], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Empleado Actualizado'});
    } else {
      console.log(err);
    }
  });
});

  //Eliminar
router.delete('/Empleados/:Cod_Emp', (req, res) => {
  const { Cod_Emp } = req.params;
  mysqlConnection.query('DELETE FROM empleados WHERE Cod_Emp = ?', [Cod_Emp], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Empleado Eliminado'});
    } else {
      console.log(err);
    }
  });
});



module.exports = router;