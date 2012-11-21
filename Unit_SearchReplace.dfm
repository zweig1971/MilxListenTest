object Form_SearchReplace: TForm_SearchReplace
  Left = 605
  Top = 237
  Width = 337
  Height = 138
  AutoSize = True
  Caption = 'Search & Replace'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object Button_Go: TButton
    Left = 138
    Top = 76
    Width = 81
    Height = 28
    Caption = 'Go'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button_GoClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 329
    Height = 73
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 76
      Height = 17
      Caption = 'Search for :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 17
      Top = 43
      Width = 73
      Height = 17
      Caption = 'Replace it :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 218
      Top = 16
      Width = 70
      Height = 17
      Caption = 'Search in :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object SearchFor_Edit: TEdit
      Left = 96
      Top = 8
      Width = 105
      Height = 26
      TabOrder = 0
      Text = '0'
      OnKeyPress = SearchFor_EditKeyPress
    end
    object ReplaceIt_Edit: TEdit
      Left = 96
      Top = 42
      Width = 105
      Height = 26
      TabOrder = 1
      Text = '0'
      OnKeyPress = ReplaceIt_EditKeyPress
    end
    object ComboBox_SearchIn: TComboBox
      Left = 220
      Top = 41
      Width = 95
      Height = 26
      ItemHeight = 18
      TabOrder = 2
      Text = 'ComboBox_SearchIn'
    end
  end
end
