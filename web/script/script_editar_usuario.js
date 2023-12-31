window.addEventListener("DOMContentLoaded", main);

const URL_editar_usuario = `${URL_PHP}editar_usuario.php`;
const URL_descargar_usuario_id = `${URL_PHP}descargar_usuario_id.php`;

const ID_CONTENEDOR_USUARIOS = "contenedorUsuarios";
const ID_BOTON_ENVIAR = "botonEnviar";
const ID_BOTON_VOLVER = "botonVolver";
const ID_INPUT_USUARIO_NOMBRE = "inputNombreUsuario";
const ID_INPUT_USUARIO_PASSWORD = "inputPasswordUsuario";
const ID_INPUT_REPETIR_PASSWORD = "inputRepetirPasswordUsuario";

let usuarioEditar = [];


function main() {

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

        if (nombreUsuarioForm == usuarioEditar["NOMBRE"] && (passwordUsuarioForm != "" && repetirPassword == passwordUsuarioForm)) {
            botonEnviar.disabled = false;
        }

    }
}


function descargarUsuarioEditar() {

    let idUsuarioDescargar = localStorage.getItem(LOCAL_EDITAR_USUARIO_ID);
    if (idUsuarioDescargar) {
        const xhr = new XMLHttpRequest();
        let datos = new FormData();
        datos.append("id", idUsuarioDescargar);

        xhr.addEventListener("load", llamadaDescargarUsuario);

        xhr.open("POST", URL_descargar_usuario_id);
        xhr.send(datos);
    }

}


function llamadaDescargarUsuario(e) {
    if (e.target.status == 200) {
        resultado = JSON.parse(e.target.responseText);

        const usuarioLogeado = leerSesionLocal();

        if (resultado["NOMBRE"]) {
            if (resultado["ID"] != usuarioLogeado["id"] && usuarioLogeado["admin"] != 1) {
                location.replace(URL_PAGINAS_HTML + PAGINA_INICIO);
            }

            usuarioEditar = resultado;

            let inputNombre = document.getElementById(ID_INPUT_USUARIO_NOMBRE);
            if (inputNombre) {
                inputNombre.value = resultado["NOMBRE"];
            }

            let inputAdmin = document.getElementById(ID_INPUT_ADMIN);
            if (inputAdmin) {
                inputAdmin.checked = resultado["esAdmin"] == 1 ? true : false;
            }
        }
    }
}



// listener para comprobar y enviar los datos del formulario
function enviarDatosFormListener() {
    const usuarioLogeado = leerSesionLocal();

    let nombreUsuarioForm = document.getElementById(ID_INPUT_USUARIO_NOMBRE)?.value;
    let passwordUsuarioForm = document.getElementById(ID_INPUT_USUARIO_PASSWORD)?.value;
    let repetirPasswordUsuarioForm = document.getElementById(ID_INPUT_REPETIR_PASSWORD)?.value;
    let esAdminForm = document.getElementById(ID_INPUT_ADMIN)?.checked;

    if (nombreUsuarioForm) {

        const xhr = new XMLHttpRequest();

        let datos = new FormData();
        datos.append("id", usuarioEditar["ID"]);
        datos.append("nombre", nombreUsuarioForm);

        if (passwordUsuarioForm != "" && repetirPasswordUsuarioForm != "" && passwordUsuarioForm == repetirPasswordUsuarioForm) {
            datos.append("password", passwordUsuarioForm);
        } else {
            datos.append("password", usuarioEditar["PASSWORD"]);
        }

        if (esAdminForm && usuarioLogeado["admin"] == 1) {
            datos.append("esAdmin", esAdminForm);
        }

        xhr.addEventListener("load", llamadaEditarUsuario);

        xhr.open("POST", URL_editar_usuario);
        xhr.send(datos);


    }

}


function llamadaEditarUsuario(e) {
    if (e.target.status == 200) {
        resultado = JSON.parse(e.target.responseText);
        let mensaje = "";
        let claseCss = "";

        switch (resultado) {
            case 0:
                mensaje = MENSAJE_USUARIO_EDITADO_EXITO;
                claseCss = MENSAJE_EXITO;
                break;
            case -2:
                mensaje = MENSAJE_USUARIO_EDITADO_ERROR;
                claseCss = MENSAJE_ERROR;
                break;
            case -1:
                mensaje = MENSAJE_USUARIO_EDITADO_ERROR_NOMBRE;
                claseCss = MENSAJE_ERROR;
        }

        let contenedorMensaje = document.getElementById(ID_MENSAJE_ACCION);
        if (contenedorMensaje) {
            contenedorMensaje.innerHTML = `<p>${mensaje}</p>`;
            contenedorMensaje.classList.add(claseCss);
        }
    }
}