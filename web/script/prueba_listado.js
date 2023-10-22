window.addEventListener("DOMContentLoaded", main);

const PREGUNTAS_EXAMEN = 30;

const URL_NUM_PREGUNTAS = "https://marta.laprimeracloud01.com/prueba/listado_examenes.php";
const URL_DESCARGAR_EXAMENES = "https://marta.laprimeracloud01.com/prueba/descargar_examenes.php";

// nombre de atributos que se guardan en LocalStorage
const LOCAL_ATR_NOMBRE = "nombre";
const LOCAL_ATR_PASSWORD = "password";
const LOCAL_ATR_EXAMENES = "examenes";

const usuarioLogeado = leerSesionLocal();

function main(){

    const xhr = new XMLHttpRequest();

    xhr.addEventListener("load", recogerExamenes);

    xhr.open("POST", URL_NUM_PREGUNTAS);
    xhr.send();

}


// llamada ajax que recibe el número de preguntas que hay en la base de datos
// para saber cuántos examenes hay disponibles si cada uno tiene x preguntas
function recogerExamenes(e){
    if(e.target.status == 200){
        respuesta = JSON.parse(e.target.responseText);  // datos de la respuesta(numero de preguntas)
        const num_examenes = Math.trunc(respuesta / PREGUNTAS_EXAMEN); // numero de examenes

        console.log("hay " + respuesta + " preguntas");
        console.log("Examenes: " + num_examenes);


        // compruebo si hay un usuario 'logeado'
        if(usuarioLogeado.length <= 0){     // si no hay sesion leo la info de los examenes en local
            console.log("no hay sesion");

            let examenesLocal = localStorage.getItem(LOCAL_ATR_EXAMENES);
            if(examenesLocal && examenesLocal.length > 0){

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



// llamada ajax que descarga los examenes realizados por un usuario
function descargarExamenes(e){
    if(e.target.status == 200){
        respuesta = JSON.parse(e.target.responseText);
    }
}


// funcion para comprobar si hay una sesion abierta en la aplicacion
// devuelve un array con los valores del usuario de la sesion
// ejemplo: ['marta', '1234']
function leerSesionLocal(){
    let usuarioSesion = [];
    let nombre = localStorage.getItem(LOCAL_ATR_NOMBRE);
    let password = localStorage.getItem(LOCAL_ATR_PASSWORD);

    if(nombre && password){
        usuarioSesion.push(nombre);
        usuarioSesion.push(password);
    }

    return usuarioSesion;
}


// function para guardar los datos de la sesion activa en localStorage
// le paso el nombre y la contraseña de tipo string del usuario
// devuelve true/false
function guardarSesionLocal(nombre = "", password = ""){

    let exito = false;

    if(typeof nombre == 'string' && typeof password == 'string' && nombre != "" && password != ""){
        localStorage.setItem(LOCAL_ATR_NOMBRE, nombre);
        localStorage.setItem(LOCAL_ATR_PASSWORD, password);
        exito = true;
    }

    return exito;
}


// funcion para eliminar la sesion almacenada en localStorage
function eliminarSesionLocal(){
    localStorage.removeItem(LOCAL_ATR_NOMBRE);
    localStorage.removeItem(LOCAL_ATR_PASSWORD);
}


function guardarExamenesLocalPrueba(){
    let examenesResueltos = [
        {"fecha" : 212121, "aciertos" : 2, "fallos" : 28},
        {"fecha" : 212121, "aciertos" : 10, "fallos" : 20},
        {"fecha" : 212121, "aciertos" : 1, "fallos" : 29},
    ]

    localStorage.setItem(LOCAL_ATR_EXAMENES, examenesResueltos);
}