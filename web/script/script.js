window.addEventListener("DOMContentLoaded", main);

// urls ajax
const URL_PHP = "/php/";
const URL_LOGIN = `${URL_PHP}login.php`;

// enlaces html
const URL_PAGINAS_HTML = "/web/html/";
const PAGINA_INICIO = "inicio.html";
const PAGINA_USUARIOS = "usuarios.html";
const PAGINA_REGISTRAR_USUARIO = "formusuario.html";
const PAGINA_EDITAR_USUARIO = "formusuario_editar.html";
const PAGINA_AVANCES = "avances.html";
const PAGINA_EXAMEN_FALLOS = "examen_fallos.html";

// clases css
const CLASE_BOTON_BASE = "boton";
const CLASE_BOTON_PELIGRO = "boton-peligro";
const CLASE_BOTON_NORMAL = "boton-normal";
const CLASE_CONTENEDOR_INPUT_ADMIN = "contenedor-input-admin";
const MENSAJE_EXITO = "mensaje-exito";
const MENSAJE_ERROR = "mensaje-peligro";

// identificadores
const ID_MENU_ESCRITORIO = "menuEscritorio";
const ID_INPUT_NOMBRE = "inputNombreUsuario";
const ID_INPUT_PASSWORD = "inputPasswordUsuario";
const ID_INPUT_ADMIN = "inputEsAdmin";
const ID_FORMULARIO_EDITAR_USUARIO = "formEditarUsuario";
const ID_MENSAJE_ACCION = "mensajeAccion";
const ID_ENLACE_EXAMEN_FALLOS = "testFallosEnlace";
const ID_CONTENEDOR_PREGUNTAS_FALLOS = "contenedorPreguntasFallos";
const ID_INPUT_MENU_HAMBURGUESA = "menu";

// nombre de atributos que se guardan en LocalStorage
const LOCAL_ATR_NOMBRE = "nombreUsuario";
const LOCAL_ATR_PASSWORD = "passwordUsuario";
const LOCAL_ATR_ADMIN = "esAdmin";
const LOCAL_ATR_ID = "idUsuario";
const LOCAL_EDITAR_USUARIO_ID = "idUsuarioEditar";


// mensajes
const MENSAJE_ERROR_LOGIN = "no se puede iniciar sesion; no existe el usuario o los datos son incorrectos";

const MENSAJE_USUARIO_EDITADO_EXITO = "Usuario actualizado correctamente";
const MENSAJE_USUARIO_EDITADO_ERROR_NOMBRE = "El nombre de usuario ya está en uso";
const MENSAJE_USUARIO_EDITADO_ERROR = "Error: no se ha podido actualizar";
const MENSAJE_REPETIR_EDITADO_ERROR = "Las contraseñas no coinciden";



