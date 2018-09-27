var dias = ["domingo", "segunda", "terça", "quarta", "quinta", "sexta", "sabado"];
var mes = ["janeiro", "fevereiro", "março", "abril", "maio", "junho", "julho", "agosto", "setembro", "outubro", "novembro", "dezembro"];
var data = new Date("Set/27/2018 15:18:20");

alert(data.getDate()); //Dia do mes
alert(dias[data.getDay()]); //Dia da semana
alert(data.getFullYear()); //Ano com 4 digitos
alert(data.getHours()); //Horas
alert(data.getMilliseconds());
alert(data.getMinutes());
alert(mes[data.getMonth()]); // Mes do ano
alert(data.getSeconds());
alert(data.getTime());

alert(data.getTimezoneOffset());
alert(Date.parse(data));
data.setFullYear(2019);
data.setDate(28);
data.setMonth(10);

alert(data.toDateString());
alert(data.toLocaleDateString());
