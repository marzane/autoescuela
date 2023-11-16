window.addEventListener("DOMContentLoaded", main);

const URL_REGISTRAR = "https://marta.laprimeracloud01.com/prueba/registrar.php";

const NUM_USUARIOS = 10;
const ID_CONTENEDOR_USUARIOS = "contenedorUsuarios";
const ID_BOTON_ENVIAR = "botonEnviar";
const ID_INPUT_USUARIO_NOMBRE = "inputNombreUsuario";
const ID_INPUT_USUARIO_PASSWORD = "inputPasswordUsuario";


function main() {
    console.log("script_registrar.js");
    let botonEnviar = document.getElementById(ID_BOTON_ENVIAR);
    if(botonEnviar){
        botonEnviar.addEventListener("click", enviarDatosFormListener);
        setInterval(habilitarBotonEnviarLlamada, 500);
    }

}



function llamadaRegistroUsuario(e) {
    if (e.target.status == 200) {
        resultado = JSON.parse(e.target.responseText);
        console.log(resultado);

        switch (resultado) {
            case 0: // exito
            console.log("usuario registrado correctamente");

                break;
            case -1: // error: ya existe un usuario con ese nombre
            console.log("error: ya existe un usuario con ese nombre");

                break;
            case -2: // otro error
            console.log("error");

        }

    }
}


function habilitarBotonEnviarLlamada() {
    let botonEnviar = document.getElementById(ID_BOTON_ENVIAR);
    if (botonEnviar) {
        // ...

        let nombreUsuario = document.getElementById(ID_INPUT_USUARIO_NOMBRE)?.value;
        let passwordUsuario = document.getElementById(ID_INPUT_USUARIO_PASSWORD)?.value;

        if(nombreUsuario && passwordUsuario && nombreUsuario != "" && passwordUsuario != ""){
            botonEnviar.disabled = false;
        } else {
            botonEnviar.disabled = true;
        }
    }
}


function enviarDatosFormListener(){

    console.log("enviar")
    /*
        const xhr = new XMLHttpRequest();
        let datos = new FormData();
        datos.append("nombre", "prueba");
        datos.append("password", "1234");
    
        xhr.addEventListener("load", llamadaRegistroUsuario);
    
        xhr.open("POST", URL_REGISTRAR);
        xhr.send(datos);
    */
}