function main() {
    const usuarioLogeado = leerSesionLocal();

    let menu = document.getElementById(ID_MENU_ESCRITORIO);
    if (menu) {
        menu.innerHTML = `<a href="${URL_PAGINAS_HTML}${PAGINA_INICIO}"><img src="/web/img/logo.png" alt="logo-autotest" class="header-logo"></a>
                            <input type="checkbox" id="menu" class="header-control-hamburguesa">
                            <label for="menu" class="header-control-hamburguesa"> ☰ </label>`;

        let listaMenu = document.createElement("ul");
        listaMenu.classList.add("header-contenido-menu");

        let botonLog = document.createElement("button");
        botonLog.classList.add(CLASE_BOTON_BASE);

        let elementoLi = document.createElement("li");

        if (usuarioLogeado["nombre"] && usuarioLogeado["password"]) {

            // si hay una sesion activa
            const xhr = new XMLHttpRequest();
            let datos = new FormData();
            datos.append("nombre", usuarioLogeado["nombre"]);
            datos.append("password", usuarioLogeado["password"]);

            xhr.addEventListener("load", llamadaLoginComprobarUsuario);

            xhr.open("POST", URL_LOGIN);
            xhr.send(datos);


            listaMenu.innerHTML = `<li><i class="fa-regular fa-user"></i> ${usuarioLogeado["nombre"]}</li>`;

            botonLog.classList.add(CLASE_BOTON_PELIGRO);  // boton para cerrar sesion
            botonLog.innerHTML = '<i class="fa-solid fa-power-off"></i>  Log out';
            botonLog.addEventListener("click", eliminarSesionLocal);
            elementoLi.appendChild(botonLog);

            let elementoLiEditar = elementoLi.cloneNode();
            let botonEditar = document.createElement("button");
            botonEditar.innerHTML = `<a href="${URL_PAGINAS_HTML}${PAGINA_EDITAR_USUARIO}">editar</a>`;
            botonEditar.classList.add(CLASE_BOTON_NORMAL);
            botonEditar.classList.add(CLASE_BOTON_BASE);
            botonEditar.addEventListener("click", editarUsuarioListener);
            elementoLiEditar.appendChild(botonEditar);

            listaMenu.appendChild(elementoLiEditar);
            listaMenu.appendChild(elementoLi);

            inicializarOpcionEditarUsuarioInicio();

            // si el usuario es administrador
            if (usuarioLogeado["admin"] == 1 && usuarioLogeado["admin"] == true) {
                inicializarOpcionesAdmin();
                inicializarOpcionesAdminFormularioUsuario();
            } else {
                // borro los datos relacionados con ser admin para que no se vean
                delete usuarioLogeado.admin;
                localStorage.removeItem(LOCAL_ATR_ADMIN);
            }

        } else {
            // no se ha iniciado sesión
            listaMenu.innerHTML = `<li>
                                        <form class="header-form-log">
                                            <input type="text" placeholder="usuario" id="${ID_INPUT_NOMBRE}">
                                            <input type="password" placeholder="contraseña" id="${ID_INPUT_PASSWORD}">
                                        </form>
                                    </li>`;

            botonLog.classList.add(CLASE_BOTON_NORMAL);  // el boton para iniciar sesion
            botonLog.innerHTML = '<i class="fa-solid fa-right-to-bracket"></i>  Log in';
            botonLog.addEventListener("click", iniciarSesionListener);
            elementoLi.appendChild(botonLog);
            listaMenu.appendChild(elementoLi);

            let elementoLiRegistrar = elementoLi.cloneNode();
            elementoLiRegistrar.innerHTML = `<button class="boton boton-normal">
                                                <a href="${URL_PAGINAS_HTML}${PAGINA_REGISTRAR_USUARIO}">registrar</a>
                                            </button>`;
            listaMenu.appendChild(elementoLiRegistrar);
        }

        menu.appendChild(listaMenu);
    }

}


// esto es para el formulario de iniciar sesion que hay en la cabecera
// si se tienen los datos de usuario y contraseña de realiza el login
function iniciarSesionListener() {
    let nombreUsuario = document.getElementById(ID_INPUT_NOMBRE)?.value;
    let passwordUsuario = document.getElementById(ID_INPUT_PASSWORD)?.value;

    if (nombreUsuario && passwordUsuario && nombreUsuario != "" && passwordUsuario != "") {

        const xhr = new XMLHttpRequest();
        let datos = new FormData();
        datos.append("nombre", nombreUsuario);
        datos.append("password", passwordUsuario);

        xhr.addEventListener("load", llamadaLogin);

        xhr.open("POST", URL_LOGIN);
        xhr.send(datos);
    }

}


// llamada AJAX para el login
// la llamada devuelve true si el login es correcto
// false si no existe el usuario
function llamadaLogin(e) {
    if (e.target.status == 200) {
        resultado = JSON.parse(e.target.responseText);

        if (resultado["NOMBRE"]) {
            guardarSesionLocal(resultado["NOMBRE"], resultado["PASSWORD"], resultado["esAdmin"], resultado["ID"]);
            location.replace(URL_PAGINAS_HTML + PAGINA_INICIO);

        } else {
            // no se puede iniciar sesion
            // no existe el usuario o los datos son incorrectos
            let contenedorMensaje = document.getElementById(ID_MENSAJE_ACCION);
            if (contenedorMensaje) {
                contenedorMensaje.classList.add(MENSAJE_ERROR);
                contenedorMensaje.innerHTML = `<p>${MENSAJE_ERROR_LOGIN}</p>`;

                let inputMenuHamburguesa = document.getElementById(ID_INPUT_MENU_HAMBURGUESA);
                if (inputMenuHamburguesa) {
                    inputMenuHamburguesa.checked = false;
                }


            }
        }

    }
}


// llamada AJAX para comprobar el usuario
// y almacenar si es admin o no
// para dibujar las opciones de admin en el inicio
function llamadaLoginComprobarUsuario(e) {
    if (e.target.status == 200) {
        resultado = JSON.parse(e.target.responseText);

        if (resultado["NOMBRE"]) {
            guardarSesionLocal(resultado["NOMBRE"], resultado["PASSWORD"], resultado["esAdmin"], resultado["ID"]);
        } else {
            // no existe el usuario de la sesion en la BD
            eliminarSesionLocal();
        }

    }
}



