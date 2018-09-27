var b = new Boolean(true);
alert(b instanceof Boolean);
alert(b);

var b = new Boolean();
alert(b);
var b = new Boolean("");
alert(b);
var b = new Boolean("Alguma coisa");
alert(b);
var b = new Boolean(null);
alert(b);

// "Zero, null, NaN e a stirng vazia são inerentemente false;
// todo o resto é inerentemente true"
// Simon Willison, na palestra "A (Re) - Introduction to JavaScript"

var b = new Boolean(0);
alert(b.valueOf());
var b = new Boolean(0);
alert(typeof(b.valueOf()));
var b = new Boolean(0);
alert(typeof(b.toString()));


alert(Number.MAX_VALUE);
alert(Number.MIN_VALUE);
alert(Number.NaN);
alert(Number.NEGATIVE_INFINITY);
alert(Number.POSITIVE_INFINITY);

var n = new Number("120.35123");
alert(n.toFixed(2));
alert(n.toPrecision(3));
alert(n.toExponential(3));