const express = require('express');
const router = express.Router();

const mysqlConnection  = require('../BaseDeDatos');

// Vista
router.get('/Impuestos', (req, res) => {
    mysqlConnection.query('SELECT * FROM impuesto', (err, rows, fields) => {
      if(!err) {
        res.json(rows);
      } else {
        console.log(err);
      }
    });  
  });
  // Ver uno
router.get('/Impuestos/:Cod_Imp', (req, res) => {
  const { Cod_Imp } = req.params; 
  mysqlConnection.query('SELECT * FROM impuesto WHERE Cod_Imp = ?', [Cod_Imp], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
});
//Insertar
router.post('/Impuestos', (req, res) => {
  const {Cod_Imp,Nombre_Imp,Porcentaje_Imp} = req.body;
  console.log(Cod_Imp,Nombre_Imp,Porcentaje_Imp);
  const query = 'CALL ImpuestoAgregarOActualizar(?,?,?);'
    ;
  mysqlConnection.query(query, [Cod_Imp,Nombre_Imp,Porcentaje_Imp], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Impuesto Agregado'});
    } else {
      console.log(err);
    }
  });
});
//Actualizar
router.put('/Impuestos/:Cod_Imp', (req, res) => {
  const { Cod_Imp } = req.params;
  const { Nombre_Imp, Porcentaje_Imp} = req.body;
  console.log(Nombre_Imp,Cod_Imp,)
  const query = 'CALL ImpuestoAgregarOActualizar(?,?,?);';
  mysqlConnection.query(query, [Cod_Imp,Nombre_Imp,Porcentaje_Imp], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Impuesto Actualizado'});
    } else {
      console.log(err);
    }
  });
});

  //Eliminar

// DELETE An Employee
router.delete('/Impuestos/:Cod_Imp', (req, res) => {
  const { Cod_Imp } = req.params;
  mysqlConnection.query('DELETE FROM impuesto WHERE Cod_Imp = ?', [Cod_Imp], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'departamento Eliminado'});
    } else {
      console.log(err);
    }
  });
});



module.exports = router;