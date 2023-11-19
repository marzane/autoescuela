window.addEventListener("DOMContentLoaded", main);

const URL_editar_usuario = "https://marta.laprimeracloud01.com/prueba/editar_usuario.php";

const ID_CONTENEDOR_USUARIOS = "contenedorUsuarios";
const ID_BOTON_ENVIAR = "botonEnviar";
const ID_BOTON_VOLVER = "botonVolver";
const ID_INPUT_USUARIO_NOMBRE = "inputNombreUsuario";
const ID_INPUT_USUARIO_PASSWORD = "inputPasswordUsuario";
const ID_INPUT_REPETIR_PASSWORD = "inputRepetirPasswordUsuario";


// mensajes
const MENSAJE_USUARIO_EDITADO_EXITO = "Usuario registrado correctamente";
const MENSAJE_USUARIO_EDITADO_ERROR_NOMBRE = "El nombre de usuario ya existe";
const MENSAJE_USUARIO_EDITADO_ERROR = "Error: no se ha podido registrar";
const MENSAJE_REPETIR_EDITADO_ERROR = "Las contraseñas no coinciden";


function main() {
    console.log("script_editar.js");

    rellenarFormularioEditarUsuario();
    
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
    console.log("habilitar boton")
    let botonEnviar = document.getElementById(ID_BOTON_ENVIAR);
    if (botonEnviar) {
        // ...

        let nombreUsuarioForm = document.getElementById(ID_INPUT_USUARIO_NOMBRE)?.value;
        let passwordUsuarioForm = document.getElementById(ID_INPUT_USUARIO_PASSWORD)?.value;
        let repetirPassword = document.getElementById(ID_INPUT_REPETIR_PASSWORD)?.value;

        if (nombreUsuarioForm != "") {
            botonEnviar.disabled = false;
        } else {
            botonEnviar.disabled = true;
        }
    }
}


// listener para enviar los datos del formulario
function enviarDatosFormListener() {

    console.log("enviar");
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

// funcion para rellenar el formulario con los datos del usuario
function rellenarFormularioEditarUsuario() {


}

