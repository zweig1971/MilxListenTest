object Form_Choose_PCI_MIL_Card: TForm_Choose_PCI_MIL_Card
  Left = 491
  Top = 442
  Width = 433
  Height = 123
  AutoSize = True
  Caption = 'Choose PCI-Mil-Card'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 425
    Height = 49
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 131
      Height = 17
      Caption = 'PCI-Mil-Card found :'
    end
    object Panel_PCIMILFound: TPanel
      Left = 143
      Top = 13
      Width = 57
      Height = 25
      BevelInner = bvLowered
      Caption = '1'
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 208
      Top = 0
      Width = 217
      Height = 49
      BevelInner = bvLowered
      TabOrder = 1
      object Shape1: TShape
        Left = 176
        Top = 12
        Width = 33
        Height = 25
        Brush.Color = clRed
        Shape = stCircle
      end
      object ComboBox_PCIMILCard: TComboBox
        Left = 15
        Top = 13
        Width = 41
        Height = 25
        ItemHeight = 17
        TabOrder = 0
        Text = '1'
      end
      object Button_Allocate: TButton
        Left = 80
        Top = 12
        Width = 89
        Height = 25
        Caption = 'Allocate'
        TabOrder = 1
        OnClick = Button_AllocateClick
      end
    end
  end
  object Button_OK: TButton
    Left = 157
    Top = 56
    Width = 105
    Height = 33
    Caption = 'OK'
    TabOrder = 1
    OnClick = Button_OKClick
  end
end
