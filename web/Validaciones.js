/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//redireccion super facil
function redireccion(value) {
    if (value == "Vendedor") {
        location.href = "vendedor.jsp";
        
    } else if (value == "Comprador") {
        location.href = "comprador.jsp";
    }
}

