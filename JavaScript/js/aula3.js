window.onload = function(){
    document.getElementById("xti").onclick = ligar;
    setInterval(apresentaHoras, 1000); //Executa varias vezes

    var nome = readCookie("nome");
    if(nome == null){
        var nome = prompt("Qual o seu nome?");
        writeCookie("nome", nome, 1);
    }
}

function ligar(){
    document.getElementById("xti").src = "img/lampada_on.png";
    var nome = readCookie("nome");
    if(nome != null){
        alert("É bom estar com você, " + nome);
    }

    setTimeout(desligar, 3000); //Executa uma vez
}

function desligar(){
    document.getElementById("xti").src = "img/lampada_off.png";
}

function apresentaHoras(){
    var agora = new Date();
    var horas = agora.getHours() + ":" + agora.getMinutes() + ":" + agora.getSeconds();
    document.getElementById("horas").innerHTML = horas;
}