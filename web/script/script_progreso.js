window.addEventListener("DOMContentLoaded", main);

const ID_GRAFICO_EXAMENES = "myChart";
const URL_DESCARGAR_PROGRESO = "https://marta.laprimeracloud01.com/prueba/descargar_progreso.php"

function main(){

    const xhr = new XMLHttpRequest();
    let datos = new FormData();

    datos.append("usuario", usuarioLogeado["id"]);
    xhr.addEventListener("load", descargarProgresoUsuario);
    console.log(usuarioLogeado["id"])
        
    xhr.open("POST", URL_GUARDAR_FALLADAS);
    xhr.send(datos);

}


function descargarProgresoUsuario(e){

    if (e.target.status == 200) {
        //datos = JSON.parse(e.target.responseText);
        //console.log(datos);

        var ctx = document.getElementById(ID_GRAFICO_EXAMENES)?.getContext('2d');
        if(ctx){
            var chart = new Chart(ctx, {
                type: 'pie',
                data:{
                datasets: [{
                    data: [20,10,2],
                    backgroundColor: ['#FCE1F1', 'rgb(255, 245, 204)','#ccece7'],
                    borderColor: ['#f14668', 'orange', '#00C4A7'],
                    label: 'Exámenes'}],
                    labels: ['suspensos','aprobados','perfectos']},
                options: {responsive: true}
            });
        }
    }

}