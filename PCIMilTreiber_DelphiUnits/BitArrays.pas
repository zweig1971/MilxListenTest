unit BitArrays;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls ,UnitMil, GlobaleVar;

type
  TForm_BitArrays = class(TForm)
    Panel1: TPanel;
    Button_close: TButton;
    Panel2: TPanel;
    Panel1_BitArray1: TPanel;
    Panel1_BitArray2: TPanel;
    Panel1_BitArray3: TPanel;
    Panel1_BitArray4: TPanel;
    ComboBox_LineNr1: TComboBox;
    Label1: TLabel;
    Panel7: TPanel;
    Label2: TLabel;
    Panel2_BitArray1: TPanel;
    Panel2_BitArray2: TPanel;
    Panel2_BitArray3: TPanel;
    Panel2_BitArray4: TPanel;
    ComboBox_LineNr2: TComboBox;
    Panel12: TPanel;
    Label3: TLabel;
    Panel3_BitArray1: TPanel;
    Panel3_BitArray2: TPanel;
    Panel3_BitArray3: TPanel;
    Panel3_BitArray4: TPanel;
    ComboBox_LineNr3: TComboBox;
    Panel17: TPanel;
    Label4: TLabel;
    Panel4_BitArray1: TPanel;
    Panel4_BitArray2: TPanel;
    Panel4_BitArray3: TPanel;
    Panel4_BitArray4: TPanel;
    ComboBox_LineNr4: TComboBox;
    Button_update: TButton;
    CheckBox_AutoUpdate: TCheckBox;
    procedure Button_closeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox_AutoUpdateClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form_BitArrays: TForm_BitArrays;

implementation

{$R *.DFM}

procedure TForm_BitArrays.Button_closeClick(Sender: TObject);
begin
     CheckBox_AutoUpdate.Checked:= False;
     Form_BitArrays.Close;
end;

procedure TForm_BitArrays.FormCreate(Sender: TObject);

var i:_WORD;

begin
     ComboBox_LineNr1.Items.Clear;
     ComboBox_LineNr2.Items.Clear;
     ComboBox_LineNr3.Items.Clear;
     ComboBox_LineNr4.Items.Clear;

     for i:= 1 to 256 do begin
         ComboBox_LineNr1.Items.Add(IntToStr(i));
         ComboBox_LineNr2.Items.Add(IntToStr(i));
         ComboBox_LineNr3.Items.Add(IntToStr(i));
         ComboBox_LineNr4.Items.Add(IntToStr(i));
     end;

     ComboBox_LineNr1.ItemIndex := 0;
     ComboBox_LineNr2.ItemIndex := 0;
     ComboBox_LineNr3.ItemIndex := 0;
     ComboBox_LineNr4.ItemIndex := 0;

end;

procedure TForm_BitArrays.CheckBox_AutoUpdateClick(Sender: TObject);
begin
     if(CheckBox_AutoUpdate.Checked = true) then Button_update.Enabled:= false
     else Button_update.Enabled:= true;
end;

end.
