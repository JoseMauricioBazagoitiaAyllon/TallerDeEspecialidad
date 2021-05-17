const express = require('express');
const router = express.Router();

const mysqlConnection  = require('../BaseDeDatos');

// Vista
router.get('/Sueldos', (req, res) => {
    mysqlConnection.query('SELECT * FROM sueldo', (err, rows, fields) => {
      if(!err) {
        res.json(rows);
      } else {
        console.log(err);
      }
    });  
  });
  // Ver uno
router.get('/Sueldos/:Cod_Sueldo', (req, res) => {
  const { Cod_Sueldo } = req.params; 
  mysqlConnection.query('SELECT * FROM sueldo WHERE Cod_Sueldo = ?', [Cod_Sueldo], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
});
//Insertar
router.post('/Sueldos', (req, res) => {
  const {Cod_Sueldo,Cant_Sueldo_Dia, Cant_Sueldo_horas_extras} = req.body;
  console.log(Cod_Sueldo,Cant_Sueldo_Dia, Cant_Sueldo_horas_extras);
  const query = 'CALL SueldoAgregarOActualizar(?,?,?);'
    ;
  mysqlConnection.query(query, [Cod_Sueldo,Cant_Sueldo_Dia, Cant_Sueldo_horas_extras], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Sueldo Agregado'});
    } else {
      console.log(err);
    }
  });
});
//Actualizar
router.put('/Sueldos/:Cod_Sueldo', (req, res) => {
  const { Cod_Sueldo } = req.params;
  const { Cant_Sueldo_Dia, Cant_Sueldo_horas_extras} = req.body;
  console.log(Cod_Sueldo,Cant_Sueldo_Dia, Cant_Sueldo_horas_extras)
  const query = 'CALL SueldoAgregarOActualizar(?,?,?);';
  mysqlConnection.query(query, [Cod_Sueldo,Cant_Sueldo_Dia, Cant_Sueldo_horas_extras], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Sueldo Actualizado'});
    } else {
      console.log(err);
    }
  });
});

  //Eliminar

// DELETE An Employee
router.delete('/Sueldos/:Cod_Sueldo', (req, res) => {
  const { Cod_Sueldo } = req.params;
  mysqlConnection.query('DELETE FROM sueldo WHERE Cod_Sueldo = ?', [Cod_Sueldo], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Sueldo Eliminado'});
    } else {
      console.log(err);
    }
  });
});



module.exports = router;