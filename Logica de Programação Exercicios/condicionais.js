valor1 = 10;
valor2 = 11;

if(valor1 > valor2){
    console.log("Valor1 é maior");
}
else if(valor2 > valor1){
    console.log("Valor2 é maior");
}
else{
    console.log("Errou");
}

valor = 3;
switch(valor){
    case 1, 2:
        console.log("valor <= 2");
        break;
    case 3:
        console.log("3");
        break;
    default:
        console.log("Errou");
        break;
}

var moedasJoao = 4
var moedasMaria = 5;

if(moedasJoao != moedasMaria && moedasJoao > moedasMaria){
    console.log("joao tem mais moedas");
}
else if(moedasJoao != moedasMaria && moedasJoao < moedasMaria){
    console.log("maria tem mais moedas");
}
else{
    console.log("Errou");
}

if(moedasJoao != moedasMaria || moedasJoao > moedasMaria){
    console.log("joao tem mais moedas");
}
else if(moedasJoao != moedasMaria || moedasJoao < moedasMaria){
    console.log("maria tem mais moedas");
}
else{
    console.log("Errou");
}

