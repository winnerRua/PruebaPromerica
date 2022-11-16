window.addEventListener('load', iniciarJuego)

function envia(pag){
    document.form.action = '../php/'+pag+'.php';
        document.form.submit();
}
 
function valida(){
    var usuario = document.getElementById('usuario');
    var pass = document.getElementById("contraseña");
            
    if((usuario.value == "")||(pass.value == "")){
        window.alert("Los campos Usuario y Contraseña no pueden estar vacíos.");
    }else{
        envia('login');
    }
}