unit Unit_FCTWriteIFK;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, GlobaleVar, Unit_Properties,Unit_FCTMainClass;

type
  TFCTWriteIFK = class (FctMainClass)

  public
    procedure SetFieldFct();override;
    procedure SetFieldDataDef();override;
    procedure GetFieldsData(var Properties:TProperties);override;
  end;

implementation

procedure TFCTWriteIFK.SetFieldFct();
begin
     Form_Properties.ComboBox_FCT.Items.Clear;
     Form_Properties.ComboBox_FCT.Items.LoadFromFile(Anwendungsverzeichnis +'\'+VerzDateiHelp+'\'+DateiWriteFTC);

     Form_Properties.ComboBox_FCT.ItemIndex := ComBoxFCTDef;
     //CheckBox_Active.Checked    := true;
     Form_Properties.ComboBox_IFKNr.Enabled     := true;
     Form_Properties.ComboBox_FCT.Enabled       := true;
     Form_Properties.ComboBox_Write_Data.Enabled:= true;
     Form_Properties.Edit_WR_Constant.Enabled   := true;
     Form_Properties.CheckBox_ON.Checked        := false;
     Form_Properties.Combo_Compare_with.Enabled := false;
     Form_Properties.CheckBox_ON.Enabled        := false;
     Form_Properties.MaskEdit_Time.Enabled      := false;
     Form_Properties.ComboBox_unit.Enabled      := false;
     Form_Properties.Edit_Offset.Enabled        := false;
     Form_Properties.MaskEdit_FCTManuell.Enabled:= true;
end;

procedure TFCTWriteIFK.SetFieldDataDef();
begin
     Form_Properties.ComboBox_Write_Data.ItemIndex:= ComBoxWRDataDef;
     Form_Properties.Edit_WR_Constant.Text:= WRConstEmpty;
     Form_Properties.Edit_WR_Constant.Text:= OffsetEmpty;
end;

procedure TFCTWriteIFK.GetFieldsData(var Properties:TProperties);
begin
     Properties.ActiveBool   := Form_Properties.CheckBox_Active.Checked;
     Properties.IFKNrStr     := Form_Properties.ComboBox_IFKNr.Text;
     Properties.ManuelFctStr := Form_Properties.MaskEdit_FCTManuell.Text;
     Properties.WriteDtaStr  := Form_Properties.ComboBox_Write_Data.Text;
     Properties.WrConstRowStr:= Form_Properties.Edit_WR_Constant.Text;
     Properties.OffsetStr    := Form_Properties.Edit_Offset.Text;
     Properties.CompRowStr   := Form_Properties.Combo_Compare_with.Text;
     Properties.CompOnBool   := Form_Properties.CheckBox_ON.Checked;
end;


end.
