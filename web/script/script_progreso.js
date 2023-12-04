window.addEventListener("DOMContentLoaded", main);

const ID_GRAFICO_EXAMENES = "myChart";
const ID_CONTENEDOR_INFO_PROGRESO = "infoProgreso";
const URL_DESCARGAR_PROGRESO = `${URL_PHP}descargar_progreso.php`;

function main() {

    const usuarioLogeado = leerSesionLocal();

    const xhr = new XMLHttpRequest();
    let datos = new FormData();
    datos.append("usuario", usuarioLogeado["id"]);
    xhr.addEventListener("load", descargarProgresoUsuario);

    xhr.open("POST", URL_DESCARGAR_PROGRESO);
    xhr.send(datos);

}


function descargarProgresoUsuario(e) {

    if (e.target.status == 200) {
        datos = JSON.parse(e.target.responseText);
        /* ejemplo datos devueltos:
        [
            {ESTADO: 'aprobado', cantidad: 10},
            {ESTADO: 'suspenso', cantidad: 23}
        ]
        */

        let datosExamenes = [];
        datosExamenes["suspenso"] = 0;
        datosExamenes["aprobado"] = 0;
        datosExamenes["perfecto"] = 0;
        for (fila of datos) {
            datosExamenes[fila["ESTADO"]] = fila["cantidad"];
        }

        let contenedorInfo = document.getElementById(ID_CONTENEDOR_INFO_PROGRESO);
        if (contenedorInfo) {
            let infoProgreso = document.createElement("div");
            if (datos.length > 0) {
                infoProgreso.innerHTML = `<p>Total examenes realizados: ${datosExamenes["suspenso"] + datosExamenes["aprobado"] + datosExamenes["perfecto"]}</p>
                                          <p>Suspensos: ${datosExamenes["suspenso"]}</p>
                                          <p>Aprobados: ${datosExamenes["aprobado"]}</p>
                                          <p>Perfectos: ${datosExamenes["perfecto"]}</p>`;
            } else {
                infoProgreso.innerHTML = `<p>No hay datos para mostrar.</p>`;
            }
            contenedorInfo.appendChild(infoProgreso);
        }

        if (datos.length > 0) {
            let ctx = document.getElementById(ID_GRAFICO_EXAMENES)?.getContext('2d');
            if (ctx) {
                let chart = new Chart(ctx, {
                    type: 'pie',
                    data: {
                        datasets: [{
                            data: [datosExamenes["suspenso"], datosExamenes["aprobado"], datosExamenes["perfecto"]],
                            backgroundColor: ['#FCE1F1', 'rgb(255, 245, 204)', '#ccece7'],
                            borderColor: ['#f14668', 'orange', '#00C4A7'],
                            label: 'Exámenes'
                        }],
                        labels: ['suspensos', 'aprobados', 'perfectos']
                    },
                    options: { responsive: true }
                });
            }
        }

    }

}