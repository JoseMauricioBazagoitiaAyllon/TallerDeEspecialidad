const express = require('express');
const router = express.Router();
const jwt = require("jsonwebtoken");
const mysqlConnection  = require('../BaseDeDatos');


function MostrarEmp(req, res){
    console.log('Get all empleados/P1');
    mysqlConnection.query('SELECT * FROM empleados', (err, rows, fields) => {
        if(!err) {
          res.json(rows);
        } else {
          console.log(err);
        }
    });
};
module.exports = {MostrarEmp};