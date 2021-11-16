program laba4;
//https://labs-org.ru/abc-5/
//https://pascalabcnet.github.io/progr_arrays.html

var 
  choice, m, n, l:byte;
  Arr: array of array of integer;
  Vec, Xmin: array of integer;
  


//Процедура ввода массива
procedure FILL_ARR;
var
  i, j:byte;
begin
  write('Введите кол-во столбцов: ');
  readln(m);
  write('Введите кол-во строчек: ');
  readln(n);
  writeln('Вводите элементы матрицы:');
  setLength(Arr, m); //Задаем длину массива
  for i := 0 to m - 1 do setLength(Arr[i], n);
  
  
  // Вводим n элементов массива
  for i := 0 to m-1 do
    for j := 0 to n-1 do
        read(Arr[i, j]); 
  
end;  




//Процедура вывода массива
procedure PRINT_ARR;
var i, j: byte;
begin
  for i := 0 to m-1 do begin
    for j := 0 to n-1 do
      print((Arr[i, j]));
    writeln();
    end;
end;

//Функция ищущая минимальный элемент массива
function Min_Elem(const v: array of Integer): Integer;
begin
  Result:=v[Low(v)]; for var i:=Low(v)+1 to High(v) do if Result>v[i] then Result:=v[i];
end;
 



//Процедура, которая сохраняет в Xmin минимальные элементы строк матрицы Arr заданных в векторе
procedure MIN_ELEM_ARR;

begin
  setLength(Xmin, l);
  for var i := 0 to l-1 do
      Xmin[i] := Min_Elem(Arr[Vec[i]-1]);
end;

//Процедура заполнения целочисленного вектора
procedure FILL_VEC;

begin
  write('Введите длину вектора: ');
  readln(l);
  SetLength(Vec, l);
  write('');
  write('Вводите массив: ');
  for var i := 0 to l-1 do read(Vec[i]);
end;


//Процедура вывода целочисленного вектора
procedure PRINT_VEC;

begin
  for var i:=0 to l-1 do print(Vec[i]);
end;



//функция вычисляющая среднегеометрическое массива Xmin
function SRGEOM_XMIN(const A:Array of integer):real;
var S:integer;
begin
  S := 1;
  for var i := 0 to l-1 do S := S * Xmin[i];
  result := sqrt(S);
end;






begin 
  repeat
  writeln('1.Создать и заполнить матрицу');
  writeln('2.Распечатать текущую матрицу');
  writeln('3.Создать и заполнить вектор');
  writeln('4.Распечатать вектор');
  writeln('5.Вычислить минимальные элементы строк матрицы по строкам указанных в векторе и дообавить их в Xmin');
  writeln('6.Распечатать Xmin');
  writeln('7. Вычислить среднегеометрическое Xmin');
  write('Введите номер задачи ');
  read(choice);
  if choice = 1 then FILL_ARR;
  if choice = 2 then PRINT_ARR;
  if choice = 3 then FILL_VEC;
  if choice = 4 then PRINT_VEC;
  if choice = 5 then MIN_ELEM_ARR;
  if choice = 6 then begin
    var A := Vec;
    Vec := Xmin;
    PRINT_VEC;
    Vec := A;
  writeln();
  end;
  if choice = 7 then writeln(SRGEOM_XMIN(XMIN));
   
  until false;
  
end.