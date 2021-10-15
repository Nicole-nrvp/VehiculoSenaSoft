/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
const form = document.getElementById('frm-usuario');
const campos = document.querySelectorAll('#frm-usuario input');

console.log(form)

const reglas = {
    textos: /^[a-zA-ZÀ-ÿ\s]{1,40}$/, // Letras y espacios, letras tildadas, diéresis, entre 1 y 40 caracteres.
    password: /^(?=.*\d)(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z]).{8,}$/,
    //pasword mínimo de 8 caracteres, con al menos un símbolo, letras mayúsculas y minúsculas y un número
    correo: /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/,
    numeros: /^\d{7,10}$/ // solo números de 7 a 10 caracteres.
}
const inputs = {
    txtDoc: false,
    txtFunNombre: false,
    txtApellido: false,
    txtCorreo: false,
    txtCelular: false,    
    txtClave: false,
    txtClave2: false
}

const validarInput = (regla, input, grupo) => {
    if (regla.test(input.value)) {
        document.getElementById(`g-${grupo}`).classList.remove('error');
        document.getElementById(`g-${grupo}`).classList.add('success');
        document.querySelector(`#g-${grupo} i`).classList.remove('fa-exclamation-circle');
        document.querySelector(`#g-${grupo} i`).classList.add('fa-check-circle');
        document.querySelector(`#g-${grupo} .msn-error`).classList.remove('msn-error-visible');
        inputs[grupo] = true;
    } else {
        document.getElementById(`g-${grupo}`).classList.add('error');
        document.getElementById(`g-${grupo}`).classList.remove('success');
        document.querySelector(`#g-${grupo} i`).classList.add('fa-exclamation-circle');
        document.querySelector(`#g-${grupo} .msn-error`).classList.add('msn-error-visible');
        inputs[grupo] = false;
    }
}

const confirmarPassword = (grupo) => {
    const pass1 = document.getElementById('txtClave');
    const pass2 = document.getElementById('txtClave2');

    if (pass1.value == pass2.value) {
        document.getElementById(`g-${grupo}`).classList.remove('error');
        document.getElementById(`g-${grupo}`).classList.add('success');
        document.querySelector(`#g-${grupo} i`).classList.remove('fa-exclamation-circle');
        document.querySelector(`#g-${grupo} i`).classList.add('fa-check-circle');
        document.querySelector(`#g-${grupo} .msn-error`).classList.remove('msn-error-visible');
        inputs[grupo] = true;
    } else {
        document.getElementById(`g-${grupo}`).classList.add('error');
        document.getElementById(`g-${grupo}`).classList.remove('success');
        document.querySelector(`#g-${grupo} i`).classList.add('fa-exclamation-circle');
        document.querySelector(`#g-${grupo} .msn-error`).classList.add('msn-error-visible');
        inputs[grupo] = false;
    }
}

const validarCampos = (e) => {
    //console.log("Se levantó una tecla en el input");
    //console.log(e.target.name);
    switch (e.target.name) {

        case "txtDoc":

            validarInput(reglas.numeros, e.target, e.target.name);
            break;
        case "txtCelular":

            validarInput(reglas.numeros, e.target, e.target.name);
            break;

        case "txtFunNombre":
            validarInput(reglas.textos, e.target, e.target.name);
            break;
        case "txtNombre":
            validarInput(reglas.textos, e.target, e.target.name);
            break;

        case "txtApellido":
            validarInput(reglas.textos, e.target, e.target.name);
            break;

        case "txtCorreo":
            validarInput(reglas.correo, e.target, e.target.name);
            break;

        case "txtClave":
            validarInput(reglas.password, e.target, e.target.name);
            break;

        case "txtClave2":
            confirmarPassword(e.target.name);
            break;
        
    }

}

form.addEventListener('submit', e => {
    e.preventDefault();
    if (inputs.txtDoc && inputs.txtFunNombre && inputs.txtApellido && inputs.txtCelular && inputs.txtClave && inputs.txtClave2) {
        
        form.submit();
        
    } else {
        document.getElementById('frm-error').classList.add('frm-error-visible')
    }

})

campos.forEach((campo) => {


    campo.addEventListener('keyup', validarCampos);
    campo.addEventListener('blur', validarCampos);

})