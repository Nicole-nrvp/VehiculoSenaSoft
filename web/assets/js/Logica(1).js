/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
console.log("ACTIVADO")

var txtUsu = document.getElementById("usu");
var txtPas = document.getElementById("pas");
var error = document.getElementById("Error")
var boton = document.getElementById("boton");

boton.addEventListener('click', () => {

    var Usuario = txtUsu.value;
    var Constraseña = txtPas.value;

    if (error ==="") {

        


    } else {

        txtUsu.style.borderBottom = "1px solid rgb(207, 46, 46)";
        txtPas.style.borderBottom = "1px solid rgb(207, 46, 46)";
        error.style.display = "block";

    }




})