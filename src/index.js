const express = require('express');
const app = express();
const jwt = require("jsonwebtoken");
const api = express.Router();
const a = require("./Autenticacion/AuthFun");
const P1 = require("./rutas/P1");
const Dep = require("./rutas/Departamentos");
const Des = require("./rutas/Descuentos");
const Emp = require("./rutas/Empleados");
const I = require("./rutas/Impuestos");
const R = require("./rutas/Roles");
const SPD = require("./rutas/sueldo_paga_descuento");
const SPI = require("./rutas/sueldo_paga_impuesto");
const S = require("./rutas/Sueldos");
const V = require("./rutas/Vistas");
//P1.MostrarEmp();

//setting
app.set('port', process.env.PORT || 3000);
//middleware
app.use(express.json());
//doutes
//P1
//Get
app.get('/P1',a.verifyToken,P1.MostrarEmp);
app.get('/Departamento',a.verifyToken,Dep.MDep);
app.get('/Descuentos',a.verifyToken,Des.MDes);
app.get('/Empleados',a.verifyToken,Emp.MEmp);
app.get('/Impuestos',a.verifyToken,I.MI);
app.get('/Roles',a.verifyToken,R.MR);
app.get('/Sueldos',a.verifyToken,S.MS);
//Muchos A Mucho Tablas
app.get('/SPD',a.verifyToken,SPD.MSPD);
app.get('/SPI',a.verifyToken,SPI.MSPI);
//Vistas 
app.get('/Vista_BD_Completa',a.verifyToken,V.MVC);
app.get('/Actividad_De_Empleado',a.verifyToken,V.MAE);
app.get('/Descuentos_Que_Pagan',a.verifyToken,V.MDP);
app.get('/Impuestos_Que_Pagan',a.verifyToken,V.MIP);
app.get('/Total_Sueldo_Dias',a.verifyToken,V.MTSD);
app.get('/Total_Sueldo_Dias_Informe',a.verifyToken,V.MTSDI);
app.get('/Total_Sueldo_informe',a.verifyToken,V.MTSI);
app.get('/beneficios_Informe',a.verifyToken,V.MBI);
//---------------------------------------------------------------------
//Get Individual
app.get('/Departamento/:Cod_Dep',a.verifyToken,Dep.MADep);
app.get('/Descuentos/:Cod_Descuento',a.verifyToken,Des.MADes);
app.get('/Empleados/:Cod_Emp',a.verifyToken,Emp.MAEmp);
app.get('/Impuestos/:Cod_Imp',a.verifyToken,I.MAI);
app.get('/Roles/:Cod_Rol',a.verifyToken,R.MAR);
app.get('/Sueldos/:Cod_Sueldo',a.verifyToken,S.MAS);
//Vistas
app.get('/Vista_BD_Completa/:Cod_Emp',a.verifyToken,V.MAVC);
app.get('/Actividad_De_Empleado/:Cod_Emp',a.verifyToken,V.MAAE);
app.get('/Descuentos_Que_Pagan/:Cod_Emp',a.verifyToken,V.MADP);
app.get('/Impuestos_Que_Pagan/:Cod_Emp',a.verifyToken,V.MAIP);
app.get('/Total_Sueldo_Dias/:Cod_Emp',a.verifyToken,V.MATSD);
app.get('/Total_Sueldo_Dias_Informe/:Cod_Emp',a.verifyToken,V.MATSDI);
app.get('/Total_Sueldo_informe/:Cod_Emp',a.verifyToken,V.MATSI);
app.get('/beneficios_Informe/:Cod_Emp',a.verifyToken,V.MABI);
//---------------------------------------------------------------------
//Post
app.post('/Departamento',a.verifyToken,Dep.IDep);
app.post('/Descuentos',a.verifyToken,Des.IDes);
app.post('/Empleados',a.verifyToken,Emp.IEmp);
app.post('/Impuestos',a.verifyToken,I.II);
app.post('/Roles',a.verifyToken,R.IR);
app.post('/Sueldos',a.verifyToken,S.IS);
//---------------------------------------------------------------------
//Put
app.put('/Departamento/:Cod_Dep',a.verifyToken,Dep.ADep);
app.put('/Descuentos/:Cod_Descuento',a.verifyToken,Des.ADes);
app.put('/Empleados/:Cod_Emp',a.verifyToken,Emp.AEmp);
app.put('/Impuestos/:Cod_Imp',a.verifyToken,I.AI);
app.put('/Roles/:Cod_Rol',a.verifyToken,R.AR);
app.put('/Sueldos/:Cod_Sueldo',a.verifyToken,S.AS);
//---------------------------------------------------------------------
//delete
app.delete('/Departamento/:id',a.verifyToken,Dep.EDep);
app.delete('/Descuentos/:Cod_Descuento',a.verifyToken,Des.EDes);
app.delete('/Empleados/:Cod_Emp',a.verifyToken,Emp.EEmp);
app.delete('/Impuestos/:Cod_Imp',a.verifyToken,I.EI);
app.delete('/Roles/:Cod_Rol',a.verifyToken,R.ER);
app.delete('/Sueldos/:Cod_Sueldo',a.verifyToken,S.ES);
//----------------------------------------------------------------------
//Empezando el servidor
app.listen(app.get('port'), () => {
    console.log(`Server on port ${app.get('port')}`);
  });