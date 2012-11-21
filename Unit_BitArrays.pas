//-----------------------------
// GSI Gesellschaft für
// Schwerionenforschung mbH,
// Darmstadt, Germany
//
// Unit_BitArrays.pas
//
// Autor           : Zweig,Marcus
// letzte Änderung : 01.10
//-------------------------------
//
//->Unit_BitArrays;
//  wird von der unit Unit_Main uber das menue aufgerufen
//  wandelt die gelesenden werte in bin. um und stellt diese da.
//
//->Button_updateClick
//  wertet aus von welcher zeile in der tabelle in unit_main
//  der wert bin.  dargestellt werden soll
//  schreibt dieses und in welchen panel  es dargestellt werden
//  soll ueber das record TConvertAndShow an 
//
//->ConvertShow
//  wird von Button_updateClick aufgerufen. Es convertiert den
//  dez.wert in einen bin.wert um und gibt diesen auf die 
//  entsprechnen panels aus. Die kommunikation findet ueber das
//  record TConvertAndShow statt
//
//-------------------------------

unit Unit_BitArrays;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls ,UnitMil, GlobaleVar, Menus;

type

  TConvertAndShow = record
                    Value     :_WORD;
                    BitArray1 :TPanel;
                    BitArray2 :TPanel;
                    BitArray3 :TPanel;
                    BitArray4 :TPanel;
                    end;

  TForm_BitArrays = class(TForm)
    Panel1: TPanel;
    Button_close: TButton;
    Panel2: TPanel;
    Panel1_BitArray1: TPanel;
    Panel1_BitArray2: TPanel;
    Panel1_BitArray3: TPanel;
    Panel1_BitArray4: TPanel;
    ComboBox_LineNr1: TComboBox;
    Label1: TLabel;
    Panel7: TPanel;
    Label2: TLabel;
    Panel2_BitArray1: TPanel;
    Panel2_BitArray2: TPanel;
    Panel2_BitArray3: TPanel;
    Panel2_BitArray4: TPanel;
    ComboBox_LineNr2: TComboBox;
    Panel12: TPanel;
    Label3: TLabel;
    Panel3_BitArray1: TPanel;
    Panel3_BitArray2: TPanel;
    Panel3_BitArray3: TPanel;
    Panel3_BitArray4: TPanel;
    ComboBox_LineNr3: TComboBox;
    Panel17: TPanel;
    Label4: TLabel;
    Panel4_BitArray1: TPanel;
    Panel4_BitArray2: TPanel;
    Panel4_BitArray3: TPanel;
    Panel4_BitArray4: TPanel;
    ComboBox_LineNr4: TComboBox;
    Button_update: TButton;
    CheckBox_AutoUpdate: TCheckBox;
    StaticText13: TStaticText;
    StaticText14: TStaticText;
    StaticText15: TStaticText;
    StaticText16: TStaticText;
    MainMenu1: TMainMenu;
    Help1: TMenuItem;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    procedure Button_closeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox_AutoUpdateClick(Sender: TObject);
    procedure Button_updateClick(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure ConvertShow(Convert: TConvertAndShow);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;


var
  Form_BitArrays: TForm_BitArrays;

implementation

uses Unit_Main, Unit_Help;

{$R *.DFM}

procedure TForm_BitArrays.Button_closeClick(Sender: TObject);
begin
     CheckBox_AutoUpdate.Checked:= False;
     Form_BitArrays.Close;
end;

procedure TForm_BitArrays.FormCreate(Sender: TObject);

var i:_WORD;

begin
     ComboBox_LineNr1.Items.Clear;
     ComboBox_LineNr2.Items.Clear;
     ComboBox_LineNr3.Items.Clear;
     ComboBox_LineNr4.Items.Clear;

     ComboBox_LineNr1.Items.Add(TDisable);
     ComboBox_LineNr2.Items.Add(TDisable);
     ComboBox_LineNr3.Items.Add(TDisable);
     ComboBox_LineNr4.Items.Add(TDisable);

     for i:= 1 to 256 do begin
         ComboBox_LineNr1.Items.Add(IntToStr(i));
         ComboBox_LineNr2.Items.Add(IntToStr(i));
         ComboBox_LineNr3.Items.Add(IntToStr(i));
         ComboBox_LineNr4.Items.Add(IntToStr(i));
     end;

     ComboBox_LineNr1.ItemIndex := 0;
     ComboBox_LineNr2.ItemIndex := 0;
     ComboBox_LineNr3.ItemIndex := 0;
     ComboBox_LineNr4.ItemIndex := 0;

end;

procedure TForm_BitArrays.CheckBox_AutoUpdateClick(Sender: TObject);
begin
     if(CheckBox_AutoUpdate.Checked = true) then Button_update.Enabled:= false
     else Button_update.Enabled:= true;
end;

procedure TForm_BitArrays.Button_updateClick(Sender: TObject);

var Convert  :TConvertAndShow;
    LineNr   :_WORD;

begin
     if (ComboBox_LineNr1.Text <> TDisable) then begin
        LineNr:= StrToInt (ComboBox_LineNr1.Text);//  Von welcher zeile soll gelesen werden

//        Convert.ValueStr := Copy(Form_FunctionList.StringGrid1.Cells[5,LineNr],3, 6);
        Convert.Value    := DataValueArray[LineNr];
        Convert.BitArray1:= Panel1_BitArray1;
        Convert.BitArray2:= Panel1_BitArray2;
        Convert.BitArray3:= Panel1_BitArray3;
        Convert.BitArray4:= Panel1_BitArray4;

        ConvertShow(Convert);
     end;

     if (ComboBox_LineNr2.Text <> TDisable) then begin
        LineNr:= StrToInt (ComboBox_LineNr2.Text);//  Von welcher zeile soll gelesen werden

        Convert.Value    := DataValueArray[LineNr];
        Convert.BitArray1:= Panel2_BitArray1;
        Convert.BitArray2:= Panel2_BitArray2;
        Convert.BitArray3:= Panel2_BitArray3;
        Convert.BitArray4:= Panel2_BitArray4;

        ConvertShow(Convert);
     end;

     if (ComboBox_LineNr3.Text <> TDisable) then begin
        LineNr:= StrToInt (ComboBox_LineNr3.Text);//  Von welcher zeile soll gelesen werden

        Convert.Value    := DataValueArray[LineNr];
        Convert.BitArray1:= Panel3_BitArray1;
        Convert.BitArray2:= Panel3_BitArray2;
        Convert.BitArray3:= Panel3_BitArray3;
        Convert.BitArray4:= Panel3_BitArray4;

        ConvertShow(Convert);
    end;

    if (ComboBox_LineNr4.Text <> TDisable) then begin
        LineNr:= StrToInt (ComboBox_LineNr4.Text);//  Von welcher zeile soll gelesen werden

        Convert.Value    := DataValueArray[LineNr];
        Convert.BitArray1:= Panel4_BitArray1;
        Convert.BitArray2:= Panel4_BitArray2;
        Convert.BitArray3:= Panel4_BitArray3;
        Convert.BitArray4:= Panel4_BitArray4;

        ConvertShow(Convert);
     end;
     Form_BitArrays.Update;
     Application.ProcessMessages();
end;


procedure TForm_BitArrays.Help1Click(Sender: TObject);
begin
     HelpFilename:= DateiNameHelpBitArrays;
     Form_Help.Show;
end;

procedure TForm_BitArrays.ConvertShow(Convert: TConvertAndShow);

var ValureBit :string;
    ErrorFound:boolean;

begin
     ErrorFound:=  false;

{     try
       ValureWord:= StrToInt ('$'+Convert.ValueStr);
     except
       Convert.BitArray4.Caption:= TErr;
       Convert.BitArray3.Caption:= TErr;
       Convert.BitArray2.Caption:= TErr;
       Convert.BitArray1.Caption:= TErr;
       ErrorFound:=true;
     end;   }

     if(ErrorFound = false) then begin
        ValureBit:= intToBinary(Convert.Value, 16);
        Convert.BitArray4.Caption:= Copy (ValureBit, 1, 4);
        Convert.BitArray3.Caption:= Copy (ValureBit, 5, 4);
        Convert.BitArray2.Caption:= Copy (ValureBit, 9, 4);
        Convert.BitArray1.Caption:= Copy (ValureBit, 13,4);
     end;
end;

end.
