const express = require('express');
const app = express();
const jwt = require("jsonwebtoken");
const router = express.Router();
router.post('/login', (req, res) => {
    const {nombre,email} = req.body;
    console.log(nombre,email);
    const user = {
        nombre : "Mauricio",
        email: "Bazagoitia.ayllon.josemauricio@gmail.com"
    }
    console.log({nombre, email});
    console.log(user.nombre);
    if(nombre == user.nombre && email == user.email){
        jwt.sign({user}, 'secretkey', (err, token) => {
            res.json({
                token
            });
        });
    }else{
        res.json({status: 'User invalido'});
    }    
});
/*router.post("/api/posts", verifyToken, (req , res) => {

    jwt.verify(req.token, 'secretkey', (error, authData) => {
        if(error){
            res.json({
                mensaje: "Acceso denegado"
            });
        }else{
            res.json({
                    mensaje: "Post fue creado",
                    authData
                });
        }
    });
});*/
module.exports = router;
