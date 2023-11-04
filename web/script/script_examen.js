window.addEventListener("DOMContentLoaded", main);

const PREGUNTAS_EXAMEN = 30;

const ID_CONTENEDOR_PREGUNTAS = "contenedorPreguntas";
const PREGUNTA_IMAGEN_URL = "/web/img/preguntas/";


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
function descargarPreguntas(e) {
    if (e.target.status == 200) {
        preguntas = JSON.parse(e.target.responseText);
        console.log(preguntas);

        let contenedorPreguntas = document.getElementById(ID_CONTENEDOR_PREGUNTAS);
        if(contenedorPreguntas){
            for (let i = 0; i < preguntas.length; i++) {
                contenedorPreguntas.appendChild(crearElementoPregunta(preguntas[i], i + 1));
            }
        }
    }
}


function crearElementoPregunta(datos = {}, numeroPregunta = 0) {

    let contenedor = document.createElement("div");
    contenedor.classList.add("pregunta");
    contenedor.innerHTML = `<img src="${PREGUNTA_IMAGEN_URL}${datos["IMAGEN"]}" alt="" class="pregunta-img">
                            <div class="pregunta-contenido">
                                <p>${numeroPregunta}. ${datos["ENUNCIADO"]}</p>
                                <div class="pregunta-opcion">
                                    <input type="radio" name="pregunta${numeroPregunta}">
                                    <label>${datos["RESPUESTA1"]}</label>
                                </div>
                                
                                <div class="pregunta-opcion">
                                    <input type="radio" name="pregunta${numeroPregunta}">
                                    <label>${datos["RESPUESTA2"]}</label>
                                </div>

                                <div class="pregunta-opcion">
                                    <input type="radio" name="pregunta${numeroPregunta}">
                                    <label>${datos["RESPUESTA3"]}</label>
                                </div>
                            </div>`;

    return contenedor;
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