//-----------------------------
// GSI Gesellschaft für
// Schwerionenforschung mbH,
// Darmstadt, Germany
//
// Unit_BitDescrip.pas
//
// Autor           : Zweig,Marcus
// letzte Änderung : 01.10
//-------------------------------

unit Unit_BitDescrip;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, ExtCtrls, StdCtrls;

type
  TForm_BitDescription = class(TForm)
    Panel1: TPanel;
    SG_BitDescription: TStringGrid;
    Button_Close: TButton;
    Label1: TLabel;
    ComboBox_LineNr1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Button_CloseClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form_BitDescription: TForm_BitDescription;

implementation

{$R *.DFM}

procedure TForm_BitDescription.FormCreate(Sender: TObject);

var i:word;

begin
     SG_BitDescription.ColWidths[0]:= 40;
     SG_BitDescription.ColWidths[1]:= 40;
     SG_BitDescription.ColWidths[2]:= 120;

     SG_BitDescription.Cells[0,0]:= 'Nr';
     SG_BitDescription.Cells[1,0]:= 'Bit';
     SG_BitDescription.Cells[2,0]:= 'Description';

     for i:=1 to SG_BitDescription.RowCount-1 do SG_BitDescription.Cells[0,i]:= IntToStr(i-1);
end;

procedure TForm_BitDescription.Button_CloseClick(Sender: TObject);
begin
     Form_BitDescription.Close;
end;

end.
