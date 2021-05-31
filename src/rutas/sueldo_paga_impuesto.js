const mysqlConnection  = require('../BaseDeDatos');
// GET all 

function MSPI(req, res){
  console.log('Get all descuento');
  mysqlConnection.query('SELECT * FROM sueldo_paga_impuesto', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });   
};
module.exports = {MSPI};
/*
//Ver un Sueldo
router.get('/SPI/:Cod_Sueldo',verifyToken, (req, res) => {
  const { Cod_Sueldo } = req.params; 
  jwt.verify(req.token, 'secretkey', (error, authData) => {
    if(error){
        res.json({
            mensaje: "Acceso denegado"
        });
    }else{
      mysqlConnection.query('SELECT * FROM sueldo_paga_impuesto WHERE Cod_Sueldo = ?', [Cod_Sueldo], (err, rows, fields) => {
        if (!err) {
          res.json(rows[0]);
        } else {
          console.log(err);
        }
      });
    }
  });
  
});
//Insertar Rol
router.post('/SPI',verifyToken, (req, res) => {
  const {Cod_Sueldo,Cod_Descuentos} = req.body;
  console.log(Cod_Sueldo,Cod_Descuentos);
  /*if(Cod_Rol == null){
    res.json({status: 'falto id:0'});
    return;
  }
  const query = 'CALL RolAgregarOActualizar(?,?);';
  jwt.verify(req.token, 'secretkey', (error, authData) => {
    if(error){
        res.json({
            mensaje: "Acceso denegado"
        });
    }else{
      mysqlConnection.query('insert into sueldo_paga_impuesto(Cod_Sueldo,Cod_Descuentos)values(?,?)', [Cod_Sueldo,Cod_Descuentos], (err, rows, fields) => {
        if(!err) {
          res.json({status: 'SPI Agregado'});
        } else {
            
          console.log();
          res.json({status: "Si quieres Insertar no olvides poner 'Cod_Rol = 0'"});
          console.log(err);
        }
      });
    }
  });
  
});
//Actualizar
router.put('/SPI/:Cod_Sueldo',verifyToken, (req, res) => {
  const { Cod_Descuentos } = req.body;
  const { Cod_Sueldo } = req.params;
  console.log(req.params);
  console.log(Cod_Sueldo,Cod_Descuentos)
  //const query = 'CALL RolAgregarOActualizar(?,?);';
  jwt.verify(req.token, 'secretkey', (error, authData) => {
    if(error){
        res.json({
            mensaje: "Acceso denegado"
        });
    }else{
      mysqlConnection.query('update sueldo_paga_impuesto set Cod_Sueldo = ? Cod_Descuentos =? where Cod_Sueldo = ?', [Cod_Sueldo,Cod_Descuentos,Cod_Sueldo], (err, rows, fields) => {
        if(!err) {
          res.json({status: 'sueldo_paga_impuesto Actualizado'});
        } else {
          console.log(err);
        }
      });
    }
  });
  
});

  //Eliminar
router.delete('/SPI/:Cod_Sueldo',verifyToken, (req, res) => {
  const { Cod_Sueldo } = req.params;
  jwt.verify(req.token, 'secretkey', (error, authData) => {
    if(error){
        res.json({
            mensaje: "Acceso denegado"
        });
    }else{
      mysqlConnection.query('DELETE FROM sueldo_paga_impuesto WHERE Cod_Sueldo = ?', [Cod_Sueldo], (err, rows, fields) => {
        if(!err) {
          res.json({status: 'sueldo_paga_impuesto Eliminado'});
        } else {
          console.log(err);
        }
      });
    }
  });
  
});



module.exports = router;*/