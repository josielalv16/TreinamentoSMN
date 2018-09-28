var regex = new RegExp("JavaScript");
var regex = /JavaScript/i; //i - Ignora letras maiusculas e minusculas
var string = "JavaScript";
alert(regex.test(string));
alert(/javascript/i.test("JavaScript"));

var str = "Qual é o doce mais doce que o doce?"
alert(/doce/i.exec(str)); //exec traz so a primeira referencia
alert(str.match(/doce/ig)); //match traz todas as referencias

/* METACARACTERES */
alert(/./.test("Pier"));
alert(/\w/.test("Pier")); // qualquer caracter de a-z 0-9
alert(/\s/.test("Pier")); // procura por espaços
alert(/\d/.test("Pier")); // procura por numeros/digitos
alert(/^21/.test("Pier")); //Procura a ocorrencia no inicio do texto
alert(/21$/.test("Pier")); // procura a ocorrencia no final do texto
alert(/\d$/.test("Pier")); //procura um digito no final da ocorrencia
alert(/^\d\d\d\d\d-\d\d\d$/.test("70294-070"));

/* QUANTIFICADORES */
alert(/\d*/.test("Pier21")); // 0 ou mais ocorrencia
alert(/\d+/.test("Pier21")); // 1 ou mais ocorrencia
alert(/\d?/.test("Pier21")); // 0 ou 1 vezes
alert(/\d{2}/.test("Pier21")); // Quantidade desejada
alert(/\d{2}$/.test("Pier21")); // 2digitos no final
alert(/^\d{5}-\d{3}$/.test("70294-070"));
alert(/^\d{2}\/\d{2}\/\d{4}$/.test("12/02/1980"));
alert(/^\d{2}\/\d{2}\/\d{2,4}$/.test("12/02/80"));
alert(/\w+@\w+\.\w{2,3}/.test("josiel@hotmail.com"));

/* CARACTERES OPCIONAIS */
//cau e ceu
alert(/c[ae]u/.test("ceu"));
alert(/\d[\d\,]*/.test("23,45"));

/* BUSCAR E SUBSTITUIÇÕES */
var str = "Qual é o Doce mais doce que o doce?";
alert(str.match(/doce/ig));
alert(str.replace(/doce/ig, "DOCINHO"));

var str = "O rato roeu a roupa do rei de roma.";
alert(str.match(/r[a-z]/ig));
alert(str.replace(/r[a-z]/ig, "XXX"));

var url = "www.xti.com.br/clientes-2011.html";
//        "http://www.xti.com.br/2011/clientes.jsp";
var re = /www.xti.com.br\/\w[2,]-\d{4}\.html/;
alert(re.test(url));
re = /(www.xti.com.br)\/(\w[2,])-(\d{4})\.html/;
alert(url.replace(re, "http://$1/$3/$2.jsp"));