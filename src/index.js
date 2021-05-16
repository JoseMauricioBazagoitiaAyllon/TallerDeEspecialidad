const express = require('express');
const app = express();

//setting
app.set('port', process.env.PORT || 3000);
//middleware
app.use(express.json());
//doutes
app.use(require('./rutas/Empleados'));
//Empezando el servidor
app.listen(app.get('port'), () => {
    console.log(`Server on port ${app.get('port')}`);
  });