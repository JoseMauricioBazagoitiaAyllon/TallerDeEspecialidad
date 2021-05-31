const jwt = require("jsonwebtoken");

// Authorization: Bearer <token>
function verifyToken(req, res, next){
    const bearerHeader =  req.headers['authorization'];
    if(!bearerHeader) res.send('access denied');
    jwt.verify(bearerHeader, 'secretkey', (error, authData)=>{
        if(error){
            res.json({
                mensaje: "Acceso denegado"
            });
        }else{
            next();
        }
    });
}
module.exports = {verifyToken};