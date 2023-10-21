window.addEventListener("DOMContentLoaded", main);

const url = "https://marta.laprimeracloud01.com/prueba/login.php";
const nombre = "marta";
const password = "1234";

function main(){

    const xhr = new XMLHttpRequest();
    const datos = new FormData();
    datos.append("nombre", nombre);
    datos.append("pass", password);

    xhr.addEventListener("load", recogerRespuesta);

    xhr.open("GET", url);
    xhr.send(datos);

}


function recogerRespuesta(e){
    if(e.target.status == 200){
        respuesta = JSON.parse(e.target.responseText);  // datos de la respuesta
        console.log(respuesta);
        
    }
}