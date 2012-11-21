//-----------------------------
// GSI Gesellschaft für
// Schwerionenforschung mbH,
// Darmstadt, Germany
//
// Unit_Help.pas
//
// Autor           : Zweig,Marcus
// letzte Änderung : 12.09
//-------------------------------


unit Unit_Help;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, GlobaleVar;

type
  TForm_Help = class(TForm)
    Panel1: TPanel;
    Button_Close: TButton;
    ListBox_Help: TListBox;
    procedure Button_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form_Help: TForm_Help;
  HelpFilename:string;

implementation

{$R *.DFM}

procedure TForm_Help.Button_CloseClick(Sender: TObject);
begin
     Form_Help.Close;
end;

procedure TForm_Help.FormShow(Sender: TObject);
begin
     ListBox_Help.Items.Clear;
     try
       ListBox_Help.Items.LoadFromFile(Anwendungsverzeichnis +'\'+VerzDateiHelp+'\'+HelpFilename);
     except
       ListBox_Help.Items.Add('ERROR NO HELP FILE FOUND....');
     end;
end;
end.
