unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  // Определяем класс формы
  TForm1 = class(TForm)
    Button1: TButton;       // Кнопка "Применить"
    CheckBox1: TCheckBox;   // Флажок
    Edit1: TEdit;           // Поле для ввода текста
    Label1: TLabel;         // Метка для надписи
    procedure Button1Click(Sender: TObject); // Обработчик клика по кнопке
    procedure Edit1Change(Sender: TObject);  // Обработчик изменения текста в Edit
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction); // Обработчик закрытия формы
    procedure FormCreate(Sender: TObject); // Обработчик создания формы
  private

  public

  end;

type
  // Описание записи для хранения параметров формы
  myForm = record
    Left: integer;       // Левая граница формы
    Top: integer;        // Верхняя граница формы
    Height: integer;     // Высота формы
    Width: integer;      // Ширина формы
    Caption: string[100];// Заголовок формы
    Checked: boolean;    // Состояние флажка
    wsMax: boolean;      // Развернуто ли окно
  end;

var
  Form1: TForm1; // Экземпляр формы
  MyF: myForm;   // Переменная записи для хранения параметров формы

implementation

{$R *.lfm}

{ TForm1 }

// Обработчик изменения текста в Edit1 (пустой)
procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

// Обработчик закрытия формы
procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
  f: file of myForm; // Типизированный файл для сохранения данных
begin
  // Если окно не развернуто, сохраняем параметры размера и положения
  if not (Form1.WindowState = wsMaximized) then begin
    MyF.Left := Form1.Left;
    MyF.Top := Form1.Top;
    MyF.Height := Form1.Height;
    MyF.Width := Form1.Width;
    MyF.wsMax := False;
  end else
    MyF.wsMax := True;

  // Сохраняем остальные параметры
  MyF.Caption := Form1.Caption;
  MyF.Checked := CheckBox1.Checked;

  // Создаем или перезаписываем файл настроек
  try
    AssignFile(f, 'MyProg.dat'); // Ассоциируем файл с переменной
    Rewrite(f);                  // Создаем новый файл или перезаписываем существующий
    Write(f, MyF);               // Записываем данные из записи в файл
  finally
    CloseFile(f);                // Закрываем файл
  end;
end;

// Обработчик клика по кнопке
procedure TForm1.Button1Click(Sender: TObject);
begin
  // Если текстовое поле не пустое, изменяем заголовок формы
  if Edit1.Text <> '' then
    Form1.Caption := Edit1.Text;
end;

// Обработчик создания формы
procedure TForm1.FormCreate(Sender: TObject);
var
  f: file of myForm; // Типизированный файл для чтения данных
begin
  // Если файл настроек не существует, выходим
  if not FileExists('MyProg.dat') then exit;

  // Иначе открываем файл и считываем из него настройки
  try
    AssignFile(f, 'MyProg.dat'); // Ассоциируем файл с переменной
    Reset(f);                    // Открываем файл для чтения
    Read(f, MyF);                // Считываем данные в переменную типа запись
  finally
    CloseFile(f);                // Закрываем файл
  end;

  // Применяем настройки к форме
  if MyF.wsMax then
    Form1.WindowState := wsMaximized
  else begin
    Form1.Left := MyF.Left;
    Form1.Top := MyF.Top;
    Form1.Height := MyF.Height;
    Form1.Width := MyF.Width;
  end;

  // Применяем остальные параметры
  Form1.Caption := MyF.Caption;
  CheckBox1.Checked := MyF.Checked;
end;

end.

