var pessoas = ["Ricardo", "Sandra", "Beatriz", "Lawrence"];

alert(pessoas.push("Janaina")); // Adiciona E ao fim da fila
alert(pessoas);
alert(pessoas.shift()); // Remove o primeiro elemento da fila
alert(pessoas);
alert(pessoas.pop()); //Remove o ultimo elemento da fila
alert(pessoas);
alert(pessoas.unshift("Furão da Fila")); //Adiciona E no inicio da fila
alert(pessoas);

//Array Multidimensional [][]
var pessoas =
[
    [["XTI", "Tecnologia"], "M"],
    ["Sandra", "F"]
];

alert(pessoas[0][0][0]);

//Array Associativo {}
var pessoa = {nome: "Beatriz", cidade: "Brasilia"};
alert(pessoa["nome"]);

var frutas = ["cupuaçú", "banana", "graviola", "laranja"];
function todos(elem, ind, obj){
    return (typeof elem == "string");
}
alert(frutas.every(todos));

var frutas = ["cupuaçú", "banana", 123, "graviola", "laranja"];
function todos(elem, ind, obj){
    return (typeof elem == "string");
}
alert(frutas.every(todos));

var frutas = ["cupuaçú", "banana", 123, "graviola", "laranja"];
function todos(elem, ind, obj){
    return (typeof elem == "number");
}
alert(frutas.some(todos));

var frutas = ["cupuaçú", "banana", 123, "graviola", "laranja"];
function todos(elem, ind, obj){
    return (elem.indexOf("an") > 0);
}
alert(frutas.filter(todos));

var frutas = ["cupuaçú", "banana", 123, "graviola", "laranja"];
function todos(elem, ind, obj){
    return (elem = elem.toUpperCase());
}
alert(frutas.map(todos));

