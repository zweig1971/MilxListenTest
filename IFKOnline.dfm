object Form_IFKOnline: TForm_IFKOnline
  Left = -789
  Top = 378
  Width = 313
  Height = 339
  AutoSize = True
  Caption = 'IFK Online'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 17
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 305
    Height = 265
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 84
      Height = 17
      Caption = 'IFKs Online: '
    end
    object ListBox_IFKsOnline: TListBox
      Left = 200
      Top = 21
      Width = 89
      Height = 233
      ItemHeight = 17
      TabOrder = 0
    end
    object Button_Update: TButton
      Left = 24
      Top = 224
      Width = 153
      Height = 25
      Caption = 'Update'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object Panel_IFKOnline: TPanel
      Left = 99
      Top = 21
      Width = 65
      Height = 25
      BevelInner = bvLowered
      Caption = '0'
      TabOrder = 2
    end
  end
  object Button_Close: TButton
    Left = 208
    Top = 272
    Width = 97
    Height = 33
    Caption = 'Close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button_CloseClick
  end
end
