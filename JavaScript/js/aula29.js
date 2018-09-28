/*
    Cliente: Cine-Baladinha
    Autor: Ricardo Lopes Costa
    Descrição: Scripts para localização de poltronas disponiveis no cinema;
*/
//true = disponivel
//false = indisponivel

window.onload = function(){
    carregarPoltronas();
    
    var imagens = document.getElementsByTagName("img");
    for(var i = 0; i < imagens.length; i++){
        imagens[i].onclick = verificarStatus(i);
    }
}

function verificarStatus(poltrona){
    return function() {
        var src = document.getElementsByTagName("img")[poltrona].src
        var msg = "";
        if(src.indexOf("ball_disponivel.jpg") > 0){
            msg = "Poltrona Disponivel";
        }else if(src.indexOf("ball_indisponivel.jpg") > 0){
            msg = "Poltrona Indisponivel";
        }else{
            msg = "Esta poltrona é Sua!!!";
        }
        alert(msg);
    }
}

var poltronas = [false, true, false, true, true, true, false, true, false];

function carregarPoltronas(){
    var imagens = document.getElementsByTagName("img");
    for(var i = 0; i < imagens.length; i++){
        if(poltronas[i]) {
            imagens[i].src = "img/ball_disponivel.jpg";
        } else {
            imagens[i].src = "img/ball_indisponivel.jpg";
        }
    }
}

function selecionarPoltrona(){
    var imagens = document.getElementsByTagName("img");
    for(var i = 0; i < poltronas.length; i++){
        if(poltronas[i]){
            imagens[i].src = "img/ball_selecionada.jpg";
            var quer = confirm("Você quer esta Poltrona?");
            if(quer){
                break;
            }else{
                imagens[i].src = "img/ball_disponivel.jpg";
            }
        }
    }
}

function selecionarCasal(){
    var imagens = document.getElementsByTagName("img");
    for(var i = 0; i < poltronas.length; i++){
        if(poltronas[i] && poltronas[i+1]){
            imagens[i].src = "img/ball_selecionada.jpg";
            imagens[i+1].src = "img/ball_selecionada.jpg";
            
            var quer = confirm("Você quer estas Poltronas?");
            if(quer){
                break;
            }else{
                imagens[i].src = "img/ball_disponivel.jpg";
                imagens[i+1].src = "img/ball_disponivel.jpg";
            }
        }
    }
}