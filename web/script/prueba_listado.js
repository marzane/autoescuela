window.addEventListener("DOMContentLoaded", main);

const PREGUNTAS_EXAMEN = 30;

const URL_NUM_PREGUNTAS = "https://marta.laprimeracloud01.com/prueba/listado_examenes.php";

const usuarioLogeado = leerSesionLocal();

function main(){

    const xhr = new XMLHttpRequest();

    xhr.addEventListener("load", recogerRespuesta);

    xhr.open("POST", URL_NUM_PREGUNTAS);
    xhr.send();

}


// llamada ajax que recibe el número de preguntas que hay en la base de datos
// para saber cuántos examenes hay disponibles si cada uno tiene x preguntas
function recogerRespuesta(e){
    if(e.target.status == 200){
        respuesta = JSON.parse(e.target.responseText);  // datos de la respuesta(numero de preguntas)
        console.log("hay " + respuesta + " preguntas");
        const num_examenes = Math.trunc(respuesta / PREGUNTAS_EXAMEN); // numero de examenes
        console.log(num_examenes);

        // pintar la lista de examenes en el html
        // ...


        // compruebo si hay un usuario 'logeado'
        if(usuarioLogeado.length <= 0){     // si no hay sesion leo la info de los examenes en local
            console.log("no hay sesion");

            leerExamenesLocal();

            // ...

        } else {                            // si hay sesion leo los examenes del usuario de la base de datos
            let nombre = usuarioLogeado[0];
            let password = usuarioLogeado[1];
            console.log(nombre + " | " + password);
        }
        
    }
}


// funcion para comprobar si hay una sesion abierta en la aplicacion
// devuelve un array con los valores del usuario de la sesion
// ejemplo: ['marta', '1234']
function leerSesionLocal(){
    let usuarioSesion = [];
    let nombre = localStorage.getItem("nombre");
    let password = localStorage.getItem("password");

    if(nombre && password){
        usuarioSesion.push(nombre);
        usuarioSesion.push(password);
    }

    return usuarioSesion;
}


// function para guardar los datos de la sesion activa en sessionStorage
// le paso el nombre y la contraseña de tipo string del usuario
// devuelve true/false
function guardarSesionLocal(nombre = "", password = ""){

    let exito = false;

    if(typeof nombre == 'string' && typeof password == 'string' && nombre != "" && password != ""){
        localStorage.setItem("nombre", nombre);
        localStorage.setItem("password", password);
        exito = true;
    }

    return exito;
}


// funcion para eliminar la sesion almacenada en local
function eliminarSesionLocal(){
    localStorage.removeItem("nombre");
    localStorage.removeItem("password");
}


// funcion para leer la informacion guardada de los examenes en localStorage
function leerExamenesLocal(){

    // ...
}