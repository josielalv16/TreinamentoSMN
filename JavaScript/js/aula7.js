/*
    metodo: calcularIMC
    autor: Josiel
    descrição: Calcula o indice de massa corporal - IMC
*/
function calcularIMC(){
    var formulario = document.getElementById("formulario");

    var kilos = +formulario.kilos.value;
    var metros = +formulario.metros.value;
    var centimetros = +formulario.centimetros.value;

    var altura = (metros * 100 + centimetros) / 100;
    var imc = kilos / (altura * altura);

    formulario.imc.value = imc.toFixed(2);

    

    if(imc <= 20){
        alert("Abaixo do Peso");
        formulario.resultado.value = "Abaixo do Peso";
    }else if(imc > 20 && imc <= 25){
        alert("Peso Ideal");
        formulario.resultado.value = "Peso Ideal";
    }else if(imc > 25 && imc <= 30){
        alert("Sobrepeso");
        formulario.resultado.value = "Sobrepeso";
    }else if(imc > 30 && imc <= 35){
        alert("Obesidade Moderada");
        formulario.resultado.value = "Obesidade Moderada";
    }else if(imc > 35 && imc <= 40){
        alert("Obesidade Severa");
        formulario.resultado.value = "Obesidade Severa";
    }else if(imc > 40 && imc <= 50){
        alert("Obesidade Mórbida");
        formulario.resultado.value = "Obesidade Mórbida";
    }else{
        alert("Super Obesidade");
        formulario.resultado.value = "Super Obesidade";
    }
}