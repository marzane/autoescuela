window.addEventListener("DOMContentLoaded", main);

const PREGUNTAS_EXAMEN = 30;

const ID_CONTENEDOR_PREGUNTAS = "contenedorPreguntas";
const ID_BOTON_CORREGIR = "botonCorregir";
const PREGUNTA_IMAGEN_URL = "/web/img/preguntas/";

let INTERVAL_ID_HABILITAR_CORRECCION;


// URL AJAX
const URL_DESCARGAR_PREGUNTAS = "https://marta.laprimeracloud01.com/prueba/descargar_preguntas.php";

function main() {
    console.log("script_examen.js");

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
        console.log(preguntas);

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
            botonCorregir.addEventListener("click", corregirExamen);
            contenedorPreguntas.appendChild(botonCorregir);

            INTERVAL_ID_HABILITAR_CORRECCION = setInterval(habilitarCorreccionExamen, 1000);
        }
    }
}


function crearElementoPregunta(datos = {}, numeroPregunta = 0) {

    let contenedor = document.createElement("div");
    contenedor.classList.add("pregunta");
    //contenedor.setAttribute("DATA-RESPUESTACORRECTA", datos["RESPUESTACORRECTA"]);
    contenedor.dataset.respuestacorrecta = datos["RESPUESTACORRECTA"];
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


function corregirExamen() {

    let nodoPreguntas = document.getElementsByClassName("pregunta");

    if (nodoPreguntas.length == PREGUNTAS_EXAMEN) {

        for (let pregunta of nodoPreguntas) {
            let radios = pregunta.querySelectorAll("input[type=radio]");
            let respuestacorrecta = parseInt(pregunta.dataset.respuestacorrecta);
            for (let i = 0; i < radios.length; i++) {
                if ((i + 1) == respuestacorrecta) {
                    radios[i].classList.add("radio-input-acierto");
                } else if (radios[i].checked) {
                    radios[i].classList.add("radio-input-fallo");
                }
            }
        }

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