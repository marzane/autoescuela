window.addEventListener("DOMContentLoaded", main);

const URL_REGISTRAR = "https://marta.laprimeracloud01.com/prueba/registrar.php";

const ID_CONTENEDOR_USUARIOS = "contenedorUsuarios";
const ID_BOTON_ENVIAR = "botonEnviar";
const ID_INPUT_USUARIO_NOMBRE = "inputNombreUsuario";
const ID_INPUT_USUARIO_PASSWORD = "inputPasswordUsuario";
const ID_MENSAJE_ACCION = "mensajeAccion";

// clases css
const CLASE_BOTON_BASE = "boton";
const CLASE_BOTON_PELIGRO = "boton-peligro";
const CLASE_BOTON_NORMAL = "boton-normal";
const MENSAJE_EXITO = "mensaje-exito";
const MENSAJE_ERROR = "mensaje-error";

// mensajes
const MENSAJE_USUARIO_REGISTRADO_EXITO = "Usuario registrado correctamente";
const MENSAJE_USUARIO_REGISTRADO_ERROR_NOMBRE = "El nombre de usuario ya existe";
const MENSAJE_USUARIO_REGISTRADO_ERROR = "Error: no se ha podido registrar";


function main() {
    console.log("script_registrar.js");
    let botonEnviar = document.getElementById(ID_BOTON_ENVIAR);
    if (botonEnviar) {
        botonEnviar.addEventListener("click", enviarDatosFormListener);
        setInterval(habilitarBotonEnviarLlamada, 500);
    }

}



function habilitarBotonEnviarLlamada() {
    let botonEnviar = document.getElementById(ID_BOTON_ENVIAR);
    if (botonEnviar) {
        // ...

        let nombreUsuario = document.getElementById(ID_INPUT_USUARIO_NOMBRE)?.value;
        let passwordUsuario = document.getElementById(ID_INPUT_USUARIO_PASSWORD)?.value;

        if (nombreUsuario && passwordUsuario && nombreUsuario != "" && passwordUsuario != "") {
            botonEnviar.disabled = false;
        } else {
            botonEnviar.disabled = true;
        }
    }
}


function enviarDatosFormListener() {

    console.log("enviar");
    let nombreUsuario = document.getElementById(ID_INPUT_USUARIO_NOMBRE)?.value;
    let passwordUsuario = document.getElementById(ID_INPUT_USUARIO_PASSWORD)?.value;

    if(nombreUsuario && passwordUsuario){
        const xhr = new XMLHttpRequest();
        let datos = new FormData();
        datos.append("nombre", nombreUsuario);
        datos.append("password", passwordUsuario);
    
        xhr.addEventListener("load", llamadaRegistroUsuario);
    
        xhr.open("POST", URL_REGISTRAR);
        xhr.send(datos);
        
    } else {
        console.log("algo pasa")
    }

}


function llamadaRegistroUsuario(e) {
    if (e.target.status == 200) {
        resultado = JSON.parse(e.target.responseText);
        console.log(resultado);

        let contenedorMensaje = document.getElementById(ID_MENSAJE_ACCION);
        if (contenedorMensaje) {
            let mensaje = "";
            let claseCss = "";
            switch (resultado) {
                case 0: // exito
                    console.log("usuario registrado correctamente");
                    mensaje = MENSAJE_USUARIO_REGISTRADO_EXITO;
                    claseCss = MENSAJE_EXITO;

                    break;
                case -1: // error: ya existe un usuario con ese nombre
                    console.log("error: ya existe un usuario con ese nombre");
                    mensaje = MENSAJE_USUARIO_REGISTRADO_ERROR_NOMBRE;
                    claseCss = MENSAJE_ERROR;

                    break;
                case -2: // otro error
                    console.log("error");
                    mensaje = MENSAJE_USUARIO_REGISTRADO_ERROR;
                    claseCss = MENSAJE_ERROR;

            }

            contenedorMensaje.classList.add(claseCss);
            contenedorMensaje.innerHTML = `<p>${mensaje}</p>`;
        }

    }
}