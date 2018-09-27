/*
    função: ligar()
    autor: Josiel
    descrição: apresenta o nome do usuario e liga a lampada
*/
function ligar(){
    var nome = window.prompt("Qual o seu Nome ?");
    // var nome = "jos'iel";
    // var nome = "jos\"iel"; //string
    // var nome = "jos\\iel";
    // var nome = "josiel\nalves";
    // var nome = "josiel\n \u7231";
    // var nome1; //undefined
    // nome1 = null; // null
    // nome1 = 3 * "pessoas"; //NaN - não é numero
    // nome1 = 1.7976931348623157e+308; //maximo representado pelo javascript
    // nome1 = 1.7976931348623157e+309; //infinito

    const HORAS_DO_DIA = 24; //Constante, variavel que não varia
    
    alert("Prazer em conhecer você " + nome);
    document.getElementById("xti").src = "img/lampada_on.png";
}