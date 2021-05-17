const express = require('express');
const router = express.Router();

const mysqlConnection  = require('../BaseDeDatos');

// Vista
router.get('/Descuentos', (req, res) => {
    mysqlConnection.query('SELECT * FROM descuento', (err, rows, fields) => {
      if(!err) {
        res.json(rows);
      } else {
        console.log(err);
      }
    });  
  });
  // Ver uno
router.get('/Descuentos/:Cod_Descuento', (req, res) => {
  const { Cod_Descuento } = req.params; 
  mysqlConnection.query('SELECT * FROM descuento WHERE Cod_Descuento = ?', [Cod_Descuento], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
});
//Insertar
router.post('/Descuentos', (req, res) => {
  const {Cod_Descuento,Nombre_Des,Porcentaje_Des} = req.body;
  console.log(Cod_Descuento,Nombre_Des,Porcentaje_Des);
  const query = 'CALL DescuentoAgregarOActualizar(?,?,?);'
    ;
  mysqlConnection.query(query, [Cod_Descuento,Nombre_Des,Porcentaje_Des], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Descuento Agregado'});
    } else {
      console.log(err);
    }
  });
});
//Actualizar
router.put('/Descuentos/:Cod_Descuento', (req, res) => {
  const { Cod_Descuento } = req.params;
  const { Nombre_Des, Porcentaje_Des} = req.body;
  console.log(Nombre_Des,Cod_Descuento,Porcentaje_Des)
  const query = 'CALL DescuentoAgregarOActualizar(?,?,?);';
  mysqlConnection.query(query, [Cod_Descuento,Nombre_Des,Porcentaje_Des], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Descuento Actualizado'});
    } else {
      console.log(err);
    }
  });
});

  //Eliminar
router.delete('/Descuentos/:Cod_Descuento', (req, res) => {
  const { Cod_Descuento } = req.params;
  mysqlConnection.query('DELETE FROM descuento WHERE Cod_Descuento = ?', [Cod_Descuento], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Descuento Eliminado'});
    } else {
      console.log(err);
    }
  });
});



module.exports = router;