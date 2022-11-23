uses crt;

var
vvod: byte;


function vibor(var v: byte): byte; //Для выбора ответа
begin
Textcolor(2);
writeln('Да - 1');
Textcolor(4);
writeln('Нет - 0');
Textcolor(15);
Write('Выберите вариант: ');
readln(v);
vibor := v;
end;


function fun(var x: real): real; //Функция основная
begin
var fo: real;
fo := 1*power(x,3)+(-1)*power(x,2)+(-1)*x+(14);
fun := fo;
end;


function fun1(var x: real): real; //Функция первообразная
begin
var fo: real;
fo := 1 / 2 * power(x, 4) + 1 / 3 * power(x, 3) - 2 * power(x, 2) + 15 * x;
fun1 := fo;
end;


function predel: integer; //Оснавная функция
begin
ClrScr;
var a, b, h, f, x, S: real;
var n: integer;
Textcolor(14);
Writeln('Вычисление площади фигуры, ограниченной кривой 2*x^3+x^2+(-4)*x+15 и осью Ох (в положительной части по оси Оу)');
Textcolor(15);
print('Введите пределы интегрирования:');
readln(a, b);
print('Количество интервалов разбиения:');
readln(n);
h := (b - a) / n;
x := a;
for var i := 0 to n do
begin
f := fun(x);
S := S + f;
x := x + h;
end;
S := S * h;
Textcolor(10);
writeln('Ответ ', S:10:3);
writeln;
Textcolor(15);
writeln('Вывести погрешность полученного результата?');
vvod := vibor(vvod);
case vvod of
1:
begin
Textcolor(6);
writeln('Погрешность = ', abs((fun1(b) - fun(a)) - S):10:3);
end;
end;
writeln;
Textcolor(15);
writeln('Начать заново?');
vvod := vibor(vvod);
case vvod of
1: predel;
0: exit();
end;
predel := 0;
end;


begin //Главное меню
ClrScr;
Textcolor(14);
Writeln('Вычисление площади фигуры, ограниченной кривой 2*x^3+x^2+(-4)*x+15 и осью Ох (в положительной части по оси Оу)');
Textcolor(15);
Writeln('Ввести пределы интегрирования в ручную?');
vvod := vibor(vvod);
case vvod of
1: predel;
end;
end.