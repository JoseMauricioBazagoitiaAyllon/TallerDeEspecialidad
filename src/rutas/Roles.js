const express = require('express');
const router = express.Router();

const mysqlConnection  = require('../BaseDeDatos');

// Ver todos los roles
router.get('/Roles', (req, res) => {
    mysqlConnection.query('SELECT * FROM rol', (err, rows, fields) => {
      if(!err) {
        res.json(rows);
      } else {
        console.log(err);
      }
    });  
  });

  //Ver un ROl
router.get('/Roles/:Cod_Rol', (req, res) => {
  const { Cod_Rol } = req.params; 
  mysqlConnection.query('SELECT * FROM rol WHERE Cod_Rol = ?', [Cod_Rol], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
});
//Insertar Rol
router.post('/Roles', (req, res) => {
  const {Cod_Rol,Nombre_Rol} = req.body;
  console.log(Cod_Rol,Nombre_Rol);
  const query = 'CALL RolAgregarOActualizar(?,?);'
    ;
  mysqlConnection.query(query, [Cod_Rol,Nombre_Rol], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Rol Agregado'});
    } else {
        
      console.log();
      res.json({status: "Si quieres Insertar no olvides poner 'Cod_Rol = 0'"});
      console.log(err);
    }
  });
});
//Actualizar
router.put('/Roles/:Cod_Rol', (req, res) => {
  const { Nombre_Rol } = req.body;
  const { Cod_Rol } = req.params;
  console.log(req.params);
  console.log(Nombre_Rol,Cod_Rol)
  const query = 'CALL RolAgregarOActualizar(?,?);';
  mysqlConnection.query(query, [Cod_Rol,Nombre_Rol], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Rol Actualizado'});
    } else {
      console.log(err);
    }
  });
});

  //Eliminar
router.delete('/Roles/:Cod_Rol', (req, res) => {
  const { Cod_Rol } = req.params;
  mysqlConnection.query('DELETE FROM rol WHERE Cod_Rol = ?', [Cod_Rol], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Empleado Eliminado'});
    } else {
      console.log(err);
    }
  });
});



module.exports = router;