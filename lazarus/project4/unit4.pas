unit unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var a,b,h,y,x: real;
begin
a:= strtofloat(Edit1.text);
b:= strtofloat(Edit2.text);
h:= strtofloat(Edit3.Text);
  while a <= b do
        begin
        y:= sqr(a);
        Memo1.Lines.add(floattostr(y));
        a:= a + h;
end;

end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin

end;

end.

