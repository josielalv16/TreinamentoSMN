var matriz = [];

var contador = 1;
for(var i = 0; i < 5; i++){
    matriz[i] = [];
    for(var j = 0; j < 5; j++){
        matriz[i][j] = [];
        for(var k = 0; k < 5; k++){
            matriz[i][j][k] = contador;
            contador++;
        }
    }
}

console.log(matriz);
console.log(matriz[0][0][4]);