object Form_BitDescription: TForm_BitDescription
  Left = 434
  Top = 196
  Width = 282
  Height = 614
  Caption = 'Bit description'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 273
    Height = 521
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 492
      Width = 91
      Height = 16
      Caption = 'Line Nr.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Courier'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SG_BitDescription: TStringGrid
      Left = 8
      Top = 8
      Width = 257
      Height = 465
      ColCount = 3
      DefaultColWidth = 60
      RowCount = 17
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Courier'
      Font.Style = [fsBold]
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goEditing]
      ParentFont = False
      TabOrder = 0
      ColWidths = (
        60
        111
        60)
      RowHeights = (
        26
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24
        24)
    end
    object ComboBox_LineNr1: TComboBox
      Left = 99
      Top = 489
      Width = 57
      Height = 26
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ItemHeight = 18
      ParentFont = False
      TabOrder = 1
    end
  end
  object Button_Close: TButton
    Left = 152
    Top = 528
    Width = 121
    Height = 49
    Caption = 'Close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button_CloseClick
  end
end
