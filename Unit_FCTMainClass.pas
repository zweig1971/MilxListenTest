unit Unit_FCTMainClass;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, GlobaleVar, Unit_Properties;


type
  FctMainClass = class

 private
    procedure SetAct(Active:boolean);
    procedure SetIFKNr(IFKNr:string);
    function  SetFctCode(FCT:string):boolean;
    procedure SetManuelFct(value:string);
    procedure SetWriteData(WriteDtaStr:string);
    procedure SetWrConst(value:string);
    procedure SetOffset(value:string);
    procedure SetCompare(RowNr:string);
    procedure SetCompareOn(CompOn:boolean);
    procedure SetTime(value:string);
    procedure TimeUnit(TUnit:string);

 public
    procedure SetPropRecEmpty(var Properties:TProperties);
    procedure SetFieldsData(Properties:TProperties);
    procedure SetFieldFct();virtual;abstract;
    procedure SetFieldDataDef();virtual;abstract;
    procedure GetFieldsData(var Properties:TProperties);virtual;abstract;
  end;

implementation

procedure FctMainClass.SetAct(Active:boolean);
begin
     if Active then Form_Properties.CheckBox_Active.Checked := true
     else Form_Properties.CheckBox_Active.Checked := false;
end;

procedure FctMainClass.SetIFKNr(IFKNr:string);
begin
     Form_Properties.ComboBox_IFKNr.ItemIndex:= Form_Properties.ComboBox_IFKNr.Items.IndexOf(IFKNr);
end;

function FctMainClass.SetFctCode (FCT:string):boolean;

var ValueFound:boolean;
    index:integer;
    TempStr:string;

begin
     ValueFound:=false;
     index:=0;

     while(not ValueFound) and (index < Form_Properties.ComboBox_FCT.Items.Count) do begin
       TempStr:= copy(Form_Properties.ComboBox_FCT.Items[index],0,2);
       if(TempStr = FCT) then begin
         ValueFound:= true;
         Form_Properties.ComboBox_FCT.ItemIndex:=index;
       end;
     index:=index+1;
     end;

     if ValueFound then SetFctCode:=true
     else SetFctCode:=false;
end;

procedure FctMainClass.SetManuelFct(value:string);
begin
     Form_Properties.MaskEdit_FCTManuell.Text:= value;
end;

procedure FctMainClass.SetWriteData(WriteDtaStr:string);
begin
     Form_Properties.ComboBox_Write_Data.Items.IndexOf(WriteDtaStr);
end;

procedure FctMainClass.SetWrConst(value:string);
begin
    Form_Properties.Edit_WR_Constant.Text:= value;
end;

procedure FctMainClass.SetOffset(value:string);
begin
    Form_Properties.Edit_Offset.Text:= value;
end;

procedure FctMainClass.SetCompare(RowNr:string);
begin
     Form_Properties.Combo_Compare_with.Items.IndexOf(RowNr);
end;

procedure FctMainClass.SetCompareOn(CompOn:boolean);
begin
     if CompOn then Form_Properties.CheckBox_ON.Checked:= true
     else Form_Properties.CheckBox_ON.Checked:= false;
end;

procedure FctMainClass.SetTime(value:string);
begin
     Form_Properties.MaskEdit_Time.Text:= value;
end;

procedure FctMainClass.TimeUnit(TUnit:string);
begin
     Form_Properties.ComboBox_unit.Items.IndexOf(TUnit);
end;

procedure FctMainClass.SetFieldsData(Properties:TProperties);
begin
     SetAct(Properties.ActiveBool);

     SetIFKNr(Properties.IFKNrStr);

     if not SetFctCode(Properties.FCTCodeStr) then
      SetManuelFct(Properties.FCTCodeStr) else SetManuelFct(FCTManEmpty);

     SetWriteData(Properties.WriteDtaStr);

     SetWrConst(Properties.WrConstRowStr);

     SetOffset(Properties.OffsetStr);

     SetCompare(Properties.CompRowStr);

     SetCompareOn(Properties.CompOnBool);

     SetTime(Properties.TimeStr);

     TimeUnit(Properties.UnitStr);
end;

procedure FctMainClass.SetPropRecEmpty(var Properties:TProperties);
begin
    Properties.ActiveBool   := true;
    Properties.IFKNrStr     := PropEmpty;
    Properties.FCTCodeStr   := PropEmpty;
    Properties.ManuelFctStr := PropEmpty;
    Properties.WriteDtaStr  := PropEmpty;
    Properties.WrConstRowStr:= PropEmpty;
    Properties.OffsetStr    := PropEmpty;
    Properties.CompRowStr   := PropEmpty;
    Properties.CompOnBool   := false;
    Properties.TimeStr      := PropEmpty;
    Properties.UnitStr      := PropEmpty;
end;


end.
