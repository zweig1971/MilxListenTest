//-----------------------------
// GSI Gesellschaft für
// Schwerionenforschung mbH,
// Darmstadt, Germany
//
// Unit_Properties.pas
//
// Autor           : Zweig,Marcus
// letzte Änderung : 02.11
//-------------------------------
//
//->Unit_Properties
//  wird von der unit Unit_Main aufgerufen
//  beim dem ereigniss click auf die tabelle
//  und  bei click auf Button_plusClick
//
//->Button_OKClick
//  traegt die angaben vom user in die tabelle von
//  Unit_Main ein.  
//
//->DisEbnable
//  sperrt im kontex nicht zulaessige felder. 
//  laed je nach kontex die passenden FCT-Codes
//  Springt ggf. mit ComboBox_FCT auf vorgegebene pos. oder nullt sie
//
//-------------------------------


unit Unit_Properties;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Unit_Main, GlobaleVar, UnitMil, Menus, Mask, grids;

type
  TForm_Properties = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    ComboBox_Function: TComboBox;
    Panel2: TPanel;
    ComboBox_IFKNr: TComboBox;
    Label2: TLabel;
    Panel3: TPanel;
    Label4: TLabel;
    ComboBox_Write_Data: TComboBox;
    Label5: TLabel;
    Panel4: TPanel;
    Label7: TLabel;
    ComboBox_unit: TComboBox;
    Panel5: TPanel;
    Panel6: TPanel;
    Label8: TLabel;
    Button_OK: TButton;
    Button_ForgetIt: TButton;
    CheckBox_Active: TCheckBox;
    CheckBox_ON: TCheckBox;
    MainMenu1: TMainMenu;
    Help1: TMenuItem;
    Edit_WR_Constant: TMaskEdit;
    Panel7: TPanel;
    ComboBox_FCT: TComboBox;
    Label3: TLabel;
    MaskEdit_FCTManuell: TMaskEdit;
    Label6: TLabel;
    Label9: TLabel;
    Combo_Compare_with: TComboBox;
    MaskEdit_Time: TMaskEdit;
    Edit_Offset: TMaskEdit;
    Label10: TLabel;
    Label11: TLabel;
    Combo_IFKNr_Row: TComboBox;
    procedure Button_OKClick(Sender: TObject);
    procedure Button_ForgetItClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DisEbnable(FCTlineNr: byte; CompOn:boolean; ClearText:boolean);
    procedure ComboBox_FunctionChange(Sender: TObject);
    procedure ComboBox_Write_DataChange(Sender: TObject);
    procedure CheckBox_ONClick(Sender: TObject);
    procedure SetTabelIndex(index:integer);
    procedure FormShow(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure ComboBox_FCTChange(Sender: TObject);
    procedure MaskEdit_FCTManuellKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_WR_ConstantKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_TimeKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit_FCTManuellChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit_OffsetKeyPress(Sender: TObject; var Key: Char);
    procedure Combo_IFKNr_RowChange(Sender: TObject);

  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form_Properties: TForm_Properties;

implementation

uses Unit_Help, Unit_FCTMainClass, Unit_FCTWriteIFK;

//uses Unit1;

var GridIndex:Word;

{$R *.DFM}

procedure TForm_Properties.Button_OKClick(Sender: TObject);

begin
    GridIndex:= TabelIndex;

    Form_FunctionList.StringGrid1.Cells[AColDO,GridIndex]:= ComboBox_Function.Text;

    // Feld 'Active' in liste eintragen
    if(CheckBox_Active.Checked= true) then begin
        Form_FunctionList.StringGrid1.Cells[AColActive,GridIndex]:= TEnable
    end else Form_FunctionList.StringGrid1.Cells[AColActive,GridIndex]:= TDisable;

    // Feld 'IFK-Nr' in liste eintragen
    if(ComboBox_IFKNr.Enabled = true) then Form_FunctionList.StringGrid1.Cells[AColIFK,GridIndex]:= ComboBox_IFKNr.Text
    else Form_FunctionList.StringGrid1.Cells[AColIFK,GridIndex]:=TEmpty;

    //Feld zur IFK Nr 'ROW' in liste eintragen
    if(Combo_IFKNr_Row.Enabled = true) and (Combo_IFKNr_Row.Text <> '0') then begin
      Form_FunctionList.StringGrid1.Cells[AColIFK,GridIndex]:= TZeile+Combo_IFKNr_Row.Text;
    end;

    // Feld 'FCT' und 'Manuell' auswerten und in liste eintragen
    if(ComboBox_FCT.Enabled = true) then begin
      Form_FunctionList.StringGrid1.Cells[AColFCT,GridIndex]:= MaskEdit_FCTManuell.Text;
    end else Form_FunctionList.StringGrid1.Cells[AColFCT,GridIndex]:=TEmpty;

    // Feld 'Write Data', Constante/Zeile und offset auswerten und in liste eintragen
    if(ComboBox_Write_Data.Enabled = true) or (Edit_WR_Constant.Enabled) then begin
      if(ComboBox_Write_Data.Text = TPropCount) then Form_FunctionList.StringGrid1.Cells[AColWrData,GridIndex]:= TCounter
      else if(ComboBox_Write_Data.Text = TPropICount) then Form_FunctionList.StringGrid1.Cells[AColWrData,GridIndex]:= TiCounter
      else  begin
            if(Label5.Caption <> 'Hex') then Form_FunctionList.StringGrid1.Cells[AColWrData,GridIndex]:= TZeile+Edit_WR_Constant.Text
            else Form_FunctionList.StringGrid1.Cells[AColWrData,GridIndex]:= TManuell+Edit_WR_Constant.Text;

            if(Edit_Offset.Text <> OffsetEmpty) then
            Form_FunctionList.StringGrid1.Cells[AColWrData,GridIndex]:=Form_FunctionList.StringGrid1.Cells[AColWrData,GridIndex]+TOffset+Edit_Offset.Text;
      end;
    end else Form_FunctionList.StringGrid1.Cells[AColWrData,GridIndex]:= TEmpty;

    // Feld 'Compare with' und 'ON' auswerten und in liste eintragen
    if(Combo_Compare_with.Enabled= true) and (CheckBox_ON.Checked= true)then begin
        Form_FunctionList.StringGrid1.Cells[AColCmp,GridIndex]:= Combo_Compare_with.Text;
    end else Form_FunctionList.StringGrid1.Cells[AColCmp,GridIndex]:= TEmpty;

    // Feld 'Time' und Maßeinheit in liste eintragen
    if(MaskEdit_Time.Enabled= true) then begin
        Form_FunctionList.StringGrid1.Cells[AColWrData,GridIndex]:= TTimer + MaskEdit_Time.Text + ComboBox_Unit.Text;
    end;


    TabelIndex:= GridIndex;
    Form_Properties.Close;
end;

procedure TForm_Properties.Button_ForgetItClick(Sender: TObject);
begin
     if(Tabelindex > 0) then Tabelindex:= Tabelindex-1;
     Form_Properties.Close;
end;

procedure TForm_Properties.FormCreate(Sender: TObject);

var i              :word;

begin
     for i:=1 to 256 do Combo_Compare_with.Items.Add(IntToStr(i));
     for i:=0 to 256 do Combo_IFKNr_Row.Items.Add(IntToStr(i));

     ComboBox_Function.Items.Add(TWriteIFK);
     ComboBox_Function.Items.Add(TReadIFK);
     ComboBox_Function.Items.Add(TWriteFCT);
     ComboBox_Function.Items.Add(TWriteData);
     ComboBox_Function.Items.Add(TReadData);
     ComboBox_Function.Items.Add(TWrCmd);
     ComboBox_Function.Items.Add(TSetTimer);
     ComboBox_Function.Items.Add(TConstante);
     ComboBox_Function.ItemIndex := 0;

     ComboBox_Write_Data.Items.Add(TPropCount);
     ComboBox_Write_Data.Items.Add(TPropICount);
     //ComboBox_Write_Data.Items.Add(TPropRDDta);
     ComboBox_Write_Data.Items.Add(TPropRowNr);
     //ComboBox_Write_Data.Items.Add(TPropWRDta);
     ComboBox_Write_Data.Items.Add(TPropManuel);
     ComboBox_Write_Data.ItemIndex := 0;

     ComboBox_unit.Items.Add(TMs);
     ComboBox_unit.Items.Add(Tus);
     ComboBox_unit.ItemIndex := 0;

     ComboBox_IFKNr.Items.Clear;
     ComboBox_IFKNr.Items     := IFKOnline;
     ComboBox_IFKNr.ItemIndex := 1;

     DisEbnable(0,false, true);
end;

procedure TForm_Properties.DisEbnable(FCTlineNr:byte; CompOn:boolean; ClearText:boolean);
begin
     case ComboBox_Function.ItemIndex of
          0: begin //TWriteIFK
               ComboBox_FCT.Items.Clear;
               try
                  ComboBox_FCT.Items.LoadFromFile(Anwendungsverzeichnis +'\'+VerzDateiHelp+'\'+DateiWriteFTC);
               except
                  ComboBox_FCT.Items.Add('NA');
               end;

               ComboBox_FCT.ItemIndex := FCTlineNr;
               //CheckBox_Active.Checked    := true;
               ComboBox_IFKNr.Enabled     := true;
               Combo_IFKNr_Row.Enabled    := true;
               ComboBox_FCT.Enabled       := true;
               ComboBox_Write_Data.Enabled:= true;
               Edit_WR_Constant.Enabled   := true;
               CheckBox_ON.Checked        := false;
               Combo_Compare_with.Enabled := false;
               CheckBox_ON.Enabled        := false;
               MaskEdit_Time.Enabled      := false;
               ComboBox_unit.Enabled      := false;
               Edit_Offset.Enabled        := false;
               MaskEdit_FCTManuell.Enabled:= true;
             end;

          1: begin //TReadIFK
               ComboBox_FCT.Items.Clear;
               try
                  ComboBox_FCT.Items.LoadFromFile(Anwendungsverzeichnis +'\'+VerzDateiHelp+'\'+DateiReadFTC);
               except
                  ComboBox_FCT.Items.Add('NA');
               end;

               ComboBox_FCT.ItemIndex := FCTlineNr;

               //CheckBox_Active.Checked    := true;
               ComboBox_IFKNr.Enabled     := true;
               Combo_IFKNr_Row.Enabled    := true;
               ComboBox_FCT.Enabled       := true;
               ComboBox_Write_Data.Enabled:= false;
               Edit_WR_Constant.Enabled   := false;
               CheckBox_ON.Checked        := CompOn;
               Combo_Compare_with.Enabled := true;
               CheckBox_ON.Enabled        := true;
               MaskEdit_Time.Enabled      := false;
               ComboBox_unit.Enabled      := false;
               Edit_Offset.Enabled        := false;
               MaskEdit_FCTManuell.Enabled:= true;
             end;

          2: begin  //TWriteFCT
               ComboBox_FCT.Items.Clear;
               try
                  ComboBox_FCT.Items.LoadFromFile(Anwendungsverzeichnis +'\'+VerzDateiHelp+'\'+DateiAllFCT);
               except
                  ComboBox_FCT.Items.Add('NA');
               end;

               ComboBox_FCT.ItemIndex := FCTlineNr;

               //CheckBox_Active.Checked    := true;
               ComboBox_IFKNr.Enabled     := true;
               Combo_IFKNr_Row.Enabled    := true;
               ComboBox_FCT.Enabled       := true;
               ComboBox_Write_Data.Enabled:= false;
               Edit_WR_Constant.Enabled   := false;
               CheckBox_ON.Checked        := false;
               Combo_Compare_with.Enabled := false;
               CheckBox_ON.Enabled        := false;
               MaskEdit_Time.Enabled      := false;
               ComboBox_unit.Enabled      := false;
               Edit_Offset.Enabled        := false;
               MaskEdit_FCTManuell.Enabled:= true;
             end;

          3: begin  //TWriteData
               //CheckBox_Active.Checked    := true;
               ComboBox_IFKNr.Enabled     := true;
               Combo_IFKNr_Row.Enabled    := true;
               ComboBox_FCT.Enabled       := false;
               ComboBox_Write_Data.Enabled:= true;
               Edit_WR_Constant.Enabled   := true;
               Combo_Compare_with.Enabled := false;
               CheckBox_ON.Checked        := false;
               CheckBox_ON.Enabled        := false;
               MaskEdit_Time.Enabled      := false;
               ComboBox_unit.Enabled      := false;
               Edit_Offset.Enabled        := false;
               MaskEdit_FCTManuell.Enabled:= true;
             end;

          4: begin  //TReadData
               //CheckBox_Active.Checked    := true;
               ComboBox_IFKNr.Enabled     := false;
               Combo_IFKNr_Row.Enabled    := false;
               ComboBox_FCT.Enabled       := false;
               ComboBox_Write_Data.Enabled:= false;
               Edit_WR_Constant.Enabled   := false;
               Combo_Compare_with.Enabled := true;
               CheckBox_ON.Checked        := CompOn;
               CheckBox_ON.Enabled        := true;
               MaskEdit_Time.Enabled      := false;
               ComboBox_unit.Enabled      := false;
               Edit_Offset.Enabled        := false;
               MaskEdit_FCTManuell.Enabled:= true;
             end;

          5: begin //TWrCmd
               //CheckBox_Active.Checked    := true;
               ComboBox_IFKNr.Enabled     := false;
               Combo_IFKNr_Row.Enabled    := false;
               ComboBox_FCT.Enabled       := false;
               ComboBox_Write_Data.Enabled:= true;
               Edit_WR_Constant.Enabled   := true;
               Combo_Compare_with.Enabled := true;
               CheckBox_ON.Checked        := CompOn;
               CheckBox_ON.Enabled        := true;
               MaskEdit_Time.Enabled      := false;
               ComboBox_unit.Enabled      := false;
               Edit_Offset.Enabled        := false;
               MaskEdit_FCTManuell.Enabled:= false;
             end;


          6: begin  //TTimer
               //CheckBox_Active.Checked    := true;
               ComboBox_IFKNr.Enabled     := false;
               Combo_IFKNr_Row.Enabled    := false;
               ComboBox_FCT.Enabled       := false;
               ComboBox_Write_Data.Enabled:= false;
               Edit_WR_Constant.Enabled   := false;
               CheckBox_ON.Checked        := false;
               Combo_Compare_with.Enabled := false;
               CheckBox_ON.Enabled        := false;
               MaskEdit_Time.Enabled      := true;
               ComboBox_unit.Enabled      := true;
               Edit_Offset.Enabled        := false;
               MaskEdit_FCTManuell.Enabled:= false;
             end;

          7: begin //TConstante
               //CheckBox_Active.Checked    := true;
               //CheckBox_Active.Enabled    := false;
               ComboBox_IFKNr.Enabled     := false;
               Combo_IFKNr_Row.Enabled    := false;
               ComboBox_FCT.Enabled       := false;
               ComboBox_Write_Data.Enabled:= false;
               Edit_WR_Constant.Enabled   := true;
               CheckBox_ON.Checked        := false;
               Combo_Compare_with.Enabled := false;
               CheckBox_ON.Enabled        := false;
               MaskEdit_Time.Enabled      := false;
               ComboBox_unit.Enabled      := false;
               Edit_Offset.Enabled        := false;
               MaskEdit_FCTManuell.Enabled:= false;
               ComboBox_Write_Data.ItemIndex:= ComboBox_Write_Data.Items.IndexOf(TPropManuel);
             end;
     end;

     case ComboBox_Write_Data.ItemIndex of
          0: begin // TPropCount
               Edit_WR_Constant.Enabled:= false;
               Edit_WR_Constant.EditMask:= ManHexInput;
               if(ClearText) then Edit_WR_Constant.Text:='0000';
               Label5.Caption:= 'Hex';
             end;

          1: begin // TPropICount
               Edit_WR_Constant.Enabled:= false;
               Edit_WR_Constant.EditMask:= ManHexInput;
               if(ClearText) then Edit_WR_Constant.Text:='0000';
               Label5.Caption:= 'Hex';
             end;

          2: begin // TPropRowNr
               if(ComboBox_Write_Data.Enabled =  true) then begin
                 Edit_WR_Constant.EditMask:= ManZeilEmpty;
                 Edit_Offset.Enabled       := true;
                 Edit_Offset.EditMask      := EditOffsetInput;
                 if(ClearText) then Edit_WR_Constant.Text:='001';
                 Label5.Caption:= 'Zeile';
               end;
             end;

{          3: begin // TPropWRDta
               //Edit_WR_Constant.Enabled:=true;
               Edit_WR_Constant.EditMask:= ManZeilInput;
               if(ClearText) then Edit_WR_Constant.Text:='001';
               Label5.Caption:= 'Zeile';
             end;             }

          3: begin // TPropManuel
               if(ComboBox_Write_Data.Enabled =  true) or (ComboBox_Function.Text = TConstante)then begin
                 Edit_Offset.Enabled:=false;
                 Edit_WR_Constant.Enabled:=true;
                 Edit_WR_Constant.EditMask:= ManHexInput;
                 if(ClearText) then Edit_WR_Constant.Text:='0000';
                 Label5.Caption:= 'Hex';
               end;
             end;
      end;

      //  Feld IFK Nummer sperren oder freigeben
      if(Combo_IFKNr_Row.ItemIndex > 0) then ComboBox_IFKNr.Enabled := false;

     Form_Properties.Update;

 {    if (ComboBox_FCT.ItemIndex = 0) then MaskEdit_FCTManuell.Enabled:= true
     else MaskEdit_FCTManuell.Enabled:= false; }
end;

procedure TForm_Properties.ComboBox_FunctionChange(Sender: TObject);
begin
     DisEbnable(0,false,false);
end;

procedure TForm_Properties.ComboBox_Write_DataChange(Sender: TObject);
begin
     DisEbnable(ComboBox_FCT.ItemIndex,false,true);
 
end;

procedure TForm_Properties.CheckBox_ONClick(Sender: TObject);
begin
     If(CheckBox_ON.Checked = true) then Combo_Compare_with.Enabled:= true
     else Combo_Compare_with.Enabled:= false;
end;


procedure TForm_Properties.SetTabelIndex(index: integer);
begin
     TabelIndex:= index;
end;

procedure TForm_Properties.FormShow(Sender: TObject);

//var IndexStore:_WORD;

begin
{     //ComboBox_IFKNr.Items.IndexOf
     IndexStore:= ComboBox_IFKNr.ItemIndex;
     ComboBox_IFKNr.Items.Clear;
     ComboBox_IFKNr.Items     := IFKOnline;
     ComboBox_IFKNr.ItemIndex := IndexStore;      }
end;

procedure TForm_Properties.Help1Click(Sender: TObject);
begin
     HelpFilename:= DateiNameHelpPropertiest;
     Form_Help.Show;
end;

procedure TForm_Properties.ComboBox_FCTChange(Sender: TObject);
begin
//     if (ComboBox_FCT.ItemIndex = 0) then MaskEdit_FCTManuell.Enabled:= true
//     else MaskEdit_FCTManuell.Enabled:= false;
       MaskEdit_FCTManuell.Text:=Copy(ComboBox_FCT.Text,1,2);
end;

procedure TForm_Properties.MaskEdit_FCTManuellKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0'..'9', 'A'..'F', 'a'..'f']) then begin
     MaskEdit_FCTManuell.Text:='00';
     Key:='0';
  end;
end;

procedure TForm_Properties.Edit_WR_ConstantKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0'..'9', 'A'..'F', 'a'..'f']) then begin
     //Edit_WR_Constant.Text:='0000';
     Key:= #0;
  end;
end;

procedure TForm_Properties.Edit_TimeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0'..'9']) then begin
     Edit_WR_Constant.Text:='100';
     Key:=' ';
  end;
end;


// Gibt  der Anwender eine manuellen funktionscode ein wird dieser
// in der combobox FCT gesucht
procedure TForm_Properties.MaskEdit_FCTManuellChange(Sender: TObject);

var ValueFound:boolean;
    index     :_Word;
    TempStr   :string;

begin
     ValueFound:=false;
     index:= 0;

     // Die Liste nach dem gesuchten FCT durchsuchen
     while(not ValueFound) and (index < Form_Properties.ComboBox_FCT.Items.Count) do begin
         TempStr:= copy(Form_Properties.ComboBox_FCT.Items[index],0,2);// nur die nummer interessiert
         if(TempStr = MaskEdit_FCTManuell.Text) then begin             // vergleicht mit der manuellen eingabe
            Form_Properties.ComboBox_FCT.ItemIndex:= index;            // gefunden
            ValueFound:= true;
         end;
         index:=index+1;
     end;

     if(ValueFound=false) then Form_Properties.ComboBox_FCT.ItemIndex:= 0;
end;

procedure TForm_Properties.FormClose(Sender: TObject;
  var Action: TCloseAction);


begin
//     Form_FunctionList.StringGrid1.Selection:= TGridRect(Rect(1, 1, 1, 1));
     Form_FunctionList.MouseDown := false;
     //Form_FunctionList.ClearMessageQueue();
end;

procedure TForm_Properties.Edit_OffsetKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0'..'9', 'A'..'F', 'a'..'f']) then begin
     //Edit_WR_Constant.Text:='0000';
     Key:= #0;
  end;
end;

procedure TForm_Properties.Combo_IFKNr_RowChange(Sender: TObject);
begin
     if(Combo_IFKNr_Row.Text = '0') then ComboBox_IFKNr.Enabled:= true
     else ComboBox_IFKNr.Enabled:= false;
end;

end.
