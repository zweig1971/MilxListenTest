//-----------------------------
// GSI Gesellschaft für
// Schwerionenforschung mbH,
// Darmstadt, Germany
//
// Unit_IFKOnline.pas
//
// Autor           : Zweig,Marcus
// letzte Änderung : 12.09
//-------------------------------
//
//->Unit_IFKOnline
//  such,uebernimmt und zeigt alle IFKs am bus an
//  wird ueber das menue von unit_main aufgerufen
//
//->Button_UpdateClick
//  such und zeigt alle verfuegbaren IFKs am bus an.
//  ausserdem wird die liste der verfuegbaren IFKs
//  (IFKOnline) aktualisiert die fuer alle units gueltig ist
//
//->ADDClick
//  fuegt manuell eine IFK in die liste der IFKs ein
//-------------------------------

unit Unit_IFKOnline;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, UnitMil, Menus, GlobaleVar, Mask;

type
  TForm_IFKOnline = class(TForm)
    Panel1: TPanel;
    ListBox_IFKsOnline: TListBox;
    Button_Update: TButton;
    Label1: TLabel;
    Panel_IFKOnline: TPanel;
    Button_Close: TButton;
    MainMenu1: TMainMenu;
    Help1: TMenuItem;
    StaticText1: TStaticText;
    ADD: TButton;
    MaskEdit_AddManIFK: TMaskEdit;
    procedure Button_CloseClick(Sender: TObject);
    procedure Button_UpdateClick(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure ADDClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MaskEdit_AddManIFKKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
   private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form_IFKOnline: TForm_IFKOnline;

implementation

uses Unit_IFKsearch, Unit_Help;

{$R *.DFM}

procedure TForm_IFKOnline.Button_CloseClick(Sender: TObject);
begin
    Form_IFKOnline.Close;
end;

procedure TForm_IFKOnline.Button_UpdateClick(Sender: TObject);

begin

    Form_IFKOnline.ListBox_IFKsOnline.Clear;
    IFKOnline.Clear;

    // IFKs suchen & anzeigen
    IFKFound(IFKOnline, IFKaktive);
    Form_IFKOnline.ListBox_IFKsOnline.Items:= IFKOnline;
    Form_IFKOnline.Panel_IFKOnline.Caption := IntToStr(IFKaktive);
 end;

procedure TForm_IFKOnline.Help1Click(Sender: TObject);
begin
     HelpFilename:= DateiNameHelpIFKOnline;
     Form_Help.Show;
end;

procedure TForm_IFKOnline.ADDClick(Sender: TObject);

var TextWord: WORD;
    ErrorFound: bool;

begin
{    if(MaskEdit_AddManIFK.Text[1] = '0') then
    begin
      MaskEdit_AddManIFK.Text:= MaskEdit_AddManIFK.Text[2];
    end;   }

    if(length(MaskEdit_AddManIFK.Text) <= 2) then
    begin
         Form_IFKOnline.ListBox_IFKsOnline.Items.Add(UpperCase(MaskEdit_AddManIFK.Text));
         IFKOnline.Add(UpperCase(MaskEdit_AddManIFK.Text));
         //IFKOnline.Add(IntToStr(MaskEdit_AddManIFK.Text));
         IFKaktive:= StrToInt(Form_IFKOnline.Panel_IFKOnline.Caption);
         IFKaktive:=IFKaktive + 1;
         Form_IFKOnline.Panel_IFKOnline.Caption:= IntToStr(IFKaktive);
    end else Application.messagebox('max two characters in hex','evil..evil..',48);
end;

procedure TForm_IFKOnline.FormShow(Sender: TObject);
begin
    Form_IFKOnline.ListBox_IFKsOnline.Items:= IFKOnline;
    Form_IFKOnline.Panel_IFKOnline.Caption := IntToStr(IFKaktive);
end;

procedure TForm_IFKOnline.MaskEdit_AddManIFKKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0'..'9', 'A'..'F', 'a'..'f']) then begin
     //MaskEdit_AddManIFK.Text:='';
     Key:=#0;
  end; 
end;

procedure TForm_IFKOnline.FormCreate(Sender: TObject);
begin
//    MaskEdit_AddManIFK.EditMask:= MasEdit_AddManIFK_Mask;
end;

end.
