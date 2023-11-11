window.addEventListener("DOMContentLoaded", main);

// urls ajax
const URL_LOGIN = "https://marta.laprimeracloud01.com/prueba/login.php";

// clases css
const CLASE_BOTON_BASE = "boton";
const CLASE_BOTON_PELIGRO = "boton-peligro";
const CLASE_BOTON_NORMAL = "boton-normal";

// identificadores
const ID_MENU_ESCRITORIO = "menuEscritorio";
const ID_INPUT_NOMBRE = "inputNombreUsuario";
const ID_INPUT_PASSWORD = "inputPasswordUsuario";

// nombre de atributos que se guardan en LocalStorage
const LOCAL_ATR_NOMBRE = "nombreUsuario";
const LOCAL_ATR_PASSWORD = "passwordUsuario";
const LOCAL_ATR_ADMIN = "esAdmin";

const usuarioLogeado = leerSesionLocal();

function main() {
    console.log("script.js");

    let menu = document.getElementById(ID_MENU_ESCRITORIO);
    if (menu) {
        menu.innerHTML = `<a href="inicio.html"><img src="/web/img/logo.png" alt="logo-autotest" class="header-logo"></a>
                            <input type="checkbox" id="menu" class="header-control-hamburguesa">
                            <label for="menu" class="header-control-hamburguesa"> ☰ </label>`;

        let listaMenu = document.createElement("ul");
        listaMenu.classList.add("header-contenido-menu");

        let botonLog = document.createElement("button");
        botonLog.classList.add(CLASE_BOTON_BASE);

        let elementoLi = document.createElement("li");


        if (usuarioLogeado["nombre"] && usuarioLogeado["password"]) {  
            // si hay una sesion activa

            if(usuarioLogeado["admin"] == undefined){
                const xhr = new XMLHttpRequest();
                let datos = new FormData();
                datos.append("nombre", usuarioLogeado["nombre"]);
                datos.append("password", usuarioLogeado["password"]);
            
                xhr.addEventListener("load", llamadaLoginComprobarUsuario);
            
                xhr.open("POST", URL_LOGIN);
                xhr.send(datos);
            }
            
            listaMenu.innerHTML = `<li><i class="fa-regular fa-user"></i> ${usuarioLogeado["nombre"]}</li>`;

            botonLog.classList.add(CLASE_BOTON_PELIGRO);  // boton para cerrar sesion
            botonLog.innerHTML = '<i class="fa-solid fa-power-off"></i>  Log out';
            botonLog.addEventListener("click", eliminarSesionLocal);
            elementoLi.appendChild(botonLog);
            listaMenu.appendChild(elementoLi);

            // si el usuario es administrador
            if(usuarioLogeado["admin"] == 1 && usuarioLogeado["admin"] == true){
                //console.log(usuarioLogeado["admin"])
                inicializarOpcionesAdmin();
            }

            // borro los datos relacionados con ser admin para que no se vean
            delete usuarioLogeado.admin;
            localStorage.removeItem(LOCAL_ATR_ADMIN);

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
                                                <a href="#">registrar</a>
                                            </button>`;
            listaMenu.appendChild(elementoLiRegistrar);
        }

        menu.appendChild(listaMenu);
    }

}

function iniciarSesionListener(){
    let nombreUsuario = document.getElementById(ID_INPUT_NOMBRE)?.value;
    let passwordUsuario = document.getElementById(ID_INPUT_PASSWORD)?.value;


    if(nombreUsuario && passwordUsuario && nombreUsuario != "" && passwordUsuario != ""){

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
function llamadaLogin(e){
    if (e.target.status == 200) {
        resultado = JSON.parse(e.target.responseText);
        console.log(resultado);

        if(resultado["NOMBRE"]){
            guardarSesionLocal(resultado["NOMBRE"], resultado["PASSWORD"], resultado["esAdmin"]);
            location.replace('/web/html/inicio.html');
        } else {
            // no se puede iniciar sesion
            // no existe el usuario o los datos son incorrectos
            console.log("no se puede iniciar sesion; no existe el usuario o los datos son incorrectos.");
        }

    }
}


// llamada AJAX para comprobar el usuario
// y almacenar si es admin o no
// para dibujar las opciones de admin en el inicio
function llamadaLoginComprobarUsuario(e){
    if (e.target.status == 200) {
        resultado = JSON.parse(e.target.responseText);
        console.log(resultado);

        if(resultado["NOMBRE"]){
            if(resultado["esAdmin"]){
                guardarSesionLocal(resultado["NOMBRE"], resultado["PASSWORD"], resultado["esAdmin"]);
            }

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

    if (nombre && password) {
        usuarioSesion["nombre"] = nombre;
        usuarioSesion["password"] = password;
        usuarioSesion["admin"] = esAdmin;
    }

    return usuarioSesion;
}


// function para guardar los datos de la sesion activa en localStorage
// le paso el nombre y la contraseña de tipo string del usuario
// devuelve true/false
function guardarSesionLocal(nombre = "", password = "", esAdmin = false) {

    let exito = false;

    if (typeof nombre == 'string' && typeof password == 'string' && nombre != "" && password != "") {
        localStorage.setItem(LOCAL_ATR_NOMBRE, nombre);
        localStorage.setItem(LOCAL_ATR_PASSWORD, password);
        localStorage.setItem(LOCAL_ATR_ADMIN, esAdmin);

        exito = true;
    }

    return exito;
}


// funcion para eliminar la sesion almacenada en localStorage
function eliminarSesionLocal() {
    localStorage.removeItem(LOCAL_ATR_NOMBRE);
    localStorage.removeItem(LOCAL_ATR_PASSWORD);
    location.replace('/web/html/inicio.html');        // recargar página
}


function inicializarOpcionesAdmin(){
    let contenedor = document.getElementById("contenedorTarjetas");
    if(contenedor){
        let enlace = document.createElement("a");
        enlace.href = "/web/html/usuarios.html";
        enlace.innerHTML = `
                            <div class="tarjeta">
                                <h2>Usuarios</h2>
                                <p>Administra los usuarios de la app</p>
                                <i class="fa-solid fa-users"></i>
                            </div>`;
        contenedor.appendChild(enlace);
    }
}