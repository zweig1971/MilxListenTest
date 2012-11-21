object Form_FunctionList: TForm_FunctionList
  Left = -941
  Top = 141
  Width = 609
  Height = 663
  AutoSize = True
  Caption = 'Function List'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object SpeedButton_Loop: TSpeedButton
    Left = 0
    Top = 568
    Width = 97
    Height = 41
    AllowAllUp = True
    GroupIndex = 1
    Caption = 'Loop'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 601
    Height = 561
    BevelInner = bvLowered
    TabOrder = 0
    object Shape_ErrLamp: TShape
      Left = 111
      Top = 522
      Width = 17
      Height = 20
      Brush.Color = clLime
      Shape = stCircle
    end
    object StringGrid1: TStringGrid
      Left = 24
      Top = 24
      Width = 545
      Height = 481
      ColCount = 8
      RowCount = 256
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = StringGrid1Click
      ColWidths = (
        64
        80
        64
        64
        64
        64
        64
        64)
      RowHeights = (
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
    object Button_minus: TButton
      Left = 24
      Top = 520
      Width = 33
      Height = 25
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -40
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button_minusClick
    end
    object Button_plus: TButton
      Left = 64
      Top = 520
      Width = 33
      Height = 25
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -40
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button_plusClick
    end
  end
  object Button_Close: TButton
    Left = 472
    Top = 568
    Width = 129
    Height = 41
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
  object StepButton: TButton
    Left = 120
    Top = 568
    Width = 97
    Height = 41
    Caption = 'Step'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = StepButtonClick
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 8
    object Datei1: TMenuItem
      Caption = 'Datei'
      object oeffnen1: TMenuItem
        Caption = 'Öffnen'
        OnClick = oeffnen1Click
      end
      object Speichern: TMenuItem
        Caption = 'Speichern'
        OnClick = SpeichernClick
      end
    end
    object Anzeige1: TMenuItem
      Caption = 'Anzeige'
      object Details: TMenuItem
        Caption = 'Details'
        OnClick = DetailsClick
      end
      object BitArrays1: TMenuItem
        Caption = 'Bit Arrays'
        OnClick = BitArrays1Click
      end
    end
    object Extras1: TMenuItem
      Caption = 'Extras'
      object IFKOnline: TMenuItem
        Caption = 'IFK to update'
      end
      object IFKdiagnostics: TMenuItem
        Caption = 'IFK diagnostics '
        OnClick = IFKdiagnosticsClick
      end
      object Einstellungen: TMenuItem
        Caption = 'Einstellungen'
        OnClick = EinstellungenClick
      end
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 280
    Top = 568
  end
  object OpenDialog1: TOpenDialog
    Left = 312
    Top = 568
  end
end
