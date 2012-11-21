object Form_Details: TForm_Details
  Left = 257
  Top = 114
  Width = 689
  Height = 271
  AutoSize = True
  Caption = 'Details'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Arial'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 18
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 681
    Height = 177
    BevelInner = bvLowered
    TabOrder = 0
    object Label7: TLabel
      Left = 234
      Top = 139
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
    object Label8: TLabel
      Left = 90
      Top = 141
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
    object Label6: TLabel
      Left = 8
      Top = 145
      Width = 78
      Height = 17
      Caption = 'Loop Speed'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 681
      Height = 137
      BevelInner = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 17
        Width = 81
        Height = 16
        Caption = 'Loop Counter:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 8
        Top = 98
        Width = 80
        Height = 16
        Caption = 'Verify Failure:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 256
        Top = 7
        Width = 89
        Height = 14
        Caption = 'System Messages'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 8
        Top = 58
        Width = 81
        Height = 16
        Caption = 'Error Counter:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Panel_LoopCnt: TPanel
        Left = 92
        Top = 13
        Width = 125
        Height = 25
        BevelInner = bvLowered
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object Button_ClearLPC: TButton
        Left = 220
        Top = 21
        Width = 25
        Height = 17
        Caption = 'X'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = Button_ClearLPCClick
      end
      object Panel_Verify_Failure: TPanel
        Left = 94
        Top = 94
        Width = 123
        Height = 25
        BevelInner = bvLowered
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object Button_ClearVYF: TButton
        Left = 220
        Top = 101
        Width = 25
        Height = 17
        Caption = 'X'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = Button_ClearVYFClick
      end
      object SystemMessagesListBox: TListBox
        Left = 256
        Top = 24
        Width = 385
        Height = 97
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ItemHeight = 15
        ParentFont = False
        TabOrder = 4
      end
      object Panel_ErrorCount: TPanel
        Left = 93
        Top = 54
        Width = 124
        Height = 25
        BevelInner = bvLowered
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
      end
      object Button_ClearErrCnt: TButton
        Left = 220
        Top = 62
        Width = 25
        Height = 17
        Caption = 'X'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnClick = Button_ClearErrCntClick
      end
    end
    object TrackBar_MainLoopSpeed: TTrackBar
      Left = 103
      Top = 141
      Width = 129
      Height = 33
      Max = 50
      Orientation = trHorizontal
      Frequency = 5
      Position = 0
      SelEnd = 0
      SelStart = 0
      TabOrder = 1
      TickMarks = tmBottomRight
      TickStyle = tsAuto
    end
    object Button_ClearSM: TButton
      Left = 648
      Top = 104
      Width = 25
      Height = 17
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Button_ClearSMClick
    end
    object Button_ClearALL: TButton
      Left = 648
      Top = 152
      Width = 25
      Height = 17
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = Button_ClearALLClick
    end
  end
  object Button_Close: TButton
    Left = 576
    Top = 184
    Width = 105
    Height = 33
    Caption = 'Close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button_CloseClick
  end
  object MainMenu1: TMainMenu
    Left = 240
    Top = 192
    object Help1: TMenuItem
      Caption = 'Help'
      OnClick = Help1Click
    end
  end
end
