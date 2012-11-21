unit Unit_Debug;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm_Debug = class(TForm)
    ListBoxDebug: TListBox;
    Button_Clear: TButton;
    CheckBox_Enabel: TCheckBox;
    procedure Button_ClearClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form_Debug: TForm_Debug;

implementation

{$R *.DFM}

procedure TForm_Debug.Button_ClearClick(Sender: TObject);
begin
   ListBoxDebug.Clear;
end;

end.
