window.addEventListener("DOMContentLoaded", main);

const URL_USUARIOS = `https://marta.laprimeracloud01.com/prueba/descargar_usuarios.php`;
const URL_ELIMINAR_USUARIO = `https://marta.laprimeracloud01.com/prueba/eliminar_usuario.php`;

const ID_CONTENEDOR_USUARIOS = "contenedorUsuarios";
const CLASE_OCULTAR = "ocultar";
let usuarioIdEliminar = 0;


// mensajes
const MENSAJE_BORRAR_USUARIO_EXITO = "Usuario eliminado";
const MENSAJE_BORRAR_USUARIO_ERROR = "No se ha podido eliminar";


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
        location.replace(URL_PAGINAS_HTML + PAGINA_INICIO);
    }

}


// llamada AJAX para comprobar el usuario que hay en la sesion
// y si es admin o no
function llamadaLoginComprobarUsuarioAdmin(e){
    if (e.target.status == 200) {
        resultado = JSON.parse(e.target.responseText);

        if(resultado["NOMBRE"]){
           if(resultado["esAdmin"] == 1){

                // descargar los usuarios
                const xhr = new XMLHttpRequest();
                xhr.addEventListener("load", descargarListadoUsuarios);
            
                xhr.open("POST", URL_USUARIOS);
                xhr.send();
            } else {
                eliminarSesionLocal();
                location.replace(URL_PAGINAS_HTML + PAGINA_INICIO);
            }
            
        } else {
            // no existe el usuario de la sesion en la BD
            eliminarSesionLocal();
            location.replace(URL_PAGINAS_HTML + PAGINA_INICIO);
        }

    }
}


// llamada AJAX
function descargarListadoUsuarios(e){
    if (e.target.status == 200) {
        usuarios = JSON.parse(e.target.responseText);
        console.log(usuarios);

        let tablaUsuarios = document.createElement("table");
        let cuerpoTabla = document.createElement("tbody");
        cuerpoTabla.classList.add("list");
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
                filaUsuario.innerHTML =    `<td class='nombre'>${usuario["NOMBRE"]}</td>
                            <td class='password'>${usuario["PASSWORD"]}</td>
                            <td class='admin'>${usuario["esAdmin"] == 1 ? "Sí" : "No"}</td>`;

                let contenedorControles = document.createElement("td");

                let botonEliminar = document.createElement("button");
                botonEliminar.classList.add("boton");
                botonEliminar.classList.add("boton-peligro");
                botonEliminar.addEventListener("click", eliminarUsuarioListener);
                botonEliminar.innerHTML = '<i class="fa-solid fa-trash-can"></i>';

                let botonEditar = document.createElement("button");
                botonEditar.classList.add("boton");
                botonEditar.classList.add("boton-normal");
                //botonEditar.innerHTML = `<a href="${URL_PAGINAS_HTML + PAGINA_EDITAR_USUARIO}"><i class="fa-solid fa-pencil"></i></a>`;
                botonEditar.innerHTML = `<i class="fa-solid fa-pencil"></i>`;
                botonEditar.addEventListener("click", editarUsuarioBotonListener);

                contenedorControles.appendChild(botonEditar);
                contenedorControles.appendChild(botonEliminar);

                filaUsuario.appendChild(contenedorControles);

                filaUsuario.dataset.id = usuario["ID"];
                filaUsuario.dataset.nombre = usuario["NOMBRE"];

                cuerpoTabla.appendChild(filaUsuario);
                }

                } else {
                // no hay usuarios
                tablaUsuarios.innerHTML = `<tr>
                            <td colspan="4">No hay usuarios disponibles</td>
                        </tr>`;
                }
                tablaUsuarios.appendChild(cuerpoTabla);

                contenedorUsuarios.appendChild(tablaUsuarios);

                inicializarBuscador();

            }

    }
}


function eliminarUsuarioListener(e){
    console.log(this.parentNode.parentNode);
    let fila = this.parentNode.parentNode;

    let nombreUsuario = fila.getElementsByTagName("td")[0]?.innerHTML;


    if (confirm(`Está a punto de eliminar el usuario "${nombreUsuario}". Esta acción no se puede deshacer`) == true) {

        usuarioIdEliminar = fila.dataset.id;

        if(usuarioIdEliminar){
            const xhr = new XMLHttpRequest();
            let datos = new FormData();
            datos.append("id", usuarioIdEliminar);
        
            xhr.addEventListener("load", llamadaEliminarUsuario);
        
            xhr.open("POST", URL_ELIMINAR_USUARIO);
            xhr.send(datos);
        }

      }
}


function llamadaEliminarUsuario(e){
    if (e.target.status == 200) {
        let resultado = JSON.parse(e.target.responseText);
        let mensaje = "";
        let claseCss = "";
        if(resultado){
            // se ha borrado el usuario
            mensaje = MENSAJE_BORRAR_USUARIO_EXITO;
            claseCss = MENSAJE_EXITO;
            ocultarFilaUsuarioPorId(usuarioIdEliminar);

        } else {
            // no se ha realizado el borrado
            mensaje = MENSAJE_BORRAR_USUARIO_ERROR;
            claseCss = MENSAJE_ERROR;
        }

        let contenedorMensaje = document.getElementById(ID_MENSAJE_ACCION);
        if(contenedorMensaje){
            contenedorMensaje.classList.add(claseCss);
            contenedorMensaje.innerHTML = `<p>${mensaje}</p>`;
        }

    }
}


function ocultarFilaUsuarioPorId(id){
    let fila = document.querySelector(`#${ID_CONTENEDOR_USUARIOS} tr[data-id='${id}']`);
    console.log(fila);
    if(fila){
        fila.innerHTML = "";
        fila.removeAttribute("data-id");
    }
}


function editarUsuarioBotonListener(){
    let fila = this.parentNode.parentNode;
    idUsuarioEditar = fila.dataset.id;
    localStorage.setItem(LOCAL_EDITAR_USUARIO_ID, idUsuarioEditar);
    location.replace(URL_PAGINAS_HTML + PAGINA_EDITAR_USUARIO);
}



function inicializarBuscador(){
    let options = {
        valueNames: [ 'nombre', 'password', "admin" ]
      };
      
      let userList = new List('contenedorUsuarios', options);
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