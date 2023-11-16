window.addEventListener("DOMContentLoaded", main);

const URL_USUARIOS = "https://marta.laprimeracloud01.com/prueba/descargar_usuarios.php";
const URL_ELIMINAR_USUARIO = "https://marta.laprimeracloud01.com/prueba/eliminar_usuario.php";

const NUM_USUARIOS = 30;
const ID_CONTENEDOR_USUARIOS = "contenedorUsuarios";


function main(){
    console.log("script_usuarios.js");

    if(usuarioLogeado["nombre"]){
        const xhr = new XMLHttpRequest();
        let datos = new FormData();
        datos.append("nombre", usuarioLogeado["nombre"]);
        datos.append("password", usuarioLogeado["password"]);
    
        xhr.addEventListener("load", llamadaLoginComprobarUsuarioAdmin);
    
        xhr.open("POST", URL_LOGIN);
        xhr.send(datos);
    } else {
        // redirigir al inicio
        location.replace('/web/html/inicio.html');
    }

}


// llamada AJAX para comprobar el usuario que hay en la sesion
// y si es admin o no
function llamadaLoginComprobarUsuarioAdmin(e){
    if (e.target.status == 200) {
        resultado = JSON.parse(e.target.responseText);
        //console.log(resultado);

        if(resultado["NOMBRE"]){
            if(resultado["esAdmin"]){

                // descargar los usuarios
                const xhr = new XMLHttpRequest();
                let datos = new FormData();
                datos.append("usuarios", NUM_USUARIOS);
                datos.append("posicion", 0);
            
                xhr.addEventListener("load", descargarListadoUsuarios);
            
                xhr.open("POST", URL_USUARIOS);
                xhr.send(datos);
            }
            
        } else {
            // no existe el usuario de la sesion en la BD
            eliminarSesionLocal();
            location.replace('/web/html/inicio.html');
        }

    }
}


// llamada AJAX
function descargarListadoUsuarios(e){
    if (e.target.status == 200) {
        usuarios = JSON.parse(e.target.responseText);
        console.log(usuarios);

        let tablaUsuarios = document.createElement("table");
        tablaUsuarios.classList.add("tabla-listado");

        if(usuarios.length > 0){
            let contenedorUsuarios = document.getElementById(ID_CONTENEDOR_USUARIOS);

            if(contenedorUsuarios){
                 // hay usuarios
                tablaUsuarios.innerHTML = ` <tr>
                                                <th>Nombre</th>
                                                <th>Contraseña</th>
                                                <th>Admin</th>
                                                <th>
                                            </tr>`;
                for(usuario of usuarios){
                let filaUsuario = document.createElement("tr");
                filaUsuario.innerHTML =    `<td>${usuario["NOMBRE"]}</td>
                            <td>${usuario["PASSWORD"]}</td>
                            <td>${usuario["esAdmin"] == 1 ? "Sí" : "No"}</td>`;

                let contenedorControles = document.createElement("td");
                contenedorControles.innerHTML = '<button class="boton boton-normal"><i class="fa-solid fa-pencil"></i></button>';
                let botonEliminar = document.createElement("button");
                botonEliminar.classList.add("boton");
                botonEliminar.classList.add("boton-peligro");
                botonEliminar.addEventListener("click", eliminarUsuarioListener);
                botonEliminar.innerHTML = '<i class="fa-solid fa-trash-can"></i>';

                contenedorControles.appendChild(botonEliminar);

                filaUsuario.appendChild(contenedorControles);

                filaUsuario.dataset.id = usuario["ID"];

                tablaUsuarios.appendChild(filaUsuario);
                }

                } else {
                // no hay usuarios
                tablaUsuarios.innerHTML = `<tr>
                            <td colspan="4">No hay usuarios disponibles</td>
                        </tr>`;
                }

                contenedorUsuarios.appendChild(tablaUsuarios);
            }

    }
}

/*
<table class="tabla-listado">
            <tr>
                <th>Nombre</th>
                <th>Contraseña</th>
                <th>Admin</th>
                <th>
              </tr>

              <tr>
                <td>marta</td>
                <td>1234</td>
                <td>Sí</td>
                <td>
                    <button class="boton boton-normal"><i class="fa-solid fa-pencil"></i></button>
                    <button class="boton boton-peligro"><i class="fa-solid fa-trash-can"></i></button>
                </td>
              </tr>

        </table>
*/


function eliminarUsuarioListener(e){
    console.log(this.parentNode.parentNode);
    let fila = this.parentNode.parentNode;

    let nombreUsuario = fila.getElementsByTagName("td")[0]?.innerHTML;


    if (confirm(`Está a punto de eliminar el usuario "${nombreUsuario}". Esta acción no se puede deshacer`) == true) {

        let idUsuario = fila.dataset.id;

        if(idUsuario){
            const xhr = new XMLHttpRequest();
            let datos = new FormData();
            datos.append("id", idUsuario);
        
            xhr.addEventListener("load", llamadaEliminarUsuario);
        
            xhr.open("POST", URL_ELIMINAR_USUARIO);
            xhr.send(datos);
        }

      }
}

function llamadaEliminarUsuario(e){
    if (e.target.status == 200) {

        // buscar la forma de comprobar si el usuario se eliminó correctamente
        // ...

        location.replace('/web/html/usuarios.html');
    }
}