
// try{
//     var x = a;
//     var b = x + 10;
//     alert(b);
// }catch(e){
//     alert(e.name + " - " + e.message);
//     alert(e.toString());
// } 
// Executa ocorrendo ou não um erro
// finally{
// }

// var x = prompt("Informe numero maior que 10");
// try{
//     if(x < 10){
//         throw "número menor que 10";
//     }
//     alert(x);

// } catch(e){
//     alert(e);
// }

var Carro = {
    marca : "Nissan",
    modelo : "350Z",
    potencia: {
        cavalos : "350",
        velocidade : "320km/h"
    }
}
with (Carro.potencia){
    alert(cavalos);
    alert(velocidade);
}