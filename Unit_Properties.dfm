object Form_Properties: TForm_Properties
  Left = 356
  Top = 302
  Width = 588
  Height = 383
  AutoSize = True
  Caption = 'Properties '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Arial'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 577
    Height = 281
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 11
      Top = 18
      Width = 64
      Height = 17
      Caption = 'Function :'
    end
    object ComboBox_Function: TComboBox
      Left = 78
      Top = 15
      Width = 97
      Height = 25
      Style = csDropDownList
      ItemHeight = 17
      TabOrder = 0
      OnChange = ComboBox_FunctionChange
    end
    object Panel2: TPanel
      Left = 197
      Top = 47
      Width = 380
      Height = 38
      BevelInner = bvLowered
      TabOrder = 1
      object Label2: TLabel
        Left = 6
        Top = 9
        Width = 50
        Height = 17
        Caption = 'IFK-Nr.:'
      end
      object Label11: TLabel
        Left = 177
        Top = 10
        Width = 38
        Height = 17
        Caption = 'Row :'
      end
      object ComboBox_IFKNr: TComboBox
        Left = 57
        Top = 6
        Width = 54
        Height = 25
        Style = csDropDownList
        ItemHeight = 17
        TabOrder = 0
      end
      object Combo_IFKNr_Row: TComboBox
        Left = 223
        Top = 6
        Width = 57
        Height = 25
        ItemHeight = 17
        TabOrder = 1
        Text = '0'
        OnChange = Combo_IFKNr_RowChange
      end
    end
    object Panel3: TPanel
      Left = 197
      Top = 152
      Width = 380
      Height = 41
      BevelInner = bvLowered
      TabOrder = 2
      object Label4: TLabel
        Left = 8
        Top = 10
        Width = 78
        Height = 17
        Caption = 'Write Data: '
      end
      object Label5: TLabel
        Left = 244
        Top = 12
        Width = 25
        Height = 17
        Caption = 'Hex'
      end
      object Label10: TLabel
        Left = 334
        Top = 12
        Width = 36
        Height = 17
        Caption = 'offset'
      end
      object ComboBox_Write_Data: TComboBox
        Left = 88
        Top = 7
        Width = 89
        Height = 25
        Style = csDropDownList
        ItemHeight = 17
        TabOrder = 0
        OnChange = ComboBox_Write_DataChange
      end
      object Edit_WR_Constant: TMaskEdit
        Left = 192
        Top = 8
        Width = 49
        Height = 25
        EditMask = '>CCCC'
        MaxLength = 4
        TabOrder = 1
        Text = '0000'
        OnKeyPress = Edit_WR_ConstantKeyPress
      end
      object Edit_Offset: TMaskEdit
        Left = 280
        Top = 8
        Width = 49
        Height = 25
        EditMask = '>CCCC'
        MaxLength = 4
        TabOrder = 2
        Text = '0000'
        OnKeyPress = Edit_OffsetKeyPress
      end
    end
    object Panel4: TPanel
      Left = 197
      Top = 230
      Width = 380
      Height = 42
      BevelInner = bvLowered
      TabOrder = 3
      object Label7: TLabel
        Left = 9
        Top = 10
        Width = 41
        Height = 17
        Caption = 'Time: '
      end
      object ComboBox_unit: TComboBox
        Left = 123
        Top = 8
        Width = 54
        Height = 25
        Style = csDropDownList
        ItemHeight = 17
        TabOrder = 0
      end
      object MaskEdit_Time: TMaskEdit
        Left = 56
        Top = 8
        Width = 49
        Height = 25
        EditMask = '9999;0;_'
        MaxLength = 4
        TabOrder = 1
        Text = '100'
      end
    end
    object Panel5: TPanel
      Left = 197
      Top = 16
      Width = 380
      Height = 33
      BevelInner = bvLowered
      TabOrder = 4
      object CheckBox_Active: TCheckBox
        Left = 8
        Top = 7
        Width = 97
        Height = 17
        Caption = 'Active'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
    end
    object Panel6: TPanel
      Left = 197
      Top = 191
      Width = 380
      Height = 41
      BevelInner = bvLowered
      TabOrder = 5
      object Label8: TLabel
        Left = 8
        Top = 11
        Width = 99
        Height = 17
        Caption = 'Compare with :'
      end
      object CheckBox_ON: TCheckBox
        Left = 173
        Top = 12
        Width = 52
        Height = 17
        Caption = 'ON'
        TabOrder = 0
        OnClick = CheckBox_ONClick
      end
      object Combo_Compare_with: TComboBox
        Left = 112
        Top = 8
        Width = 49
        Height = 25
        ItemHeight = 17
        TabOrder = 1
        Text = '1'
      end
    end
    object Panel7: TPanel
      Left = 197
      Top = 83
      Width = 380
      Height = 71
      BevelInner = bvLowered
      TabOrder = 6
      object Label3: TLabel
        Left = 8
        Top = 11
        Width = 33
        Height = 17
        Caption = 'FCT:'
      end
      object Label6: TLabel
        Left = 9
        Top = 41
        Width = 57
        Height = 17
        Caption = 'Manuell :'
      end
      object Label9: TLabel
        Left = 105
        Top = 42
        Width = 25
        Height = 17
        Caption = 'Hex'
      end
      object ComboBox_FCT: TComboBox
        Left = 57
        Top = 9
        Width = 224
        Height = 23
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ItemHeight = 15
        ParentFont = False
        TabOrder = 0
        OnChange = ComboBox_FCTChange
      end
      object MaskEdit_FCTManuell: TMaskEdit
        Left = 69
        Top = 38
        Width = 28
        Height = 25
        EditMask = '>CC'
        MaxLength = 2
        TabOrder = 1
        Text = '00'
        OnChange = MaskEdit_FCTManuellChange
        OnKeyPress = MaskEdit_FCTManuellKeyPress
      end
    end
  end
  object Button_OK: TButton
    Left = 459
    Top = 288
    Width = 121
    Height = 41
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button_OKClick
  end
  object Button_ForgetIt: TButton
    Left = 2
    Top = 288
    Width = 121
    Height = 41
    Caption = 'Forget it'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button_ForgetItClick
  end
  object MainMenu1: TMainMenu
    Left = 216
    Top = 288
    object Help1: TMenuItem
      Caption = 'Help'
      OnClick = Help1Click
    end
  end
end
