var numero = 0;

function soma(valor){
    valor++;

    if(valor < 10){
        soma(valor);
        console.log(valor);
    }
}

soma(numero);