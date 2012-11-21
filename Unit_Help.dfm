object Form_Help: TForm_Help
  Left = 656
  Top = 173
  Width = 513
  Height = 611
  AutoSize = True
  Caption = 'HELP me'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 537
    BevelInner = bvLowered
    TabOrder = 0
    object ListBox_Help: TListBox
      Left = 8
      Top = 8
      Width = 489
      Height = 521
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
    end
  end
  object Button_Close: TButton
    Left = 184
    Top = 544
    Width = 129
    Height = 33
    Caption = 'Thanks'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button_CloseClick
  end
end
