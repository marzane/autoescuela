window.addEventListener("DOMContentLoaded", main);

const PREGUNTAS_EXAMEN = 30;

const ID_CONTENEDOR_PREGUNTAS = "contenedorPreguntas";
const ID_BOTON_CORREGIR = "botonCorregir";
const PREGUNTA_IMAGEN_URL = "/web/img/preguntas/";

let INTERVAL_ID_HABILITAR_CORRECCION;


// URL AJAX
const URL_DESCARGAR_PREGUNTAS_FALLOS = `https://marta.laprimeracloud01.com/prueba/descargar_preguntas_fallos.php`;
const URL_DESCARGAR_SOLUCIONES = `https://marta.laprimeracloud01.com/prueba/descargar_soluciones.php`;
const URL_GUARDAR_FALLADAS = `https://marta.laprimeracloud01.com/prueba/guardar_falladas.php`;


function main() {
    console.log("script_examen_fallos.js");

    const xhr = new XMLHttpRequest();
    let datos = new FormData();
    datos.append("preguntas", PREGUNTAS_EXAMEN)

    xhr.addEventListener("load", descargarPreguntas);

    xhr.open("POST", URL_DESCARGAR_PREGUNTAS);
    xhr.send(datos);
}



// llamada ajax para descargar las preguntas del examen
// y mostrar en contenido en la interfaz
function descargarPreguntas(e) {
    if (e.target.status == 200) {
        preguntas = JSON.parse(e.target.responseText);

        let contenedorPreguntas = document.getElementById(ID_CONTENEDOR_PREGUNTAS);
        if (contenedorPreguntas) {
            for (let i = 0; i < preguntas.length; i++) {
                contenedorPreguntas.appendChild(crearElementoPregunta(preguntas[i], i + 1));
            }

            let botonCorregir = document.createElement("button");
            botonCorregir.classList.add("boton");
            botonCorregir.classList.add("boton-action");
            botonCorregir.setAttribute("disabled", "");
            botonCorregir.setAttribute("id", ID_BOTON_CORREGIR);
            botonCorregir.innerHTML = "CORREGIR";
            botonCorregir.addEventListener("click", corregirExamenListener);
            contenedorPreguntas.appendChild(botonCorregir);

            INTERVAL_ID_HABILITAR_CORRECCION = setInterval(habilitarCorreccionExamen, 1000);
        }
    }
}


function crearElementoPregunta(datos = {}, numeroPregunta = 0) {

    let contenedor = document.createElement("div");
    contenedor.classList.add("pregunta");
    contenedor.dataset.id = datos["ID"];
    contenedor.innerHTML = `<img src="${PREGUNTA_IMAGEN_URL}${datos["IMAGEN"]}" alt="" class="pregunta-img">
                            <div class="pregunta-contenido">
                                <p>${numeroPregunta}. ${datos["ENUNCIADO"]}</p>
                                <div class="pregunta-opcion">
                                    <input type="radio" name="pregunta${numeroPregunta}" class="radio-input">
                                    <label><i></i>${datos["RESPUESTA1"]}</label>
                                </div>
                                
                                <div class="pregunta-opcion">
                                    <input type="radio" name="pregunta${numeroPregunta}" class="radio-input">
                                    <label><i></i>${datos["RESPUESTA2"]}</label>
                                </div>

                                <div class="pregunta-opcion">
                                    <input type="radio" name="pregunta${numeroPregunta}" class="radio-input">
                                    <label><i></i>${datos["RESPUESTA3"]}</label>
                                </div>
                            </div>`;

    return contenedor;
}



function corregirExamenListener() {
    let nodoPreguntas = document.querySelectorAll(".pregunta");

    if (nodoPreguntas.length == PREGUNTAS_EXAMEN) {
        let arrayNodos = [...nodoPreguntas]

        let identificadoresPreguntas = arrayNodos.map(pregunta => pregunta.dataset.id);
        let identificadoresPreguntasString = identificadoresPreguntas.join(' ');

        const xhr = new XMLHttpRequest();
        let datos = new FormData();
        datos.append("preguntas", identificadoresPreguntasString);

        xhr.addEventListener("load", descargarSoluciones);

        xhr.open("POST", URL_DESCARGAR_SOLUCIONES);
        xhr.send(datos);

    }

    this.disabled = true;
}


