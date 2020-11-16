var formulario = document.getElementById("form1");

formulario.onsubmit = function validar(event) { 
    console.log("PASA POR ACÁ");
    event.preventDefault();

    // https://developer.mozilla.org/es/docs/Web/JavaScript/Guide/Regular_Expressions

    var expresionRegular = /\w+@\w+\.+[a-z]/;  //Las expresiones regulares van entre / / 
   
    /* hay expresiones y modificadores de todo tipo para controlar y detectar gran cantidd de cosas como dni, pasaporte, simbolos, frases, etc 
       hay que googlear regex. En la pagina w3c School tenemos regex en la seccion JavaScript. 
    */

    var nombre = document.getElementById("TBNombre").value;
    var apellido = document.getElementById("TBApellido").value;
    var email = document.getElementById("TBEmail").value;
    //var usuario = document.getElementById("usuario").value;
    var password = document.getElementById("TBContraseña").value;
    var password2 = document.getElementById("TBRContraseña").value;
    //var telefono = document.getElementById("telefono").value;

    if (nombre === "" || apellido === "" || email === "" || password === "") {
        alert("Todos los campos son obligatorios");
        return false; // esto es para evitar que los datos sean enviados y la funcion se corte acá.
    }
    else if (nombre.length > 30) {
        alert("El nombre no debe superar 30 caracteres");
        return false;
    }
    else if (apellido.length > 80) {
        alert("El apellido no debe superar 80 caracteres");
        return false;
    }
    else if (email.length > 100) {
        alert("El email no debe superar 100 caracteres");
        return false;
    }
    else if (!expresionRegular.test(email)) {
        alert("El email es inválido");
        return false;
    }
    //else if (usuario.length > 20 || password.length > 20) {
    //    alert("El usuario y la contraseña no deben superar 20 caracteres");
    //    return false;
    //}
    else if (password !== password2) {
        alert("Las contraseñas no coinciden");
        // console.log("ERROR");

        return false;
    }
    //else if (telefono.length > 10) {
    //    alert("El teléfono no debe superar 10 caracteres");
    //    return false;
    //}
    //else if (isNaN(telefono)) {
    //    alert("El teléfono ingresado no es un número"); // isNaN (is Not a Number) es una función de js. 
    //    return false;
    //}
    console.log("Y TAMBIÉN POR ACÁ");
}


