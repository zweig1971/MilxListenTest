//-----------------------------
// GSI Gesellschaft für
// Schwerionenforschung mbH,
// Darmstadt, Germany
//
// Unit_Details
//
// Autor           : Zweig,Marcus
// letzte Änderung : 12.09
//-------------------------------
//
//->Unit_Details
//  wird  von Unit_Main im menue aufgerufen
//  stellt den MainLoop-Counter, error-count, verify
//  und system messages dar. 
//
//-------------------------------

unit Unit_Details;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Menus, GlobaleVar;

type
  TForm_Details = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Panel_LoopCnt: TPanel;
    Button_ClearLPC: TButton;
    Panel_Verify_Failure: TPanel;
    Label4: TLabel;
    Button_ClearVYF: TButton;
    Label5: TLabel;
    TrackBar_MainLoopSpeed: TTrackBar;
    Label7: TLabel;
    Label8: TLabel;
    Button_ClearSM: TButton;
    Button_ClearALL: TButton;
    Button_Close: TButton;
    Label6: TLabel;
    SystemMessagesListBox: TListBox;
    MainMenu1: TMainMenu;
    Panel_ErrorCount: TPanel;
    Button_ClearErrCnt: TButton;
    Label9: TLabel;
    Help1: TMenuItem;
    procedure Button_CloseClick(Sender: TObject);
    procedure Button_ClearLPCClick(Sender: TObject);
    procedure UpdateFormDetails();
    procedure Button_ClearErrCntClick(Sender: TObject);
    procedure Button_ClearVYFClick(Sender: TObject);
    procedure Button_ClearSMClick(Sender: TObject);
    procedure Button_ClearALLClick(Sender: TObject);
    procedure Help1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form_Details: TForm_Details;

implementation

uses Unit_Help;

{$R *.DFM}

procedure TForm_Details.Button_CloseClick(Sender: TObject);
begin
     Form_Details.Close;
end;

procedure TForm_Details.Button_ClearLPCClick(Sender: TObject);
begin
     MainLoopCount:= 0;
     Panel_LoopCnt.Caption:= '0';
end;

procedure TForm_Details.UpdateFormDetails();
begin
     Form_Details.Panel_LoopCnt.Caption       := IntToStr(MainLoopCount);
     Form_Details.Panel_ErrorCount.Caption    := IntToStr(ErrCount);
     Form_Details.Panel_Verify_Failure.Caption:= IntToStr(VerifyErrCount);
     Form_Details.Update;
end;


procedure TForm_Details.Button_ClearErrCntClick(Sender: TObject);
begin
     Form_Details.Panel_ErrorCount.Caption:= '0';
     ErrCount:= 0;
     ErrDetect:= false;
     Form_Details.Update;
end;

procedure TForm_Details.Button_ClearVYFClick(Sender: TObject);
begin
     Form_Details.Panel_Verify_Failure.Caption:= '0';
     VerifyErrCount:= 0;
     Form_Details.Update;
end;

procedure TForm_Details.Button_ClearSMClick(Sender: TObject);
begin
     SystemMessagesListBox.Clear;
     Form_Details.Update;
end;

procedure TForm_Details.Button_ClearALLClick(Sender: TObject);
begin
    Form_Details.Button_ClearLPC.Click;
    Form_Details.Button_ClearErrCnt.Click;
    Form_Details.Button_ClearVYF.Click;
    Form_Details.Button_ClearSM.Click;
end;

procedure TForm_Details.Help1Click(Sender: TObject);
begin
     HelpFilename:= DateiNameHelpDetails;
     Form_Help.Show;
end;

end.
