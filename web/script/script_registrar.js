window.addEventListener("DOMContentLoaded", main);

const URL_REGISTRAR = "https://marta.laprimeracloud01.com/prueba/registrar.php";

const NUM_USUARIOS = 10;
const ID_CONTENEDOR_USUARIOS = "contenedorUsuarios";


function main(){
    console.log("script_registrar.js");

        const xhr = new XMLHttpRequest();
        let datos = new FormData();
        datos.append("nombre", "prueba");
        datos.append("password", "1234");
    
        xhr.addEventListener("load", llamadaRegistroUsuario);
    
        xhr.open("POST", URL_REGISTRAR);
        xhr.send(datos);


}



function llamadaRegistroUsuario(e){
    if (e.target.status == 200) {
        resultado = JSON.parse(e.target.responseText);
        console.log(resultado);

    }
}
