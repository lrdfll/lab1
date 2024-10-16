uses CRT; 
 
const 
  NORM = LightGray; 
  SEL = Green; 
  K = 3; 

var 
  menu: array[1..K] of string; 
  punkt: integer; 
  ch: char; 
  x_menu, y_menu: integer; 

const 
  eps = 0.000001;

function Funct(x: Real): Real;
begin
  Funct := (power(x,3))+(-4)*x+14;
end;

function metod(a, b: Real; n: Integer): Real;
var
  h, x, sum: Real;
  i: Integer;
begin
  h := (b - a) / n;
  sum := 0;
  x := a + h / 2;
  for i := 1 to n do
  begin
    sum := sum + Funct(x);
    x := x + h;
  end;
  metod := h * sum;
end;

function error_(a, b: Real; n: Integer): Real;
var
  I1, I2: Real;
begin
  I1 := metod(a, b, n);
  I2 := metod(a, b, 2 * n);
  error_ := abs(I2 - I1) / 3;
end;

procedure punkt1; 
var
  a, b: Real;
  n: Integer;
  square: Real;
  error: Real;
begin
  ClrScr;
  TextColor(Red);
  Write('Введите нижнюю границу интегрирования: ');
  Readln(a);
  Write('Введите верхнюю границу интегрирования: ');
  Readln(b);
  Write('Введите количество прямоугольников: ');
  Readln(n);
  
  square := metod(a, b, n);
  error := error_(a, b, n);
  
  writeln('Площадь фигуры: ', square:0:6);
  writeln('Погрешность: ', error:0:6);
  
  writeln('«Нажмите Enter чтобы выйти в меню»');
  ch := readkey;
end;

procedure MenuToScr; 
var 
  i: integer; 
begin 
  ClrScr; 
  for i := 1 to K do 
  begin 
    GoToXY(x_menu, y_menu + i - 1); 
    write(menu[i]); 
  end; 
  TextColor(SEL); 
  GoToXY(x_menu, y_menu + punkt - 1); 
  write(menu[punkt]); 
  TextColor(NORM); 
end; 
 
begin 
 menu[1] := ' Найти интеграл '; 
 menu[2] := ' Выход '; 
 punkt := 1; 
 x_menu := 2; 
 y_menu := 2; 
 TextColor(NORM); 
 MenuToScr; 
 repeat 
  ch := ReadKey; 
  if ch = #0 then 
  begin 
    ch := ReadKey; 
    case ch of 
      #40: {Вниз} 
        if punkt < K then 
        begin 
          GoToXY(x_menu, y_menu + punkt - 1); 
          write(menu[punkt]); 
          punkt := punkt + 1; 
          TextColor(SEl); 
          GoToXY(x_menu, y_menu + punkt - 1); 
          write(menu[punkt]); 
          TextColor(NORM); 
        end; 
      #38: {Вверх} 
        if punkt > 1 then 
        begin 
          GoToXY(x_menu, y_menu + punkt - 1); 
          write(menu[punkt]); 
          punkt := punkt - 1; 
          TextColor(SEl); 
          GoToXY(x_menu, y_menu + punkt - 1); 
          write(menu[punkt]); 
          TextColor(NORM); 
        end; 
    end; 
  end 
  else 
  if ch = #13 then 
  begin 
    case punkt of 
      1: punkt1; 
      2: ch := #27; 
    end; 
    MenuToScr; 
  end; 
 until ch = #27;
end.