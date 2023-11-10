window.addEventListener("DOMContentLoaded", main);

function main(){
    console.log("script_usuarios.js");

    if(usuarioLogeado["nombre"]){
        const xhr = new XMLHttpRequest();
        let datos = new FormData();
        datos.append("nombre", usuarioLogeado["nombre"]);
        datos.append("password", usuarioLogeado["password"]);
    
        xhr.addEventListener("load", llamadaLoginComprobarUsuarioAdmin);
    
        xhr.open("POST", URL_LOGIN);
        xhr.send(datos);
    } else {
        // redirigir al inicio
        location.replace('/web/html/inicio.html');
    }

}


// llamada AJAX para el login
// la llamada devuelve true si el login es correcto
// false si no existe el usuario
function llamadaLoginComprobarUsuarioAdmin(e){
    if (e.target.status == 200) {
        resultado = JSON.parse(e.target.responseText);
        console.log(resultado);

        if(resultado["esAdmin"]){
            console.log(resultado["esAdmin"]);

            // cargar lista usuarios
            // ...

        } else {
            // no es admin
            location.replace('/web/html/inicio.html');
        }

    }
}


