//-----------------------------
// GSI Gesellschaft für
// Schwerionenforschung mbH,
// Darmstadt, Germany
//
// Unit_ChoosePCI.pas
//
// Autor           : Zweig,Marcus
// letzte Änderung : 12.09
//-------------------------------
//
//->Unit_ChoosePCI.pas
//  wird von Unit_Main im menue aufgerufen
//  sucht nach allen PCI-Milkarten im PC & gibt
//  diese zur auswahl
//
//-------------------------------


unit Unit_ChoosePCI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, UnitMil;

type
  TForm_Choose_PCI_MIL_Card = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel_PCIMILFound: TPanel;
    Panel3: TPanel;
    ComboBox_PCIMILCard: TComboBox;
    Shape1: TShape;
    Button_Allocate: TButton;
    Button_OK: TButton;
    procedure Button_OKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button_AllocateClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form_Choose_PCI_MIL_Card: TForm_Choose_PCI_MIL_Card;

implementation

{$R *.DFM}

procedure TForm_Choose_PCI_MIL_Card.Button_OKClick(Sender: TObject);
begin
     Form_Choose_PCI_Mil_Card.Close;
end;

procedure TForm_Choose_PCI_MIL_Card.FormCreate(Sender: TObject);

var FoundCards:_word;
    index:_word;


begin
     index:=0;
     ComboBox_PCIMILCard.Items.Clear;
     FoundCards:=PCI_PCIcardCount;
     Panel_PCIMILFound.Caption:= IntToStr(FoundCards);  // gefundene karten anzeigen

     // ComboBox mit vorhandenen PCI-MilKarten fuellen
     if(FoundCards > 0) then begin
       repeat
         index:=index + 1;
         ComboBox_PCIMILCard.Items.Add(IntToStr(index));
       until index = FoundCards;
       Button_Allocate.Enabled:=true;
       ComboBox_PCIMILCard.Enabled:=true;
     end else begin
       Button_Allocate.Enabled:=False;
       ComboBox_PCIMILCard.Enabled:=False;
     end;

     if(Cardauswahl <> 0) then begin
       ComboBox_PCIMILCard.Items.IndexOf(IntToStr(Cardauswahl));// Index auf die aktuelle Karte setzten
       Shape1.Brush.Color:=clLime;
     end else Shape1.Brush.Color:=clRed;
end;

procedure TForm_Choose_PCI_MIL_Card.Button_AllocateClick(Sender: TObject);

var  status:_dword;

begin
    Shape1.Brush.Color := clYellow;
    Application.ProcessMessages;

    PCI_DriverClose(Cardauswahl); //  PCI-Karte schliessen
    status:=PCI_DriverOpen(StrToInt(ComboBox_PCIMILCard.Text)); //neue karte öffnen

    if(status  <> StatusOK) then begin
      Application.MessageBox('Error to open the PCI-Mil-Card', 'Viele Fehler entstehen durch Eile', 16);
      Shape1.Brush.Color := clRed;
      Cardauswahl:=0;
    end else begin
      Shape1.Brush.Color := clLime;
      Cardauswahl:= StrToInt(ComboBox_PCIMILCard.Text);
    end;
end;

end.
