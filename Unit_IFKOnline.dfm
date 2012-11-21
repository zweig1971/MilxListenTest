object Form_IFKOnline: TForm_IFKOnline
  Left = 554
  Top = 214
  Width = 265
  Height = 359
  AutoSize = True
  Caption = 'IFK Online'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Arial'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 257
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
      Left = 168
      Top = 21
      Width = 73
      Height = 196
      ItemHeight = 17
      TabOrder = 0
    end
    object Button_Update: TButton
      Left = 164
      Top = 225
      Width = 81
      Height = 25
      Caption = 'Update'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Button_UpdateClick
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
    object StaticText1: TStaticText
      Left = 16
      Top = 84
      Width = 117
      Height = 21
      Caption = 'Add IFK manually'
      TabOrder = 3
    end
    object ADD: TButton
      Left = 56
      Top = 110
      Width = 73
      Height = 21
      Caption = 'ADD'
      TabOrder = 4
      OnClick = ADDClick
    end
    object MaskEdit_AddManIFK: TMaskEdit
      Left = 16
      Top = 107
      Width = 33
      Height = 25
      TabOrder = 5
      Text = '0'
      OnKeyPress = MaskEdit_AddManIFKKeyPress
    end
  end
  object Button_Close: TButton
    Left = 160
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
  object MainMenu1: TMainMenu
    Top = 264
    object Help1: TMenuItem
      Caption = 'Help'
      OnClick = Help1Click
    end
  end
end
