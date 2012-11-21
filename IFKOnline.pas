unit IFKOnline;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TForm_IFKOnline = class(TForm)
    Panel1: TPanel;
    ListBox_IFKsOnline: TListBox;
    Button_Update: TButton;
    Label1: TLabel;
    Panel_IFKOnline: TPanel;
    Button_Close: TButton;
    procedure Button_CloseClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form_IFKOnline: TForm_IFKOnline;

implementation

{$R *.DFM}

procedure TForm_IFKOnline.Button_CloseClick(Sender: TObject);
begin
    Form_IFKOnline.Close; 
end;

end.
