unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Calendar, EditBtn;

type

  { Основная форма приложения }
  TfMain = class(TForm)
    LClock: TLabel;     // Метка для отображения времени
    Timer1: TTimer;     // Таймер для обновления времени и анимации
    procedure FormKeyPress(Sender: TObject; var Key: char); // Обработчик нажатия клавиш
    procedure Timer1Timer(Sender: TObject); // Обработчик события таймера
  private

  public

  end;

var
  fMain: TfMain;

implementation

{$R *.lfm}

{ TfMain }

// Обработчик события таймера
procedure TfMain.Timer1Timer(Sender: TObject);
var
  i: byte;
begin
  LClock.caption := TimeToStr(Now); // Обновляем текст метки времени
  i := Random(4); // Генерируем случайное число от 0 до 3
  case i of
    0: LClock.Left := LClock.Left + 50; // Смещение метки вправо
    1: LClock.Left := LClock.Left - 50; // Смещение метки влево
    2: LClock.Top := LClock.Top + 50;   // Смещение метки вниз
    3: LClock.Top := LClock.Top - 50;   // Смещение метки вверх
  end;
  // Проверяем, чтобы метка не вышла за границы формы
  if LClock.Left < 0 then
    LClock.Left := 0;
  if LClock.Top < 0 then
    LClock.Top := 0;
  if (LClock.Left + LClock.Width) > fMain.Width then
    LClock.Left := fMain.Width - LClock.Width;
  if (LClock.Top + LClock.Height) > fMain.Height then
    LClock.Top := fMain.Height - LClock.Height;
end;

// Обработчик нажатия клавиш
procedure TfMain.FormKeyPress(Sender: TObject; var Key: char);
begin
  // Если нажата клавиша Esc, закрываем приложение
  if Key = #27 then
    Close;
end;

end.

