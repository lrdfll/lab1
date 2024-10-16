unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Calendar, EditBtn;

type

  { TfMain }

  TfMain = class(TForm)
    LClock: TLabel;
    Timer1: TTimer;
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  fMain: TfMain;

implementation

{$R *.lfm}



{ TfMain }

procedure TfMain.Timer1Timer(Sender: TObject);
var
  i:byte;
begin
  LClock.caption:=TimeToStr(Now);
  i:=Random(4);
  case i of
  0:LClock.Left:=LClock.Left+50;
  1:LClock.Left:=LClock.Left-50;
  2:LClock.Top:=LClock.Top+50;
  3:LClock.Top:=LClock.Top-50;
  end;
  if lClock.Left < 0 then lClock.Left:= 0;
  if lClock.Top < 0 then lClock.Top:= 0;
  if (lClock.Left + lClock.Width) > fMain.Width then
  lClock.Left:= fMain.Width - lClock.Width;
  if (lClock.Top + lClock.Height) > fMain.Height then
  lClock.Top:= fMain.Height - lClock.Height;
end;

procedure TfMain.FormKeyPress(Sender: TObject; var Key: char);
begin
  //если нажали Esc, то выходим:
  if Key = #27 then Close;
end;





end.

