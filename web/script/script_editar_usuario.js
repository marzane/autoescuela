window.addEventListener("DOMContentLoaded", main);

const URL_editar_usuario = "https://marta.laprimeracloud01.com/prueba/editar_usuario.php";
const URL_descargar_usuario_id = "https://marta.laprimeracloud01.com/prueba/descargar_usuario_id.php";

const ID_CONTENEDOR_USUARIOS = "contenedorUsuarios";
const ID_BOTON_ENVIAR = "botonEnviar";
const ID_BOTON_VOLVER = "botonVolver";
const ID_INPUT_USUARIO_NOMBRE = "inputNombreUsuario";
const ID_INPUT_USUARIO_PASSWORD = "inputPasswordUsuario";
const ID_INPUT_REPETIR_PASSWORD = "inputRepetirPasswordUsuario";

let usuarioEditar = [];


// mensajes
const MENSAJE_USUARIO_EDITADO_EXITO = "Usuario registrado correctamente";
const MENSAJE_USUARIO_EDITADO_ERROR_NOMBRE = "El nombre de usuario ya existe";
const MENSAJE_USUARIO_EDITADO_ERROR = "Error: no se ha podido registrar";
const MENSAJE_REPETIR_EDITADO_ERROR = "Las contraseñas no coinciden";


function main() {
    console.log("script_editar.js");
    
    let botonEnviar = document.getElementById(ID_BOTON_ENVIAR);
    if (botonEnviar) {
        botonEnviar.addEventListener("click", enviarDatosFormListener);
        setInterval(habilitarBotonEnviarLlamada, 500);
        descargarUsuarioEditar();
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

        let nombreUsuarioForm = document.getElementById(ID_INPUT_USUARIO_NOMBRE)?.value;
        let passwordUsuarioForm = document.getElementById(ID_INPUT_USUARIO_PASSWORD)?.value;
        let repetirPassword = document.getElementById(ID_INPUT_REPETIR_PASSWORD)?.value;
        //let esAdminForm = document.getElementById(ID_INPUT_ADMIN)?.checked;

        if (nombreUsuarioForm == "" || 
            nombreUsuarioForm == usuarioEditar["NOMBRE"] || 
            (passwordUsuarioForm != "" && repetirPassword != passwordUsuarioForm)) {

            botonEnviar.disabled = true;
        } else {
            botonEnviar.disabled = false;
        }
    }
}


// listener para comprobar y enviar los datos del formulario
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


function descargarUsuarioEditar() {

    let idUsuarioDescargar = localStorage.getItem(LOCAL_EDITAR_USUARIO_ID);
    console.log(idUsuarioDescargar)
    if(idUsuarioDescargar){
        const xhr = new XMLHttpRequest();
            let datos = new FormData();
            datos.append("id", idUsuarioDescargar);

            xhr.addEventListener("load", llamadaDescargarUsuario);

            xhr.open("POST", URL_descargar_usuario_id);
            xhr.send(datos);
    }

}


function llamadaDescargarUsuario(e){
    if (e.target.status == 200) {
        resultado = JSON.parse(e.target.responseText);

        if(resultado["NOMBRE"]){
            if(resultado["ID"] != usuarioLogeado["id"] && usuarioLogeado["esAdmin"] != 1){
                location.replace(URL_PAGINAS_HTML + PAGINA_INICIO);
            }

            usuarioEditar = resultado;

            let inputNombre = document.getElementById(ID_INPUT_USUARIO_NOMBRE);
            if(inputNombre){
                inputNombre.value = resultado["NOMBRE"];
            }
    
            let inputAdmin = document.getElementById(ID_INPUT_ADMIN);
            if(inputAdmin){
                inputAdmin.checked = resultado["esAdmin"] == 1 ? true : false;
            }
        }
    }
}
