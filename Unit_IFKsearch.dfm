object Form_IFK_search: TForm_IFK_search
  Left = 474
  Top = 246
  Width = 345
  Height = 375
  AutoSize = True
  Caption = 'IFK search'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Arial'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 337
    Height = 281
    BevelInner = bvLowered
    TabOrder = 0
    object SpeedButton_startsearch: TSpeedButton
      Left = 213
      Top = 245
      Width = 89
      Height = 25
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'START'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton_startsearchClick
    end
    object Label7: TLabel
      Left = 16
      Top = 244
      Width = 42
      Height = 17
      Caption = 'Speed'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 169
      Top = 241
      Width = 7
      Height = 24
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 64
      Top = 243
      Width = 12
      Height = 24
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 337
      Height = 233
      BevelInner = bvLowered
      TabOrder = 0
      object Label3: TLabel
        Left = 232
        Top = 8
        Width = 96
        Height = 17
        Caption = 'IFKs unreliable'
      end
      object Label2: TLabel
        Left = 126
        Top = 8
        Width = 61
        Height = 17
        Caption = 'IFKs new'
      end
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 72
        Height = 17
        Caption = 'IFKs online'
      end
      object ListBox_IFKOnline: TListBox
        Left = 16
        Top = 32
        Width = 57
        Height = 161
        ItemHeight = 17
        TabOrder = 0
      end
      object ListBox_IFKNEW: TListBox
        Left = 128
        Top = 32
        Width = 57
        Height = 161
        ItemHeight = 17
        TabOrder = 1
      end
      object ListBox_IFKUnreliable: TListBox
        Left = 248
        Top = 32
        Width = 57
        Height = 161
        ItemHeight = 17
        TabOrder = 2
      end
      object Panel_IFKOnline: TPanel
        Left = 16
        Top = 200
        Width = 57
        Height = 25
        BevelInner = bvLowered
        Caption = '0'
        TabOrder = 3
      end
      object Panel_IFKNew: TPanel
        Left = 128
        Top = 200
        Width = 57
        Height = 25
        BevelInner = bvLowered
        Caption = '0'
        TabOrder = 4
      end
      object Panel_IFKUnreliable: TPanel
        Left = 248
        Top = 200
        Width = 57
        Height = 25
        BevelInner = bvLowered
        Caption = '0'
        TabOrder = 5
      end
    end
    object TrackBar_LoopSpeed: TTrackBar
      Left = 78
      Top = 243
      Width = 91
      Height = 33
      Orientation = trHorizontal
      Frequency = 1
      Position = 0
      SelEnd = 0
      SelStart = 0
      TabOrder = 1
      TickMarks = tmBottomRight
      TickStyle = tsAuto
    end
  end
  object Button_Close: TButton
    Left = 104
    Top = 288
    Width = 97
    Height = 33
    Caption = 'Close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button_CloseClick
  end
  object MainMenu1: TMainMenu
    Left = 248
    Top = 288
    object Help1: TMenuItem
      Caption = 'Help'
      OnClick = Help1Click
    end
  end
end
