const express = require('express');
const mysqlConnection  = require('../BaseDeDatos');
const app = express();express
const jwt = require("jsonwebtoken");
const router = express.Router();
function login(req, res){
    const {User_Name,User_Email,User_password} = req.body;
    console.log(User_Name,User_Email,User_password);
    if(User_Name  && User_Email  && User_password ){
        mysqlConnection.query('Select * from administradores WHERE User_Name = ? && User_Email = ? && User_password = ?',[User_Name,User_Email,User_password],async (err, rows)=>{
            if(rows.length == 0){
                res.send('Acceso denegado');
            }else{
                //res.send('Acceso Dado')
                console.log(rows);
                console.log(User_Name);
                const user = {
                    User_Name: User_Name,
                    User_Email: User_Email,
                    User_password: User_password
                }
                jwt.sign({user}, 'secretkey',(err, token) => {  //{  expiresIn : '30000' }, '1h' asi se pone {user}, 'secretkey',{  expiresIn : '30000' },(err, token)
                    res.json({
                        token 
                    });
                });

            }
        })
    }else{
        res.send('Por Favor revise los datos')
    }
};
/*
router.post('/login', async(req, res) => {
    const {User_Name,User_Email,User_password} = req.body;
    console.log(User_Name,User_Email,User_password);
    if(User_Name  && User_Email  && User_password ){
        mysqlConnection.query('Select * from administradores WHERE User_Name = ? && User_Email = ? && User_password = ?',[User_Name,User_Email,User_password],async (err, rows)=>{
            if(rows.length == 0){
                res.send('Acceso denegado');
            }else{
                //res.send('Acceso Dado')
                console.log(rows);
                console.log(User_Name);
                const user = {
                    User_Name: User_Name,
                    User_Email: User_Email,
                    User_password: User_password
                }
                jwt.sign({user}, 'secretkey',(err, token) => {  //{  expiresIn : '30000' }, '1h'
                    res.json({
                        token 
                    });
                });

            }
        })
    }else{
        res.send('Por Favor revise los datos')
    }
});*/
module.exports = {login};

/*
class login{
     login = async(req,res)=>{
        const {nombre,email} = req.body;
        console.log(nombre,email);
        if(!(nombre && email)){
            return res.status(400).json({message : 'User & Email are requied'});
        }
        return res.json({message : 'Todo Okey'});
    }
    login;
}
module.exports = {login};


/*
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