// funcion para comprobar si hay una sesion abierta en la aplicacion
// devuelve un array con los valores del usuario de la sesion
// ejemplo: ['Manuel José Castro Damas', '123456']
function leerSesionLocal() {
    let usuarioSesion = [];
    let nombre = localStorage.getItem(LOCAL_ATR_NOMBRE);
    let password = localStorage.getItem(LOCAL_ATR_PASSWORD);
    let esAdmin = localStorage.getItem(LOCAL_ATR_ADMIN);
    let id = localStorage.getItem(LOCAL_ATR_ID);

    if (nombre && password) {
        usuarioSesion["nombre"] = nombre;
        usuarioSesion["password"] = password;
        usuarioSesion["admin"] = esAdmin;
        usuarioSesion["id"] = id;
    }

    return usuarioSesion;
}


// function para guardar los datos de la sesion activa en localStorage
// le paso el nombre y la contraseña de tipo string del usuario
// devuelve true/false
function guardarSesionLocal(nombre = "", password = "", esAdmin = false, id = 0) {

    let exito = false;

    if (typeof nombre == 'string' && typeof password == 'string' && nombre != "" && password != "") {
        localStorage.setItem(LOCAL_ATR_NOMBRE, nombre);
        localStorage.setItem(LOCAL_ATR_PASSWORD, password);
        localStorage.setItem(LOCAL_ATR_ADMIN, esAdmin);
        localStorage.setItem(LOCAL_ATR_ID, id);

        exito = true;
    }

    return exito;
}


// funcion para eliminar la sesion almacenada en localStorage
function eliminarSesionLocal() {
    localStorage.removeItem(LOCAL_ATR_NOMBRE);
    localStorage.removeItem(LOCAL_ATR_PASSWORD);
    localStorage.removeItem(LOCAL_ATR_ID);
    localStorage.removeItem(LOCAL_ATR_ADMIN);
    location.replace(URL_PAGINAS_HTML + PAGINA_INICIO);// recargar página
}



function inicializarOpcionEditarUsuarioInicio() {
    let contenedor = document.getElementById("contenedorTarjetas");
    if (contenedor) {
        let enlace = document.createElement("a");
        enlace.href = URL_PAGINAS_HTML + PAGINA_AVANCES;
        enlace.innerHTML = `
                            <div class="tarjeta">
                                <h2>Progreso</h2>
                                <p>Repasa tus avances en los tests</p>
                                <i class="fa-solid fa-chart-pie"></i>
                            </div>`;
        enlace.addEventListener("click", editarUsuarioListener);
        contenedor.appendChild(enlace);
    }
}


// esto es para la pantalla de inicio en modo administrador
// muestra elementos de administrador
function inicializarOpcionesAdmin() {
    let contenedor = document.getElementById("contenedorTarjetas");
    if (contenedor) {
        let enlace = document.createElement("a");
        enlace.href = URL_PAGINAS_HTML + PAGINA_USUARIOS;
        enlace.innerHTML = `
                            <div class="tarjeta">
                                <h2>Usuarios</h2>
                                <p>Administra los usuarios de la app</p>
                                <i class="fa-solid fa-users"></i>
                            </div>`;
        contenedor.appendChild(enlace);
    }
}


// esto es para el formulario de editar usuario en modo administrador
// habilita el input para dar el permiso de admin al usuario que se está editando
function inicializarOpcionesAdminFormularioUsuario() {
    const usuarioLogeado = leerSesionLocal();

    let contenedorForm = document.getElementById(ID_FORMULARIO_EDITAR_USUARIO);

    if (contenedorForm) {

        let contenedorInputAdmin = document.createElement("div");
        contenedorInputAdmin.classList.add(CLASE_CONTENEDOR_INPUT_ADMIN);
        let inputCheckAdmin = document.createElement("input");
        let labelAdmin = document.createElement("label");
        labelAdmin.innerHTML = "Administrador<i class='fa-solid fa-triangle-exclamation warning-icon'></i>";
        inputCheckAdmin.type = "checkbox";
        inputCheckAdmin.setAttribute("id", ID_INPUT_ADMIN);
        inputCheckAdmin.checked = usuarioLogeado["admin"] == true ? true : false;
        contenedorInputAdmin.appendChild(inputCheckAdmin);
        contenedorInputAdmin.appendChild(labelAdmin);

        contenedorForm.appendChild(contenedorInputAdmin);
    }

}



function editarUsuarioListener() {
    const usuarioLogeado = leerSesionLocal();
    localStorage.setItem(LOCAL_EDITAR_USUARIO_ID, usuarioLogeado["id"]);
}
