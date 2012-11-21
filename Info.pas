//====================================
// GSI Darmstadt
// Marcus Zweig, BELAP
// Letzte Änderung : 09.2010
//
// TEST_info
// *allgemeine programm informationen
//====================================


unit Info;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,UnitMil, ExtCtrls;

type
  TForm_Info = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form_Info: TForm_Info;

implementation

{$R *.DFM}

procedure TForm_Info.Button1Click(Sender: TObject);
begin
     Form_Info.Close;
end;

end.
