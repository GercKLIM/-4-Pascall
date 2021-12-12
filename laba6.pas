{
 Выполнено: Климов Олег ФН2-11Б
 Задача: Посчитать определенный интеграл от 1-й из 3-х выбранных функций
 4-мя методами.
}

program project1;

uses calculations;

var
  c: Char;                                 // Символ ввода
  i: Byte;                                 // Счетчик для цикла
  func: calcFunc;                          // Указатель на используемую функцию
  sArray: array[1..4, 1..2] of Double;     // Массив вычисленных сумм
  itArray: array[1..4, 1..2] of LongInt;   // Массив количества итераций

function sinWrapper(x: Double): Double;    // Функция-обертка синуса
begin
sinWrapper := sin(x);
end;

function expWrapper(x: Double): Double;    // Функция-обертка экспоненты
begin
expWrapper := exp(x);
end;

function squareWrapper(x: Double): Double; // Функция-обертка квадр. функции
begin
squareWrapper := x * x;
end;

begin
  repeat
  begin
    writeln('Пункты меню:');
    writeln('1. Ввод исходных данных');
    writeln('2. Вычисление интеграла 4 способами');
    writeln('3. Вывод таблицы с результатами');
    writeln('4. Выход');
    write('Введите номер пункта меню: ');
    readln(c);

    if (c = '1') then enterValues
    else if (c = '2') then
    begin
      writeln('  1) sin(x)');
      writeln('  2) exp(x)');
      writeln('  3) x^2');
      write('Введите номер функции: ');
      read(c);

      // В зависимости от выбранной ф-и запонимаем указатель на обертку
      case c of
      '1': func := sinWrapper;
      '2': func := expWrapper;
      '3': func := squareWrapper;
      end;

      {
       Вычисление интегралов разными методами. Для каждого кол-ва разбиений
       вызываем процедуру отдельно
      }
      rectangleMethod(func, n1, itArray[1][1], sArray[1][1]);
      rectangleMethod(func, n2, itArray[1][2], sArray[1][2]);
      trapezeMethod(func, n1, itArray[2][1], sArray[2][1]);
      trapezeMethod(func, n2, itArray[2][2], sArray[2][2]);
      parabolaMethod(func, n1, itArray[3][1], sArray[3][1]);
      parabolaMethod(func, n2, itArray[3][2], sArray[3][2]);
      bulsMethod(func, n1, itArray[4][1], sArray[4][1]);
      bulsMethod(func, n2, itArray[4][2], sArray[4][2]);

      writeln;
      readln;
    end
    else if (c = '3') then
    begin
      writeln;
      writeln('Метод               Количество                  Значение');
      writeln('                разбиений   итераций                    ');
              {Прямоугольников--******-----******------********,*******}
      for i := 1 to 4 do
      begin
        writeln('────────────────────────────────────────────────────────',
                                                           '────────────');

        // Вывод названия метода
        case i of
        1: write('Прямоугольников  ');
        2: write('Трапеций         ');
        3: write('Куб.Парабол      ');
        4: write('Уэддля           ');
        end;

        write(n1:6, '     ');

        {
         Для методов парабол и Буля проверяем кратность числа разбиений.
         В случае отсутствия кратности выводим соответствующие сообщение.
        }
        if (i = 3) and (n1 mod 2 > 0) then
        begin
           writeln('Кол-во разбиений должно быть кратно 3-м');
        end
        else if (i = 4) and (n1 mod 4 > 0) then
        begin
           writeln('Кол-во разбиений должно быть кратно 6-и');
        end
        else
        begin
            writeln(itArray[i][1]:6, '      ', sArray[i][1]:16:8);
        end;

        write('                 ' , n2:6, '     ');
        if (i = 3) and (n2 mod 3 > 0) then
        begin
           writeln('Кол-во разбиений должно быть кратно 3-м');
           writeln;
        end
        else if (i = 4) and (n2 mod 6 > 0) then
        begin
           writeln('Кол-во разбиений должно быть кратно 6-и');
           writeln;
        end
        else
        begin
            writeln(itArray[i][1]:6, '      ', sArray[i][1]:16:8);
        end;
      end;

      writeln;

    end;
  end;
  until c = '4';
end.
