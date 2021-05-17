const express = require('express');
const app = express();

//setting
app.set('port', process.env.PORT || 3000);
//middleware
app.use(express.json());
//doutes
app.use(require('./rutas/Departamentos'));
app.use(require('./rutas/Roles'));
app.use(require('./rutas/Impuestos'));
app.use(require('./rutas/Descuentos'));
app.use(require('./rutas/Empleados'));
app.use(require('./rutas/Sueldos'));
//Empezando el servidor
app.listen(app.get('port'), () => {
    console.log(`Server on port ${app.get('port')}`);
  });