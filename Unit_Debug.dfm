object Form_Debug: TForm_Debug
  Left = 532
  Top = 161
  Width = 438
  Height = 577
  Caption = 'Debug'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 24
  object ListBoxDebug: TListBox
    Left = 8
    Top = 8
    Width = 417
    Height = 497
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 20
    ParentFont = False
    TabOrder = 0
  end
  object Button_Clear: TButton
    Left = 8
    Top = 512
    Width = 89
    Height = 25
    Caption = 'Clear'
    TabOrder = 1
    OnClick = Button_ClearClick
  end
  object CheckBox_Enabel: TCheckBox
    Left = 141
    Top = 516
    Width = 65
    Height = 17
    Caption = 'Enabel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
end
