const express = require('express');
const mysqlConnection  = require('../BaseDeDatos');
const app = express();
const jwt = require("jsonwebtoken");
const router = express.Router();
/*
function login(req, res){
    console.log('insertar');
    const {nombre,email} = req.body;
    console.log(nombre,email,res);




    login=async({nombre,email })=>{
        const query = 'Select * from administradores where User_Name =?, User_Email = ?';
     
        let res = await client.query(query, [nombre,email]);
        console.log(nombre,email);

        return new Promise(async(resolve, reject)=>{
            if(res.rows===undefined) reject(null);

            const isUser = res.rows.length > 0 ? true : false;

            if(isUser){
                const {id_autenticacion, usuario} = res.rows[0];



*/
    /*
    async function f(nombre,email) {
        mysqlConnection.query('Select * from administradores where User_Name =?, User_Email = ?',[nombre,email],(err, rows, fields) =>{
            if(rows.lenght == 0){
                let promise = new Promise((resolve, reject) => {
                    setTimeout(() => resolve(false), 1000)
                  });
                
                  let result = await promise; // espera hasta que la promesa se resuelva (*)
                
                  console.log(result); // "¡Hecho!"
            }else{
                let promise = new Promise((resolve, reject) => {
                    setTimeout(() => resolve(true), 1000)
                  });
                
                  let result = await promise; // espera hasta que la promesa se resuelva (*)
                
                  console.log(result); // "¡Hecho!"
            }
        }
        );
        
    }
    let c = f(nombre,email);
    if(c){
        console.log("b");
    }else{
        console.log("a");
    }
    //res.json();
}*/
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
        jwt.sign({user}, 'secretkey',{ expiresIn: '1h' },(err, token) => {
            res.json({
                token
            });
        });
    }else{
        res.json({status: 'User invalido'});
    }    
});
router.post("/api/posts", verifyToken, (req , res) => {

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
});
function verifyToken(req, res, next){
    const bearerHeader =  req.headers['authorization'];
  
    if(typeof bearerHeader !== 'undefined'){
         const bearerToken = bearerHeader;
         req.token  = bearerToken;
         next();
    }else{
        res.sendStatus(403);
    }
  }
module.exports = router;
