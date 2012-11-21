unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, ExtCtrls, Buttons, Menus, Unit6, UnitMil,GlobaleVar;



type
  TForm_FunctionList = class(TForm)
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    Button_minus: TButton;
    Button_plus: TButton;
    MainMenu1: TMainMenu;
    Datei1: TMenuItem;
    Anzeige1: TMenuItem;
    oeffnen1: TMenuItem;
    Speichern: TMenuItem;
    Details: TMenuItem;
    Button_Close: TButton;
    SpeedButton_Loop: TSpeedButton;
    Shape_ErrLamp: TShape;
    Extras1: TMenuItem;
    Einstellungen: TMenuItem;
    IFKdiagnostics: TMenuItem;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    StepButton: TButton;
    BitArrays1: TMenuItem;
    IFKOnline: TMenuItem;
    procedure Button_CloseClick(Sender: TObject);
    procedure Button_plusClick(Sender: TObject);
    procedure DetailsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button_minusClick(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
    procedure EinstellungenClick(Sender: TObject);
    procedure IFKdiagnosticsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SaveStringGrid(StringGrid: TStringGrid; const FileName: TFileName);
    procedure LoadStringGrid(StringGrid: TStringGrid; const FileName: TFileName);
    procedure SpeichernClick(Sender: TObject);
    procedure oeffnen1Click(Sender: TObject);
    procedure StepButtonClick(Sender: TObject);
    procedure AnalyseList(y_zelle:_WORD);
    procedure BitArrays1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form_FunctionList: TForm_FunctionList;
  LoopCounter:_DWORD;

implementation

uses Unit2, Unit3, Unit4, Unit5, BitArrays;

var TabelIndex:WORD;

{$R *.DFM}

procedure TForm_FunctionList.Button_CloseClick(Sender: TObject);
begin
     Form_FunctionList.Close;
end;

procedure TForm_FunctionList.Button_plusClick(Sender: TObject);
begin
     if(SpeedButton_Loop.Down = true) then begin
       SpeedButton_Loop.Down := false;
       Form_FunctionList.Update;
     end;

     Tabelindex:= Tabelindex+1;
     Form3.SetTabelIndex(Tabelindex);
     Form3.ShowModal();
end;

procedure TForm_FunctionList.DetailsClick(Sender: TObject);
begin
    Form_Details.Show;
end;

procedure TForm_FunctionList.FormCreate(Sender: TObject);

var i:word;
    status:dword;

begin
     StringGrid1.ColWidths[0]:= 30;

     StringGrid1.Cells[0,0]:= 'Nr.';
     StringGrid1.Cells[1,0]:= 'Do';
     StringGrid1.Cells[2,0]:= 'IFK';
     StringGrid1.Cells[3,0]:= 'FCT';
     StringGrid1.Cells[4,0]:= 'Wr-Data';
     StringGrid1.Cells[5,0]:= 'Rd-Data';
     StringGrid1.Cells[6,0]:= 'Comp';
     StringGrid1.Cells[7,0]:= 'Active';

     for i:=1 to StringGrid1.RowCount-1 do StringGrid1.Cells[0,i]:= IntToStr(i);

     TabelIndex:=0;


     if (PCIMilCardSearchOpen(status) <> true) then begin
        Application.MessageBox('Error to open a PCI-Mil-Card', 'Unwissenheit ist ein Segen', 16);
     end;

end;

procedure TForm_FunctionList.Button_minusClick(Sender: TObject);
begin
     if(SpeedButton_Loop.Down = true) then begin
       SpeedButton_Loop.Down := false;
       Form_FunctionList.Update;
     end;

     if(TabelIndex > 0) then begin
       StringGrid1.Rows[TabelIndex].Clear;
       TabelIndex:= TabelIndex - 1;
     end;
end;

procedure TForm_FunctionList.StringGrid1Click(Sender: TObject);

var x_zelle, y_zelle :word;
    unity:string;

begin
     x_zelle:= StringGrid1.Col;
     y_zelle:= StringGrid1.Row;

     if(Form_FunctionList.StringGrid1.Cells[1,y_zelle] <> '') then begin

       Form3.ComboBox_Function.ItemIndex:= Form3.ComboBox_Function.Items.IndexOf(Form_FunctionList.StringGrid1.Cells[1,y_zelle]);

       if(Form_FunctionList.StringGrid1.Cells[2,y_zelle] <> TEmpty) then
          Form3.ComboBox_IFKNr.ItemIndex:= Form3.ComboBox_IFKNr.Items.IndexOf(Form_FunctionList.StringGrid1.Cells[2,y_zelle]);

       if(Form_FunctionList.StringGrid1.Cells[3,y_zelle] <> TEmpty) then
          Form3.ComboBox_FCT.ItemIndex:= Form3.ComboBox_FCT.Items.IndexOf(Form_FunctionList.StringGrid1.Cells[3,y_zelle]);

       if(Form_FunctionList.StringGrid1.Cells[6,y_zelle] <> TEmpty) then
          Form3.Edit_Compare_with.Text:= Form_FunctionList.StringGrid1.Cells[6,y_zelle];

       if(Form3.ComboBox_Function.ItemIndex = 5) then begin
         Form3.Edit_Time.Text:= copy (Form_FunctionList.StringGrid1.Cells[4,y_zelle], 3, 6);
         unity:= copy (Form_FunctionList.StringGrid1.Cells[4,y_zelle], 0, 2);
         Form3.ComboBox_unit.ItemIndex:= Form3.ComboBox_unit.Items.IndexOf(unity);
       end;

       if(Form3.ComboBox_Function.ItemIndex = 3) then begin
         unity:= copy (Form_FunctionList.StringGrid1.Cells[4,y_zelle], 0, 1);
         if(unity = 'z') then Form3.ComboBox_Write_Data.Items.IndexOf('RD Data')
         else Form3.ComboBox_Write_Data.Items.IndexOf('Manuell');
        end;

       if(Form_FunctionList.StringGrid1.Cells[7,y_zelle] <> 'EN') then Form3.CheckBox_Active.Checked:= false
       else Form3.CheckBox_Active.Checked:= true;

       Form3.SetTabelIndex(y_zelle);
       Form3.DisEbnable();
       Form3.Show;
     end;
end;

procedure TForm_FunctionList.EinstellungenClick(Sender: TObject);
begin
     Form_Choose_PCI_MIL_Card.ShowModal;
end;

procedure TForm_FunctionList.IFKdiagnosticsClick(Sender: TObject);
begin
     Form_IFK_search.ShowModal;
end;

procedure TForm_FunctionList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if(Cardauswahl <> 0) then PCI_DriverClose(Cardauswahl);
end;

procedure TForm_FunctionList.SaveStringGrid(StringGrid: TStringGrid; const FileName: TFileName);
var
  f:    TextFile;
  i, k: Integer;
begin
  AssignFile(f, FileName);
  Rewrite(f);
  with StringGrid do
  begin
    // Write number of Columns/Rows
    Writeln(f, ColCount);
    Writeln(f, RowCount);
    // loop through cells
    for i := 0 to ColCount - 1 do
      for k := 0 to RowCount - 1 do
        Writeln(F, Cells[i, k]);
  end;
  CloseFile(F);
end;

procedure TForm_FunctionList.LoadStringGrid(StringGrid: TStringGrid; const FileName: TFileName);
var
  f:          TextFile;
  iTmp, i, k: Integer;
  strTemp:    String;
begin
  AssignFile(f, FileName);
  Reset(f);
  with StringGrid do
  begin
    // Get number of columns
    Readln(f, iTmp);
    ColCount := iTmp;
    // Get number of rows
    Readln(f, iTmp);
    RowCount := iTmp;
    // loop through cells & fill in values
    for i := 0 to ColCount - 1 do
      for k := 0 to RowCount - 1 do
      begin
        Readln(f, strTemp);
        Cells[i, k] := strTemp;
      end;
  end;
  CloseFile(f);
end;

procedure TForm_FunctionList.SpeichernClick(Sender: TObject);

var dateiname:string;
    DateiID:string;
    VerzProtSOPName:string;
    VerzProtUserName:string;

begin
  dateiname:='';

  SaveDialog1.FileName:= dateiname;
  SaveDialog1.Filter:= '.txt';
  SaveDialog1.DefaultExt:= '.txt';

  if SaveDialog1.Execute then begin
        dateiname := SaveDialog1.FileName;
        if FileExists(dateiname) then begin
          messagebox(0,'Datei existiert bereits, anderen Namen wählen !','You will never win',16);
          dateiname :='';
        end else SaveStringGrid(StringGrid1, dateiname);
  end;
end;

procedure TForm_FunctionList.oeffnen1Click(Sender: TObject);

var dateiname:string;
    DateiID:string;
    VerzProtSOPName:string;
    VerzProtUserName:string;

begin
  dateiname:='';

  OpenDialog1.FileName:= dateiname;
  OpenDialog1.Filter:= '.txt';
  OpenDialog1.DefaultExt:= '.txt';

  if OpenDialog1.Execute then begin
        dateiname := OpenDialog1.FileName;
        LoadStringGrid(StringGrid1, dateiname);
  end;
end;

procedure TForm_FunctionList.StepButtonClick(Sender: TObject);
begin
     if(SpeedButton_Loop.Down = true) then begin
       SpeedButton_Loop.Down := false;
       Form_FunctionList.Update;
     end;
     AnalyseList(1);
end;

procedure TForm_FunctionList.AnalyseList(y_zelle:_WORD);

var IFKNr   :_WORD;
    FCT     :_WORD;
    WrDta   :_WORD;
    RdDta   :_WORD;
    Time    :_WORD;
    TimeBase: _BYTE;
    x_zelle :_WORD;
    status    :_DWORD;
    ErrStatus :_DWORD;
    substr    : string;
    WrDtaOrder: string;
    ErrSring  : string;
    FiFoNotEmpty: boolean;

begin
     // --- Write IFK ---
     if(StringGrid1.Cells[1,y_zelle] = TWriteIFK) then begin
       IFKNr:= StrToInt('$'+StringGrid1.Cells[2,y_zelle]);//  uebernehme IFK Nummer
       FCT  := StrToInt('$'+StringGrid1.Cells[3,y_zelle]);//  uebernehme Function code

       if(StringGrid1.Cells[4,y_zelle] = TCounter) then WrDta:= LoopCounter mod $10000
       else begin
         WrDtaOrder:= Copy (StringGrid1.Cells[4,y_zelle], 1, 2);
         if(WrDtaOrder = TZeile) then begin  // soll ein wert von einer anderen zeile genutzt werden
           substr:= Copy (StringGrid1.Cells[4,y_zelle], 2, 2); // zeile ermitteln
           x_zelle:= StrToInt(substr);
           WrDta:= StrToInt('$'+StringGrid1.Cells[x_zelle,5]); // wert uebernehmen
         end else if (WrDtaOrder = TManuell) then begin // soll ein manueller wert genutz werden
           substr:= Copy (StringGrid1.Cells[4,y_zelle], 2, 4); // wert ermitteln
           WrDta:= StrToInt('$'+substr);                      // wert uebernehmen
         end;
        end;

        //Schreibe an IFK
        status:= PCI_IfkWrite(Cardauswahl, IFKNr, FCT, WrDta, ErrStatus);
        if (status <> StatusOK) then  begin
           ErrorString(status, ErrSring);
           Form_Details.SystemMessagesListBox.Items.Add('Write IFK Z'+IntToStr(y_zelle)+': '+ErrSring);
           status:= StatusOK;
        end;

     // --- Read IFK -----
     end else if(StringGrid1.Cells[1,y_zelle] = TReadIFK) then begin
       IFKNr:= StrToInt('$'+StringGrid1.Cells[2,y_zelle]);//  uebernehme IFK Nummer
       FCT  := StrToInt('$'+StringGrid1.Cells[3,y_zelle]);//  uebernehme Function code

       // Interfacekarte auslesen
       status:= PCI_IFKRead(Cardauswahl, IFKNr, FCT, RdDta, ErrStatus);
       if (status <> StatusOK) then  begin
          ErrorString(status, ErrSring);
          Form_Details.SystemMessagesListBox.Items.Add('Read IFK Z'+IntToStr(y_zelle)+': '+ErrSring);
          status:= StatusOK;
       end;

       // Ergebniss in HEX  ausgeben
       StringGrid1.Cells[5,y_zelle]:=THex+IntToHex(RdDta,4);


     // ---  Write Functionscode ---
     end else if(StringGrid1.Cells[1,y_zelle] = TWriteFCT) then begin
       IFKNr:= StrToInt('$'+StringGrid1.Cells[2,y_zelle]);//  uebernehme IFK Nummer
       FCT  := StrToInt('$'+StringGrid1.Cells[3,y_zelle]);//  uebernehme Function code

       //  Functionscode an IFK senden
       status:= PCI_FctCodeSnd(Cardauswahl, IFKNr, FCT, ErrStatus);
       if (status <> StatusOK) then  begin
          ErrorString(status, ErrSring);
          Form_Details.SystemMessagesListBox.Items.Add('Write FCT Z'+IntToStr(y_zelle)+': '+ErrSring);
          status:= StatusOK;
       end;

     // ---  Write DATA  ---
     end else if(StringGrid1.Cells[1,y_zelle] = TWriteData) then begin
       IFKNr:= StrToInt('$'+StringGrid1.Cells[2,y_zelle]);//  uebernehme IFK Nummer

       if(StringGrid1.Cells[4,y_zelle] = TCounter) then WrDta:= LoopCounter mod $10000
       else begin
         WrDtaOrder:= Copy (StringGrid1.Cells[4,y_zelle], 1, 2);
         if(WrDtaOrder = TZeile) then begin  // soll ein wert von einer anderen zeile genutzt werden
           substr:= Copy (StringGrid1.Cells[4,y_zelle], 2, 2); // zeile ermitteln
           x_zelle:= StrToInt(substr);
           WrDta:= StrToInt('$'+StringGrid1.Cells[x_zelle,5]); // wert uebernehmen
         end else if (WrDtaOrder = TManuell) then begin // soll ein manueller wert genutz werden
           substr:= Copy (StringGrid1.Cells[4,y_zelle], 2, 4); // wert ermitteln
           WrDta:= StrToInt('$'+substr);                      // wert uebernehmen
         end;
        end;

        // Daten auf den Bus schreiben
        status:= PCI_MilBusWrite(Cardauswahl, WrDta, ErrStatus);
        if (status <> StatusOK) then  begin
          ErrorString(status, ErrSring);
          Form_Details.SystemMessagesListBox.Items.Add('Write DATA Z'+IntToStr(y_zelle)+': '+ErrSring);
          status:= StatusOK;
        end;


     // ---  READ DATA  ---
     end else if(StringGrid1.Cells[1,y_zelle] = TReadData) then begin

       // vom MIL_BUS lesen
       status:= PCI_MilBusREad(Cardauswahl, RdDta, FiFoNotEmpty, ErrStatus);
       if (status <> StatusOK) then  begin
          ErrorString(status, ErrSring);
          Form_Details.SystemMessagesListBox.Items.Add('Read DATA Z'+IntToStr(y_zelle)+': '+ErrSring);
          status:= StatusOK;
       end;

       // Ergebniss in HEX ausgeben
      StringGrid1.Cells[5,y_zelle]:=THex+IntToHex(RdDta,4);


     // ---  Timer aufziehen  ---
     end else if(StringGrid1.Cells[1,y_zelle] = TTimer) then begin

       WrDtaOrder:= Copy (StringGrid1.Cells[4,y_zelle], 1, 2);

       if(WrDtaOrder = TMs) then begin  // angabe in ms
         substr:= Copy (StringGrid1.Cells[4,y_zelle], 2, 4);// timerwert  ermitteln
         TimeBase:= 1;
       end else if (WrDtaOrder = Tus) then begin // oder in us
         substr:= Copy (StringGrid1.Cells[4,y_zelle], 2, 4);//  timerwert  ermitteln
         TimeBase:= 0;
       end;

       Time:= StrToInt('$'+substr);

       // Timer aufziehen
       status:= PCI_TimerWait(Cardauswahl, Time, TimeBase, ErrStatus);
       if (status <> StatusOK) then  begin
          ErrorString(status, ErrSring);
          Form_Details.SystemMessagesListBox.Items.Add('Timer Set Z'+IntToStr(y_zelle)+': '+ErrSring);
          status:= StatusOK;
       end;
     end;
end;

procedure TForm_FunctionList.BitArrays1Click(Sender: TObject);
begin
     Form_BitArrays.Show;
end;

end.
