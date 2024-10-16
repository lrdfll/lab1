unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    But1: TButton;
    But10: TButton;
    But11: TButton;
    But12: TButton;
    But13: TButton;
    But14: TButton;
    But15: TButton;
    But16: TButton;
    But17: TButton;
    But18: TButton;
    But19: TButton;
    But2: TButton;
    But20: TButton;
    But21: TButton;
    But22: TButton;
    But3: TButton;
    But4: TButton;
    But5: TButton;
    But6: TButton;
    But7: TButton;
    But8: TButton;
    But9: TButton;
    Edit1: TEdit;
    procedure But16Click(Sender: TObject);
    procedure But17Click(Sender: TObject);
    procedure But18Click(Sender: TObject);
    procedure But19Click(Sender: TObject);
    procedure But20Click(Sender: TObject);
    procedure But21Click(Sender: TObject);
    procedure But22Click(Sender: TObject);
    procedure ClickBut(Sender: TObject);
    procedure ClickZnak(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  a, b, c : Real;
  Znak : String;

implementation

{$R *.lfm}

{ TForm1 }

// Обрабатывает нажатие кнопок с операциями (+, -, *, /)
procedure TForm1.ClickZnak(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    MessageDlg('Ошибка', 'Введите число перед операцией!', mtError, [mbOK], 0);
    Exit;
  end;

  try
    a := StrToFloat(Edit1.Text); // Сохраняем текущее значение из Edit1 в переменную a
  except
    on E: EConvertError do
    begin
      MessageDlg('Ошибка', 'Ошибка: некорректное число!', mtError, [mbOK], 0);
      Exit;
    end;
  end;

  Edit1.Clear; // Очищаем Edit1
  Znak := (Sender as TButton).Caption; // Сохраняем нажатую операцию (+, -, *, /)
end;

// Выполняется при создании формы
procedure TForm1.FormCreate(Sender: TObject);
begin
  BorderIcons := BorderIcons - [biMaximize, biMinimize]; // Отключаем кнопки максимизации и минимизации
end;

// Обрабатывает нажатие кнопок с цифрами
procedure TForm1.ClickBut(Sender: TObject);
begin
  Edit1.Text := Edit1.Text + (Sender as TButton).Caption; // Добавляем нажатую цифру в Edit1
end;

// Удаляет последний символ в Edit1
procedure TForm1.But22Click(Sender: TObject);
var
  str: String;
begin
  str := Edit1.Text;
  if str <> '' then
    Delete(str, Length(str), 1); // Удаляем последний символ
  Edit1.Text := str;
end;

// Очищает Edit1
procedure TForm1.But21Click(Sender: TObject);
begin
  Edit1.Clear; // Очищаем Edit1
end;

// Выполняет арифметические операции
procedure TForm1.But16Click(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    MessageDlg('Ошибка', 'Введите число для выполнения операции!', mtError, [mbOK], 0);
    Exit;
  end;

  try
    b := StrToFloat(Edit1.Text); // Сохраняем второе значение из Edit1 в переменную b
  except
    on E: EConvertError do
    begin
      MessageDlg('Ошибка', 'Ошибка: некорректное число!', mtError, [mbOK], 0); // Показать сообщение об ошибке
      Exit;
    end;
  end;

  Edit1.Clear; // Очищаем Edit1

  case Znak of
    '+': c := a + b;
    '-': c := a - b;
    '*': c := a * b;
    '/':
      if b <> 0 then
        c := a / b
      else
      begin
        MessageDlg('Ошибка', 'Ошибка: деление на ноль!', mtError, [mbOK], 0); // Показать сообщение об ошибке
        Exit;
      end;
  end;

  Edit1.Text := FloatToStr(c); // Показываем результат в Edit1
end;

// Вычисляет обратное значение числа
procedure TForm1.But17Click(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    MessageDlg('Ошибка', 'Введите число для вычисления обратного значения!', mtError, [mbOK], 0);
    Exit;
  end;

  try
    a := StrToFloat(Edit1.Text);
  except
    on E: EConvertError do
    begin
      MessageDlg('Ошибка', 'Ошибка: некорректное число!', mtError, [mbOK], 0); // Показать сообщение об ошибке
      Exit;
    end;
  end;

  if a <> 0 then
  begin
    a := 1 / a; // Вычисляем обратное значение
    Edit1.Text := FloatToStr(a);
  end
  else
  begin
    MessageDlg('Ошибка', 'Ошибка: деление на ноль', mtError, [mbOK], 0); // Показать сообщение об ошибке
    Edit1.Clear;
  end;
end;

// Возводит число в квадрат
procedure TForm1.But18Click(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    MessageDlg('Ошибка', 'Введите число для возведения в квадрат!', mtError, [mbOK], 0);
    Exit;
  end;

  try
    a := StrToFloat(Edit1.Text);
  except
    on E: EConvertError do
    begin
      MessageDlg('Ошибка', 'Ошибка: некорректное число!', mtError, [mbOK], 0); // Показать сообщение об ошибке
      Exit;
    end;
  end;

  a := sqr(a); // Возводим число в квадрат
  Edit1.Text := FloatToStr(a);
  a := 0;
end;

// Вычисляет квадратный корень числа
procedure TForm1.But19Click(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    MessageDlg('Ошибка', 'Введите число для вычисления квадратного корня!', mtError, [mbOK], 0);
    Exit;
  end;

  try
    a := StrToFloat(Edit1.Text);
  except
    on E: EConvertError do
    begin
      MessageDlg('Ошибка', 'Ошибка: некорректное число!', mtError, [mbOK], 0); // Показать сообщение об ошибке
      Exit;
    end;
  end;

  a := sqrt(a); // Вычисляем квадратный корень
  Edit1.Text := FloatToStr(a);
  a := 0;
end;

// Сбрасывает все значения
procedure TForm1.But20Click(Sender: TObject);
begin
  Edit1.Clear;
  a := 0;
  b := 0;
  c := 0;
  Znak := '';
end;

end.

