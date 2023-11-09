window.addEventListener("DOMContentLoaded", main);

// urls ajax
const URL_NUM_PREGUNTAS = "https://marta.laprimeracloud01.com/prueba/listado_examenes.php";

// clases css
const CLASE_BOTON_BASE = "boton";
const CLASE_BOTON_PELIGRO = "boton-peligro";
const CLASE_BOTON_NORMAL = "boton-normal";

// identificadores
const ID_MENU_ESCRITORIO = "menuEscritorio";
const ID_INPUT_NOMBRE = "inputNombreUsuario";
const ID_INPUT_PASSWORD = "inputPasswordUsuario";


// nombre de atributos que se guardan en LocalStorage
const LOCAL_ATR_NOMBRE = "nombre";
const LOCAL_ATR_PASSWORD = "password";


const usuarioLogeado = leerSesionLocal();

function main() {
    console.log("script.js");

    /*
    // puesta a punto de los controles de la cabecera de la pagina
    let menuEscritorio = document.getElementById(ID_MENU_ESCRITORIO);
    let menuMovil = document.getElementById(ID_MENU_MOVIL);

    if (menuEscritorio && menuMovil) {
        let listaDesplegableMovil = document.createElement("ul");

        // boton login
        let botonMenu = document.createElement("button");
        botonMenu.classList.add(CLASE_BOTON_BASE);

        //inputs login usuario
        let formularioLogin = document.createElement("form");
        // nombre
        let inputNombre = document.createElement("input");
        inputNombre.type = "text";
        inputNombre.placeholder = "usuario";

        // password
        let inputPassword = document.createElement("input");
        inputPassword.type = "password";
        inputPassword.placeholder = "contraseña";

        formularioLogin.appendChild(inputNombre);
        formularioLogin.appendChild(inputPassword);


        if (usuarioLogeado.length > 0) {  // si se ha iniciado sesion
            botonMenu.classList.add(CLASE_BOTON_PELIGRO);  // boton para cerrar sesion
            botonMenu.innerHTML = '<i class="fa-solid fa-power-off"></i>  Log out';
            botonMenu.addEventListener("click", eliminarSesionLocal);

            let elementoUsuario = document.createElement("p");
            elementoUsuario.innerHTML = '<i class="fa-regular fa-user"></i> ' + usuarioLogeado[0];
            menuEscritorio.appendChild(elementoUsuario);

            listaDesplegableMovil.innerHTML = '<li> <i class="fa-regular fa-user"></i> ' + usuarioLogeado[0] + ' </li>';

            botonMenuMovil = botonMenu.cloneNode(true);
            botonMenuMovil.addEventListener("click", eliminarSesionLocal);
            
        } else {  // si no hay sesion
            menuEscritorio.appendChild(formularioLogin);

            botonMenu.classList.add(CLASE_BOTON_NORMAL);  // el boton para iniciar sesion
            botonMenu.innerHTML = '<i class="fa-solid fa-right-to-bracket"></i>  Log in';
            botonMenuMovil = botonMenu.cloneNode(true);
            listaDesplegableMovil.appendChild(formularioLogin.cloneNode(true));
        }

        menuEscritorio.appendChild(botonMenu);
        listaDesplegableMovil.appendChild(botonMenuMovil);
        menuMovil.appendChild(listaDesplegableMovil);
    }

    */


    let menu = document.getElementById(ID_MENU_ESCRITORIO);
    if (menu) {
        menu.innerHTML = `<a href="listado.html"><img src="/web/img/logo.png" alt="logo-autotest" class="header-logo"></a>
                            <input type="checkbox" id="menu" class="header-control-hamburguesa">
                            <label for="menu" class="header-control-hamburguesa"> ☰ </label>`;

        let listaMenu = document.createElement("ul");
        listaMenu.classList.add("header-contenido-menu");

        let botonLog = document.createElement("button");
        botonLog.classList.add(CLASE_BOTON_BASE);

        let elementoLi = document.createElement("li");


        if (usuarioLogeado.length > 0) {
            listaMenu.innerHTML = `<li><i class="fa-regular fa-user"></i>${usuarioLogeado[0]}</li>`;

            botonLog.classList.add(CLASE_BOTON_PELIGRO);  // boton para cerrar sesion
            botonLog.innerHTML = '<i class="fa-solid fa-power-off"></i>  Log out';
            botonLog.addEventListener("click", eliminarSesionLocal);
            elementoLi.appendChild(botonLog);
            listaMenu.appendChild(elementoLi);

        } else {
            // no se ha iniciado sesión
            listaMenu.innerHTML = `<li>
                                        <form class="header-form-log">
                                            <input type="text" placeholder="usuario">
                                            <input type="password" placeholder="password">
                                        </form>
                                    </li>`;

            botonLog.classList.add(CLASE_BOTON_NORMAL);  // el boton para iniciar sesion
            botonLog.innerHTML = '<i class="fa-solid fa-right-to-bracket"></i>  Log in';
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





// funcion para comprobar si hay una sesion abierta en la aplicacion
// devuelve un array con los valores del usuario de la sesion
// ejemplo: ['Manuel José Castro Damas', '123456']
function leerSesionLocal() {
    let usuarioSesion = [];
    let nombre = localStorage.getItem(LOCAL_ATR_NOMBRE);
    let password = localStorage.getItem(LOCAL_ATR_PASSWORD);

    if (nombre && password) {
        usuarioSesion.push(nombre);
        usuarioSesion.push(password);
    }

    return usuarioSesion;
}


// function para guardar los datos de la sesion activa en localStorage
// le paso el nombre y la contraseña de tipo string del usuario
// devuelve true/false
function guardarSesionLocal(nombre = "", password = "") {

    let exito = false;

    if (typeof nombre == 'string' && typeof password == 'string' && nombre != "" && password != "") {
        localStorage.setItem(LOCAL_ATR_NOMBRE, nombre);
        localStorage.setItem(LOCAL_ATR_PASSWORD, password);
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

function iniciarSesionListener() {

}



// * * * * * * * * * * * * * * *
// funciones de prueba de datos
// * * * * * * * * * * * * * * *

// funcion para tener examenes guardados y hacer pruebas
function guardarExamenesLocalPrueba() {
    let date = new Date();
    let examenesResueltos = [
        { "fecha": date.getDate("YYYY-MM-DDTHH:mm:ss.sssZ"), "aciertos": 2, "fallos": 28 },
        { "fecha": 212121, "aciertos": 10, "fallos": 20 },
        { "fecha": 212121, "aciertos": 1, "fallos": 29 },
    ]

    localStorage.setItem(LOCAL_ATR_EXAMENES, examenesResueltos);
}






/*

// llamada ajax que recibe el número de preguntas que hay en la base de datos
// para saber cuántos examenes hay disponibles si cada uno tiene x preguntas
function recogerExamenes(e) {
    if (e.target.status == 200) {
        respuesta = JSON.parse(e.target.responseText);  // datos de la respuesta(numero de preguntas)
        const num_examenes = Math.trunc(respuesta / PREGUNTAS_EXAMEN); // numero de examenes

        console.log("hay " + respuesta + " preguntas");
        console.log("Examenes: " + num_examenes);


        // compruebo si hay un usuario 'logeado'
        if (usuarioLogeado.length <= 0) {     // si no hay sesion leo la info de los examenes en local
            console.log("no hay sesion");

            let examenesLocal = localStorage.getItem(LOCAL_ATR_EXAMENES);
            if (examenesLocal && examenesLocal.length > 0) {

                // pintar la lista de examenes en el html
                // ponerle a cada uno un dataset con los datos
                // ponerle a cada uno sus clases css
                // ...
            }


        } else {                            // si hay sesion leo los examenes del usuario de la base de datos
            let nombre = usuarioLogeado[0];
            let password = usuarioLogeado[1];
            console.log(nombre + " | " + password);

            // hacer llamada Ajax para descargar los examenes realizados con aciertos y fallos
            const xhr = new XMLHttpRequest();
            let datos = new FormData();
            datos.append("usuario", nombre);

            xhr.addEventListener("load", descargarExamenes);

            xhr.open("POST", URL_DESCARGAR_EXAMENES);
            xhr.send(datos);
        }

    }
}


*/


/*
// listener del boton que tiene cada examen para ir a las preguntas
function cargarPreguntasExamenListener() {
    let numeroExamen = 1; // examen de prueba

    let inicio = numeroExamen * PREGUNTAS_EXAMEN - PREGUNTAS_EXAMEN;

    const xhr = new XMLHttpRequest();
    let datos = new FormData();
    datos.append("offset", inicio);
    datos.append("preguntas", PREGUNTAS_EXAMEN);

    xhr.addEventListener("load", descargarPreguntas);

    xhr.open("POST", URL_DESCARGAR_PREGUNTAS);
    xhr.send(datos);
}
*/