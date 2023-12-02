window.addEventListener("DOMContentLoaded", main);

const URL_PHP = "/php/";
const URL_REGISTRAR = `${URL_PHP}registrar.php`;

const ID_CONTENEDOR_USUARIOS = "contenedorUsuarios";
const ID_BOTON_ENVIAR = "botonEnviar";
const ID_BOTON_VOLVER = "botonVolver";
const ID_INPUT_USUARIO_NOMBRE = "inputNombreUsuario";
const ID_INPUT_USUARIO_PASSWORD = "inputPasswordUsuario";
const ID_MENSAJE_ACCION = "mensajeAccion";
const ID_INPUT_REPETIR_PASSWORD = "inputRepetirPasswordUsuario";

// clases css
const CLASE_BOTON_BASE = "boton";
const CLASE_BOTON_PELIGRO = "boton-peligro";
const CLASE_BOTON_NORMAL = "boton-normal";
const MENSAJE_EXITO = "mensaje-exito";
const MENSAJE_ERROR = "mensaje-peligro";

// mensajes
const MENSAJE_USUARIO_REGISTRADO_EXITO = "Usuario registrado correctamente";
const MENSAJE_USUARIO_REGISTRADO_ERROR_NOMBRE = "El nombre de usuario ya existe";
const MENSAJE_USUARIO_REGISTRADO_ERROR = "Error: no se ha podido registrar";
const MENSAJE_REPETIR_CONTRASEÑA_ERROR = "Las contraseñas no coinciden";


function main() {
    let botonEnviar = document.getElementById(ID_BOTON_ENVIAR);
    if (botonEnviar) {
        botonEnviar.addEventListener("click", enviarDatosFormListener);
        setInterval(habilitarBotonEnviarLlamada, 500);
    }

    let botonVolver = document.getElementById(ID_BOTON_VOLVER);
    if (botonVolver) {
        botonVolver.addEventListener("click", function () {
            window.history.back();
        })
    }
}



function habilitarBotonEnviarLlamada() {
    let botonEnviar = document.getElementById(ID_BOTON_ENVIAR);
    if (botonEnviar) {
        // ...

        let nombreUsuarioForm = document.getElementById(ID_INPUT_USUARIO_NOMBRE)?.value;
        let passwordUsuarioForm = document.getElementById(ID_INPUT_USUARIO_PASSWORD)?.value;
        let repetirPassword = document.getElementById(ID_INPUT_REPETIR_PASSWORD)?.value;

        if (nombreUsuarioForm != "" && passwordUsuarioForm != "" && repetirPassword != "") {
            botonEnviar.disabled = false;
        } else {
            botonEnviar.disabled = true;
        }
    }
}


function enviarDatosFormListener() {
    let nombreUsuarioForm = document.getElementById(ID_INPUT_USUARIO_NOMBRE)?.value;
    let passwordUsuarioForm = document.getElementById(ID_INPUT_USUARIO_PASSWORD)?.value;
    let repetirPasswordUsuarioForm = document.getElementById(ID_INPUT_REPETIR_PASSWORD)?.value;

    if (nombreUsuarioForm && passwordUsuarioForm && repetirPasswordUsuarioForm) {
        if (passwordUsuarioForm == repetirPasswordUsuarioForm) {
            const xhr = new XMLHttpRequest();
            let datos = new FormData();
            datos.append("nombre", nombreUsuarioForm);
            datos.append("password", passwordUsuarioForm);

            xhr.addEventListener("load", llamadaRegistroUsuario);

            xhr.open("POST", URL_REGISTRAR);
            xhr.send(datos);
        } else {
            let contenedorMensaje = document.getElementById(ID_MENSAJE_ACCION);
            if (contenedorMensaje) {
                contenedorMensaje.classList.add(MENSAJE_ERROR);
                contenedorMensaje.innerHTML = `<p>${MENSAJE_REPETIR_CONTRASEÑA_ERROR}</p>`;
            }
        }

    }

}


function llamadaRegistroUsuario(e) {
    if (e.target.status == 200) {
        resultado = JSON.parse(e.target.responseText);

        let contenedorMensaje = document.getElementById(ID_MENSAJE_ACCION);
        if (contenedorMensaje) {
            let mensaje = "";
            let claseCss = "";
            switch (resultado) {
                case 0: // exito
                    mensaje = MENSAJE_USUARIO_REGISTRADO_EXITO;
                    claseCss = MENSAJE_EXITO;

                    break;
                case -1: // error: ya existe un usuario con ese nombre
                    mensaje = MENSAJE_USUARIO_REGISTRADO_ERROR_NOMBRE;
                    claseCss = MENSAJE_ERROR;

                    break;
                case -2: // otro error
                    mensaje = MENSAJE_USUARIO_REGISTRADO_ERROR;
                    claseCss = MENSAJE_ERROR;

            }

            contenedorMensaje.classList.add(claseCss);
            contenedorMensaje.innerHTML = `<p>${mensaje}</p>`;
        }

    }
}