const express = require('express');
const router = express.Router();

const mysqlConnection  = require('../BaseDeDatos');

// GET all Employees
router.get('/Departamento', (req, res) => {
    mysqlConnection.query('SELECT * FROM departamento', (err, rows, fields) => {
      if(!err) {
        res.json(rows);
      } else {
        console.log(err);
      }
    });  
  });
  // GET An Employee
router.get('/Departamento/:id', (req, res) => {
  const { id } = req.params; 
  mysqlConnection.query('SELECT * FROM departamento WHERE Cod_Dep = ?', [id], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
});
//Insertar
router.post('/Departamento', (req, res) => {
  const {Cod_Dep,Nombre_Dep} = req.body;
  console.log(Cod_Dep,Nombre_Dep);
  const query = 'CALL EmpleadoAgregarOEditar(?,?);'
    ;
  mysqlConnection.query(query, [Cod_Dep,Nombre_Dep], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Departamento Agregado'});
    } else {
      console.log(err);
    }
  });
});
//Actualizar
router.put('/departamento/:id', (req, res) => {
  const { Nombre_Dep } = req.body;
  const { Cod_Dep } = req.params;
  console.log(Nombre_Dep,Cod_Dep)
  const query = 'CALL EmpleadoAgregarOEditar(?,?);';
  mysqlConnection.query(query, [Cod_Dep,Nombre_Dep], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'departamento Actualizado'});
    } else {
      console.log(err);
    }
  });
});

  //Eliminar

// DELETE An Employee
router.delete('/departamento/:id', (req, res) => {
  const { id } = req.params;
  mysqlConnection.query('DELETE FROM departamento WHERE Cod_Dep = ?', [id], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Empleado Eliminado'});
    } else {
      console.log(err);
    }
  });
});



module.exports = router;