// llamada AJAX para descargar las soluciones y corregir las preguntas
function descargarSoluciones(e){
    if (e.target.status == 200) {
        soluciones = JSON.parse(e.target.responseText);

        let nodoPreguntas = document.querySelectorAll(".pregunta");

        if (soluciones.length == PREGUNTAS_EXAMEN && nodoPreguntas.length == PREGUNTAS_EXAMEN) {

            let aciertos = 0;
            let fallos = 0;

            let preguntasFalladas = [];  // aqui se guardaran los id de las preguntas falladas
            let preguntasAcertadas = [];  // aqui se guardaran los id de las preguntas acertadas

            for (let i = 0 ; i < nodoPreguntas.length ; i++) {
                let pregunta = nodoPreguntas[i];
                let radios = pregunta.querySelectorAll("input[type=radio]");
                let respuestacorrecta = soluciones[i];

                for (let j = 0; j < radios.length; j++) {
                    if ((j + 1) == respuestacorrecta) {
                        radios[j].classList.add("radio-input-acierto");
                        if(radios[j].checked){
                            aciertos++;
                            preguntasAcertadas.push(pregunta.dataset.id);
                        }
                    } else if (radios[j].checked) {
                        radios[j].classList.add("radio-input-fallo");
                        fallos++;
                        preguntasFalladas.push(pregunta.dataset.id);
                    }
                }
            }
    
            alert(`Aciertos: ${aciertos}\nfallos: ${fallos}`);
    
            if(usuarioLogeado["nombre"]){
                // guardo las preguntas falladas para los examenes de fallos
                let preguntasFalladasString = preguntasFalladas.join("-");
                let preguntasAcertadasString = preguntasAcertadas.join("-");

                const xhr = new XMLHttpRequest();
                let datos = new FormData();
                datos.append("falladas", preguntasFalladasString);
                datos.append("acertadas", preguntasAcertadasString);
                datos.append("usuario", usuarioLogeado["id"]);
                xhr.addEventListener("load", enviarDatosResultado);
                console.log(usuarioLogeado["id"])
                console.log(preguntasAcertadasString)
        
                xhr.open("POST", URL_GUARDAR_FALLADAS);
                xhr.send(datos);
            }
        }
    }
}


function enviarDatosResultado(e){
    if (e.target.status == 200) {
        console.log("enviarDatosResultado")
        soluciones = JSON.parse(e.target.responseText);
        console.log(soluciones);
    }
}


// funcion que comprueba que se han contestado todas las preguntas
// y habilita el boton para corregir el examen
function habilitarCorreccionExamen() {
    let botonCorregir = document.getElementById(ID_BOTON_CORREGIR);
    if (botonCorregir) {
        let preguntasContestadas = document.querySelectorAll(`#${ID_CONTENEDOR_PREGUNTAS} input[type="radio"]:checked`);
        if (preguntasContestadas.length == PREGUNTAS_EXAMEN) {
            botonCorregir.disabled = false;
            clearInterval(INTERVAL_ID_HABILITAR_CORRECCION);
        }
    }
}


// funcion que contesta las preguntas del examen
// para hacer pruebas de desarrollo
function rellenarExamen() {
    let preguntas = document.querySelectorAll(`#${ID_CONTENEDOR_PREGUNTAS} .pregunta input[type="radio"]:first-child`);

    for (p of preguntas) {
        p.checked = true;
    }
}


/*  estructura de cada bloque de pregunta

            <div class="pregunta">
                <img src="/web/img/preguntas/p1.gif" alt="" class="pregunta-img">
                <div class="pregunta-contenido">
                    <p>1. En esta vía fuera de poblado, ¿qué luces debe llev…afía, que está amaneciendo y no ha salido el sol?</p>
                    <div class="pregunta-opcion">
                        <input type="radio" name="pregunta3" id="">
                        <label for="">respuesta 1</label>
                    </div>
                    
                    <div class="pregunta-opcion">
                        <input type="radio" name="pregunta3" id="">
                        <label for="">respuesta 2</label>
                    </div>

                    <div class="pregunta-opcion">
                        <input type="radio" name="pregunta3" id="">
                        <label for="">respuesta 3</label>
                    </div>
                </div>
            </div>

*/