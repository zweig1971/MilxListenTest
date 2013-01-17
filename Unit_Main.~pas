//-----------------------------
// GSI Gesellschaft für
// Schwerionenforschung mbH,
// Darmstadt, Germany
//
// Unit_Main.pas
//
// Autor           : Zweig,Marcus
// letzte Änderung : 02.11
//-------------------------------
//
//->PCIMilCardSearchOpen
// sucht und oeffnet PCI-Milkarten nimmt automatisch
// immer  die erste.
//
//->FormCreate
// wird die  tabelle definiert, zeilen und spalten 
// beschriftet und versucht eine PCI-Milkarte
// zu oeffen 
//
//->StringGrid1Click
//  wird ausgefuehrt wenn inerhalb der tabelle geklickt wird
//  die  function wertet die daten in der tabelle aus und
//  übertraegt sie in das propertie-form
//  (write data geht noch nicht)
//
//->StepButtonClick
//  wird die tabelle einmal komplett ausgefuehrt
//
//->SpeedButton_LoopClick
//  arbeitet die tabelle komplett solange ab, bis entweder loop
//  deaktiviert wird oder ggf. ein fehler auftritt
//  update ggf. ausserdem die Forms FormDetails,Form_BitArrays
//  und sich selbst ab. 
//
//->AnalyseList
//  macht die ganze arbeitet.wertet die tabelle aus und liest,
//  schreibt die functions-codes bzw. daten. Alle daten die
//  geschrieben oder gelesen werden sind im array DataValueArray
//  abgelegt.
//
//->UpdateValueForms
//  schreibt die gelesenen daten in hex/bin in die tabelle
//  schreibt je nach schiebereglerstellung (TrackBar_MainLoopSpeed)
//  und nach MainLoopCount (mod)
//
//->StringGrid1KeyDown
//  wird ueber TStringGrid->Ereignisse->OnKeyDown Aufgerufen
//  ruft je nach  gedrueckter taste GridCopy, GridPaste, GrindClear
//  auf
//
//->GridCopy
// copiert den makierten bereich in der liste in ein eigenes TString
// (ClipStrings)
//
//->GridPaste
//  fuegt den inhalt von ClipStrings ab der von der maus makierten
//  stelle ein
//
//->GrindClear
//  loescht einen voher makierten bereich inerhalb der list
//------------------------------


unit Unit_Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, ExtCtrls, Buttons, Menus, UnitMil, GlobaleVar;



type
  TForm_FunctionList = class(TForm)
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    Button_plus: TButton;
    MainMenu1: TMainMenu;
    Datei1: TMenuItem;
    Anzeige1: TMenuItem;
    oeffnen1: TMenuItem;
    Speichern: TMenuItem;
    Details: TMenuItem;
    Button_Close: TButton;
    SpeedButton_Loop: TSpeedButton;
    Extras1: TMenuItem;
    Einstellungen: TMenuItem;
    IFKdiagnostics: TMenuItem;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    StepButton: TButton;
    BitArrays1: TMenuItem;
    IFKtoUpdate: TMenuItem;
    Help: TMenuItem;
    ToolHelp1: TMenuItem;
    Info1: TMenuItem;
    Button_ClearTabel: TButton;
    Test1: TMenuItem;
    Search1: TMenuItem;
    Button_SingelStep: TButton;
    Debug1: TMenuItem;
    Panel3: TPanel;
    Shape_ErrLamp: TShape;
    Panel2: TPanel;
    Label_ProgStatus: TLabel;
    Label_Points: TLabel;
    CheckBox_HoldOnError: TCheckBox;
    function  PCIMilCardSearchOpen(var status:_DWORD):boolean;
    procedure Button_CloseClick(Sender: TObject);
    procedure Button_plusClick(Sender: TObject);
    procedure DetailsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button_minusClick(Sender: TObject);
    procedure EinstellungenClick(Sender: TObject);
    procedure IFKdiagnosticsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SaveStringGrid(StringGrid: TStringGrid; const FileName: TFileName);
    procedure LoadStringGrid(StringGrid: TStringGrid; const FileName: TFileName);
    procedure SpeichernClick(Sender: TObject);
    procedure oeffnen1Click(Sender: TObject);
    procedure StepButtonClick(Sender: TObject);
    function  GiveStringData(y_zelle:_WORD):_WORD;
    procedure AnalyseList(y_zelle:_WORD; var ErrorFound:Boolean);
    procedure BitArrays1Click(Sender: TObject);
    procedure IFKtoUpdateClick(Sender: TObject);
    procedure SpeedButton_LoopClick(Sender: TObject);
    procedure ToolHelp1Click(Sender: TObject);
    procedure Info1Click(Sender: TObject);
    procedure CompareValue(y_zelle:_WORD; RdDta:_DWORD; var ErrorFound:Boolean);
    procedure ClearDataArrayValue();
    procedure Extras1Click(Sender: TObject);
    procedure Datei1Click(Sender: TObject);
    procedure Shape_ErrLampMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StringGridClearComplete();
    procedure Button_ClearTabelClick(Sender: TObject);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StringGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure StringGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure WriteValue(y_zelle:_WORD; Value:integer);
    procedure Test1Click(Sender: TObject);
    procedure Search1Click(Sender: TObject);
    procedure Button_SingelStepClick(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
    procedure Debug1Click(Sender: TObject);
    procedure UpdateValueForms();
    function  IsCellSelected(StringGrid: TStringGrid; X, Y: Longint): Boolean;
    procedure ClearMessageQueue();
    procedure DataValueArrayClr();

  private
    ClipStrings: TStrings;
    
    MouseSelection: TGridRect;
    procedure GridCopy(sg: TStringGrid);
    procedure GridPaste(sg: TStringGrid);
    procedure GrindClear(sg: TStringGrid);
    procedure GrindRowClear(Row:Integer);
  public
    { Public-Deklarationen }
    MouseDown: Boolean;
  end;

var
  Form_FunctionList       : TForm_FunctionList;
   SelectionRowSingelStep :_Word;

implementation

uses Unit_BitArrays, Unit_Properties, Unit_Details, Unit_ChoosePCI,
     Unit_IFKsearch, Unit_IFKOnline, Unit_Help, Info, Unit_BitDescrip,
     Unit_Debug, Unit_SearchReplace;

{$R *.DFM}
procedure ResizeGrid(sg: TStringGrid);
var
  iCol, iRow: Integer;
begin
  with sg do
  begin
    Width := ColCount * GridLineWidth + Ord(BorderStyle) * 3;
    for iCol := 0 to Pred(ColCount) do
      Width := Width + ColWidths[iCol];
    Height := RowCount * GridLineWidth + Ord(BorderStyle) * 3;
    for iRow := 0 to Pred(RowCount) do
      Height := Height + RowHeights[iRow];
  end;
end;


function TForm_FunctionList.PCIMilCardSearchOpen(var status:_DWORD):boolean;

var CardCounter: integer;
    myStatus:_DWORD;
    index:integer;


begin
 index:=0;
 result:= true;

  // PCI Mil Karten zählen
  CardCounter := PCI_PCIcardCount();

  // keine PCIMil Karten vorhanden -> tschüss
  if (CardCounter > 0) then begin
     if (CardCounter = 1) then begin

        // öffnen der PCI Mil Karte
        Cardauswahl:= 1;
        myStatus := PCI_DriverOpen(Cardauswahl);
        if(myStatus <> StatusOK) then begin
          Cardauswahl :=0;
          status := myStatus;
          result := false;
        end else result:=true;

     end else begin
        repeat
          index:=index+1;
          myStatus := PCI_DriverOpen(index);    // oeffne
          if(myStatus = StatusOK) then begin   // Geklappt ? Dann nehmen
            Cardauswahl := index;  // Kartennummer nehmen
            index  := CardCounter;  // schleife beenden
            status := myStatus;
            result := true;
          end;
        until index = CardCounter
      end;


  end else begin
      Cardauswahl :=0;
      result := false;
  end;
end;


procedure TForm_FunctionList.Button_CloseClick(Sender: TObject);
begin
     if(SpeedButton_Loop.Down = true) then SpeedButton_Loop.Down := false;
     Form_FunctionList.Close;
end;

procedure TForm_FunctionList.Button_plusClick(Sender: TObject);
begin
     if(SpeedButton_Loop.Down = true) then begin
       SpeedButton_Loop.Down := false;
       Form_FunctionList.Update;
     end;

     Tabelindex:= Tabelindex+1;
     Form_Properties.SetTabelIndex(Tabelindex);
     Form_Properties.ShowModal();
end;

procedure TForm_FunctionList.DetailsClick(Sender: TObject);
begin
    Form_Details.Show;
end;

procedure TForm_FunctionList.FormCreate(Sender: TObject);

var i:word;
    status:dword;

begin
     MainLoopCount    := 0;
     VerifyErrCount   := 0;
     ErrCount         := 0;
     ErrDetect        := false;

     SelectionRowSingelStep:=0;

     IFKOnline := TStringList.Create;
     ClearDataArrayValue();
     //ResizeGrid(StringGrid1);
     ClipStrings := TStringList.Create;

     StringGrid1.ColWidths[0]:= 30;

     StringGrid1.Cells[AColNr,0]       := StringGridCol_0;
     StringGrid1.Cells[AColDO,0]       := StringGridCol_1;
     StringGrid1.Cells[AColIFK,0]      := StringGridCol_2;
     StringGrid1.Cells[AColFCT,0]      := StringGridCol_3;
     StringGrid1.Cells[AColWrData,0]   := StringGridCol_4;
     StringGrid1.Cells[AColRdData,0]   := StringGridCol_5;
     StringGrid1.Cells[AcolRdDataBin,0]:= StringGridCol_6;
     StringGrid1.Cells[AColCmp,0]      := StringGridCol_7;
     StringGrid1.Cells[AColActive,0]   := StringGridCol_8;
     StringGrid1.Cells[AColComment,0]  := StringGridCol_9;

     for i:=1 to StringGrid1.RowCount-1 do StringGrid1.Cells[0,i]:= IntToStr(i);

     TabelIndex:=0;

     //StringGrid1.Options:=[goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine];
                           //goRowSizing,goColSizing];

     // aktuelles verzeichnis ermitteln
     Anwendungsverzeichnis:=ExtractFilePath(ParamStr(0));

     if (PCIMilCardSearchOpen(status) <> true) then begin
        Application.MessageBox('Error to open a PCI-Mil-Card', 'Unwissenheit ist ein Segen', 48);
     end else begin
        IFKOnline.Clear;
        IFKFound(IFKOnline, IFKaktive);
        if(IFKaktive <= 0) then Application.MessageBox('There are no IFKs on the road !', 'Viele Fehler entstehen durch Eile', 48);
     end;

end;

procedure TForm_FunctionList.Button_minusClick(Sender: TObject);
begin
     if(SpeedButton_Loop.Down = true) then begin
       SpeedButton_Loop.Down := false;
       Form_FunctionList.Update;
     end;

     if(TabelIndex > 0) then begin
       GrindRowClear(TabelIndex);
       TabelIndex:= TabelIndex - 1;
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

var dateiname       :string;
    button          :integer;

begin
  dateiname:='';

  SaveDialog1.FileName:= dateiname;
//  SaveDialog1.Filter:= '.txt';
//  SaveDialog1.DefaultExt:= 'txt';

  if SaveDialog1.Execute then begin
        dateiname := SaveDialog1.FileName;
        if FileExists(dateiname) then begin
          button:= Application.messagebox('Datei existiert bereits, überschreiben ?','You will never win',33);
          case button of
           1: SaveStringGrid(StringGrid1, dateiname);
           else dateiname :='';
          end;
        end else SaveStringGrid(StringGrid1, dateiname);
  end;
end;

procedure TForm_FunctionList.oeffnen1Click(Sender: TObject);

var dateiname:string;

begin
  dateiname:='';

  OpenDialog1.FileName:= dateiname;
//  OpenDialog1.Filter:= '.txt';
//  OpenDialog1.DefaultExt:= 'txt';

  if OpenDialog1.Execute then begin
        StringGridClearComplete();
        ClearDataArrayValue();
        dateiname := OpenDialog1.FileName;
        LoadStringGrid(StringGrid1, dateiname);

        repeat
          Tabelindex:=Tabelindex + 1;
        until (StringGrid1.Cells[AColDO,Tabelindex] = '' )
  end;
end;


procedure TForm_FunctionList.StepButtonClick(Sender: TObject);

var y_zelle:_Word;
    ErrorFound:Boolean;

begin
     SelectionRowSingelStep:= 0; // Position fuer das SingelStep  ruecksetzten

     // Loop-Button ausschalten
     if(SpeedButton_Loop.Down = true) then begin
       SpeedButton_Loop.Down := false;
       Form_FunctionList.Update;
     end;

     Label_ProgStatus.Caption:= TRun;
     Application.ProcessMessages();

     //Main Loop counter hochzaehlen
     MainLoopCount:= MainLoopCount + 1;

     //fange bei der ersten zeile in der liste an
     y_zelle:= 1;

     // arbeite die liste ab
     while(y_zelle < StringGrid1.RowCount) do begin
       if (StringGrid1.Cells[AColDO,y_zelle] <> '' ) then begin
          if(StringGrid1.Cells[AColActive,y_zelle] = TEnable ) then AnalyseList(y_zelle, ErrorFound);
       end;
       y_zelle:= y_zelle + 1;
     end;

     // wurde eine fehler erkannt -> rote lampe an !
     if(ErrDetect = true) then Shape_ErrLamp.Brush.Color:= clRed
     else Shape_ErrLamp.Brush.Color:= clLime;

     Label_ProgStatus.Caption:= TStop;
     Application.ProcessMessages();
     UpdateValueForms();
end;


function  TForm_FunctionList.GiveStringData(y_zelle:_WORD):_WORD;

var  WrDta  :_WORD;
     substr :string;
     x_zelle:_WORD;
     myPos  :_WORD;

begin
     WrDta:= 0;

     // string durchsuchen

     // TiCounter
     myPos:= pos(TiCounter,Form_FunctionList.StringGrid1.Cells[AColWrData,y_zelle]);
     if(myPos <> 0) then  WrDta:= not(MainLoopCount mod MaxCounterSend);

     // TCounter
     myPos:= pos(TCounter,Form_FunctionList.StringGrid1.Cells[AColWrData,y_zelle]);
     if(myPos <> 0) then WrDta:= MainLoopCount mod MaxCounterSend;

     // TZeile
     myPos:= pos(TZeile,Form_FunctionList.StringGrid1.Cells[AColWrData,y_zelle]);
     if(myPos <> 0) then begin
       substr:= Copy (StringGrid1.Cells[AColWrData,y_zelle], length(TZeile)+myPos, length(ManZeilEmpty));
       x_zelle:= StrToInt(substr);
       WrDta:= DataValueArray[x_zelle]; // wert von der internen liste uebernehmen
     end;

     // TManuell
     myPos:= pos(TManuell,Form_FunctionList.StringGrid1.Cells[AColWrData,y_zelle]);
     if(myPos <> 0) then begin
       substr:= Copy (StringGrid1.Cells[AColWrData,y_zelle], length(TManuell)+myPos, length(WRConstEmpty)); // wert ermitteln
       WrDta:= StrToInt('$'+substr);                                // wert uebernehmen
     end;

     // TOffset
     myPos:= pos(TOffset,Form_FunctionList.StringGrid1.Cells[AColWrData,y_zelle]);
     if(myPos <> 0) then begin
       substr:= Copy (StringGrid1.Cells[AColWrData,y_zelle], length(TOffset)+myPos, length(OffsetEmpty)); // wert ermitteln
       WrDta:= WrDta+StrToInt('$'+substr);
     end;

     GiveStringData:= WrDta;

{
     if(WrDtaOrder  = TiCounter) then WrDta:= not(MainLoopCount mod MaxCounterSend)
     else if(WrDtaOrder = TCounter) then WrDta:= MainLoopCount mod MaxCounterSend        // Wert in die sichtbare Liste eintragen
     else if(WrDtaOrder = TZeile) then begin                    // soll ein wert von einer anderen zeile genutzt werden
       substr:= Copy (StringGrid1.Cells[AColWrData,y_zelle], length(TZeile)+1, 3); // zeile ermitteln
       x_zelle:= StrToInt(substr);
       WrDta:= DataValueArray[x_zelle];                             // wert von der internen liste uebernehmen
      end else if(WrDtaOrder = TManuell) then begin                  // soll ein manueller wert genutz werden
       substr:= Copy (StringGrid1.Cells[AColWrData,y_zelle], length(TManuell)+1, 4); // wert ermitteln
       WrDta:= StrToInt('$'+substr);                                // wert uebernehmen
     end;
     GiveStringData:= WrDta;     }
end;


procedure TForm_FunctionList.AnalyseList(y_zelle:_WORD; var ErrorFound:Boolean);

var IFKNr       :_WORD;
    FCT         :_WORD;
    RdDta       :_WORD;
    Time        :_WORD;
    TimeBase    :_BYTE;
    status      :_DWORD;
    ErrStatus   :_DWORD;
    DataArrayIndex:_WORD;
    substr      : string;
    WrDtaOrder  : string;
    ErrSring    : string;
    ValueStr    : string;
    RowNr       :_WORD;
    FiFoNotEmpty: boolean;
    StringLeng  :integer;
    StringIndex :word;
    myPos       :integer;

begin
     TimeBase:=0;

     // --- IFK Nummer auslesen ---
     if(StringGrid1.Cells[AColIFK,y_zelle] <> TEmpty) then begin
       myPos:= pos(TZeile,Form_FunctionList.StringGrid1.Cells[AColIFK,y_zelle]);

       // wurde auf eine andere Zeile verwiesen-> zeilennummer auschneiden
       if(myPos <>0) then begin
         StringLeng:= length (Form_FunctionList.StringGrid1.Cells[AColIFK,y_zelle]);
         // zeilennummer auschneiden und nummer uebernehem
         RowNr:= StrTOInt(copy(Form_FunctionList.StringGrid1.Cells[AColIFK,y_zelle], myPos+4, StringLeng-(length(TZeile))));
         IFKNr:= DataValueArray[RowNr];
       end else begin
         try
            IFKNr:= StrToInt('$'+StringGrid1.Cells[AColIFK,y_zelle]);//  uebernehme IFK Nummer
         except
            IFKNr:= 0;
         end;
       end;

       // Debug
       if (Form_Debug.CheckBox_Enabel.Checked) then begin
             Form_Debug.ListBoxDebug.Items.Add('ANL:'+'IFK Nr: '+ IntToHex(IFKNr,4));
       end;
     end;

     // --- Write IFK ---
     if(StringGrid1.Cells[AColDO,y_zelle] = TWriteIFK) then begin

       FCT  := StrToInt('$'+StringGrid1.Cells[AColFCT,y_zelle]);//  uebernehme Function code
       DataValueArray[y_zelle]:= GiveStringData(y_zelle);

       // Debug
       if (Form_Debug.CheckBox_Enabel.Checked) then begin
             Form_Debug.ListBoxDebug.Items.Add('ANL:'+
             'DataValue Z'+ IntToStr(y_zelle)+ ':'+IntToHex(DataValueArray[y_zelle], 4));
       end;

       //Schreibe an IFK
       status:= PCI_IfkWrite(Cardauswahl, IFKNr, FCT, DataValueArray[y_zelle], ErrStatus);
       if (status <> StatusOK) then  begin
          ErrorString(status, ErrSring);  // fehler auswerten
          Form_Details.SystemMessagesListBox.Items.Add('Write IFK Z'+IntToStr(y_zelle)+': '+ErrSring);
          ErrCount:= ErrCount + 1; // Fehler Counter hochzaehlen
          ErrDetect := true; // fehler entdeckt
          ErrorFound:= true;
       end;

     // --- Read IFK -----
     end else if(StringGrid1.Cells[AColDO,y_zelle] = TReadIFK) then begin

       FCT  := StrToInt('$'+StringGrid1.Cells[AColFCT,y_zelle]);//  uebernehme Function code

       // Interfacekarte auslesen
       status:= PCI_IFKRead(Cardauswahl, IFKNr, FCT, RdDta, ErrStatus);
       if (status <> StatusOK) then  begin
          ErrorString(status, ErrSring); // fehler auswerten
          Form_Details.SystemMessagesListBox.Items.Add('Read IFK Z'+IntToStr(y_zelle)+': '+ErrSring);
          ErrCount:= ErrCount + 1; // Fehler Counter hochzaehlen
          ErrDetect := true; // fehler entdeckt
          ErrorFound:= true;
       end;

       // Wert in die interne Liste eintragen
       DataValueArray[y_zelle]:= RdDta;

       // vergeliche gelesenen wert mit vorgegebenen wert
       CompareValue(y_zelle, RdDta, ErrorFound);

      // Ergebniss in HEX/BIN  ausgeben
      // WriteValue(y_zelle,RdDta);

       // Debug
       if (Form_Debug.CheckBox_Enabel.Checked) then begin
             Form_Debug.ListBoxDebug.Items.Add('ANL:'+
             'DataValue Z'+ IntToStr(y_zelle)+ ':'+IntToHex(DataValueArray[y_zelle], 4));

             if(ErrDetect = true) then begin
                DataArrayIndex := 1;
                Form_Debug.ListBoxDebug.Items.Add('DataValueArray :');
                while(DataArrayIndex <> 10) do begin
                  Form_Debug.ListBoxDebug.Items.Add(IntToStr(DataArrayIndex)+':'+
                  IntToHex(DataValueArray[DataArrayIndex], 4));
                  DataArrayIndex:=DataArrayIndex+1;
                end;
              end;
       end;

     // ---  Write Functionscode ---
     end else if(StringGrid1.Cells[AColDO,y_zelle] = TWriteFCT) then begin

       FCT  := StrToInt('$'+StringGrid1.Cells[AColFCT,y_zelle]);//  uebernehme Function code

       //  Functionscode an IFK senden
       status:= PCI_FctCodeSnd(Cardauswahl, IFKNr, FCT, ErrStatus);
       if (status <> StatusOK) then  begin
          ErrorString(status, ErrSring);
          Form_Details.SystemMessagesListBox.Items.Add('Write FCT Z'+IntToStr(y_zelle)+': '+ErrSring);
          ErrCount:= ErrCount + 1; // Fehler Counter hochzaehlen
          ErrDetect := true; // fehler entdeckt
          ErrorFound:= true;
       end;

     // ---  Write DATA  ---
     end else if(StringGrid1.Cells[AColDO,y_zelle] = TWriteData) then begin

        WrDtaOrder:= copy (Form_FunctionList.StringGrid1.Cells[AColWrData,y_zelle], 1, 4);

       // Wert in die interne Liste eintragen
       DataValueArray[y_zelle]:= GiveStringData(y_zelle);

       // Debug
       if (Form_Debug.CheckBox_Enabel.Checked) then begin
             Form_Debug.ListBoxDebug.Items.Add('ANL:'+
             'DataValue Z'+ IntToStr(y_zelle)+ ':'+IntToHex(DataValueArray[y_zelle], 4));
       end;

        // Daten auf den Bus schreiben
       status:= PCI_MilBusWrite(Cardauswahl, DataValueArray[y_zelle], ErrStatus);
       if (status <> StatusOK) then  begin
         ErrorString(status, ErrSring);
         Form_Details.SystemMessagesListBox.Items.Add('Write DATA Z'+IntToStr(y_zelle)+': '+ErrSring);
         ErrCount:= ErrCount + 1; // Fehler Counter hochzaehlen
         ErrDetect := true; // fehler entdeckt
         ErrorFound:= true;
       end;


     // ---  READ DATA  ---
     end else if(StringGrid1.Cells[AColDO,y_zelle] = TReadData) then begin

       // vom MIL_BUS lesen
       status:= PCI_MilBusREad(Cardauswahl, RdDta, FiFoNotEmpty, ErrStatus);
       if (status <> StatusOK) then  begin
          ErrorString(status, ErrSring);
          Form_Details.SystemMessagesListBox.Items.Add('Read DATA Z'+IntToStr(y_zelle)+': '+ErrSring);
          ErrCount:= ErrCount + 1; // Fehler Counter hochzaehlen
          ErrDetect := true; // fehler entdeckt
          ErrorFound:= true;
       end;

      // Wert in die interne Liste eintragen
      DataValueArray[y_zelle]:= RdDta;

      // Debug
      if (Form_Debug.CheckBox_Enabel.Checked) then begin
            Form_Debug.ListBoxDebug.Items.Add('ANL:'+
            'DataValue Z'+ IntToStr(y_zelle)+ ':'+IntToHex(DataValueArray[y_zelle], 4));
      end;

      // vergeliche gelesenen wert mit vorgegebenen wert
      CompareValue(y_zelle, RdDta, ErrorFound);

      // Ergebniss in HEX/Bin ausgeben
      //WriteValue(y_zelle, RdDta);

     // ---  Write Command  ---
     end else if(StringGrid1.Cells[AColDO,y_zelle] = TWrCmd) then begin

       DataValueArray[y_zelle]:= GiveStringData(y_zelle);// Wert in die interne Liste eintragen

      // Debug
       if (Form_Debug.CheckBox_Enabel.Checked) then begin
             Form_Debug.ListBoxDebug.Items.Add('ANL:'+
             'DataValue Z'+ IntToStr(y_zelle)+ ':'+IntToHex(DataValueArray[y_zelle], 4));
       end;

      //Schreibe CMD aud Milbus
       status:= PCI_MilBusCMDWrite(Cardauswahl, DataValueArray[y_zelle], ErrStatus);
       if (status <> StatusOK) then  begin
          ErrorString(status, ErrSring);  // fehler auswerten
          Form_Details.SystemMessagesListBox.Items.Add('Write CMD Z'+IntToStr(y_zelle)+': '+ErrSring);
          ErrCount:= ErrCount + 1; // Fehler Counter hochzaehlen
          ErrDetect := true; // fehler entdeckt
          ErrorFound:= true;
       end;

     // ---  Timer aufziehen  ---
     end else if(StringGrid1.Cells[AColDO,y_zelle] = TSetTimer) then begin

       // Laenge feststellen
       StringLeng:= length (Form_FunctionList.StringGrid1.Cells[AColWrData,y_zelle]);

       // einheit rauschneiden
       StringIndex:= StringLeng-1;
       WrDtaOrder:= copy (Form_FunctionList.StringGrid1.Cells[AColWrData,y_zelle], StringIndex, 2);

       if(WrDtaOrder = TMs) then begin  // angabe in ms
         substr:= copy (Form_FunctionList.StringGrid1.Cells[AColWrData,y_zelle], 5, StringLeng-2-4);// timerwert  ermitteln
         TimeBase:= 1;
       end else if (WrDtaOrder = Tus) then begin // oder in us
         substr:= copy (Form_FunctionList.StringGrid1.Cells[AColWrData,y_zelle], 5, StringLeng-2-4);//  timerwert  ermitteln
         TimeBase:= 0;
       end;

       Time:= StrToInt(substr);

       // Timer aufziehen
       status:= PCI_TimerWait(Cardauswahl, Time, TimeBase, ErrStatus);
       if (status <> StatusOK) then  begin
          ErrorString(status, ErrSring);
          Form_Details.SystemMessagesListBox.Items.Add('Timer Set Z'+IntToStr(y_zelle)+': '+ErrSring);
          ErrCount:= ErrCount + 1; // Fehler Counter hochzaehlen
          ErrDetect := true; // fehler entdeckt
          ErrorFound:= true;
       end;
       UpdateValueForms();// Beim Timer  sofort display updaten

     // --- Constante auswerten ---
     end else if(StringGrid1.Cells[AColDO,y_zelle] = TConstante) then begin
         DataValueArray[y_zelle]:= GiveStringData(y_zelle);
     end;
end;

procedure TForm_FunctionList.BitArrays1Click(Sender: TObject);
begin
     Form_BitArrays.Show;
end;

procedure TForm_FunctionList.IFKtoUpdateClick(Sender: TObject);
begin
      Form_IFKOnline.ShowModal;
end;

procedure TForm_FunctionList.SpeedButton_LoopClick(Sender: TObject);

var y_zelle   :_Word;
    ErrStatus :_DWORD;
    ErrorFound:Boolean;
    myRect    :TGridRect;

begin
     SelectionRowSingelStep:= 0; // Position fuer das SingelStep  ruecksetzten
     ErrorFound:= false;

     // Debug
     if (Form_Debug.CheckBox_Enabel.Checked) then begin
          Form_Debug.ListBoxDebug.Items.Add('LOOP START');
     end;

     // wurde eine fehler erkannt loop stoppen
     if(ErrDetect = true) then begin
         if(CheckBox_HoldOnError.Checked = true) then SpeedButton_Loop.Down := false;
     end;

     while (SpeedButton_Loop.Down = true) do begin
       Label_ProgStatus.Caption:= TRun;
       y_zelle:= 1; // fange beider ersten zeile derliste an
       MainLoopCount:= MainLoopCount + 1; // main loop erhoehen

       // arbeite die liste ab
       while(y_zelle < StringGrid1.RowCount) and (ErrorFound = false)do begin
         if (StringGrid1.Cells[AColDO,y_zelle] <> '' ) then begin
            if(StringGrid1.Cells[AColActive,y_zelle] = TEnable ) then AnalyseList(y_zelle, ErrorFound);
            if(ErrorFound) then begin
              if(CheckBox_HoldOnError.Checked) then begin
                 myRect.Top    := y_zelle;
                 myRect.Bottom := y_zelle;
                 myRect.Right  := StringGrid1.ColCount;
                 myRect.Left   := 1;
                 StringGrid1.Selection:= myRect;
                 Form_FunctionList.Update;
               end else ErrorFound:=  false;
            end;
         end;
         y_zelle:= y_zelle + 1;
        // Application.HandleMessage;    // hat der anwender  was gemacht
       end;

       // wurde eine fehler erkannt -> rote lampe an !
       if(ErrDetect = true) then begin
         Shape_ErrLamp.Brush.Color:= clRed;
         if(CheckBox_HoldOnError.Checked = true) then begin
           SpeedButton_Loop.Down := false; // soll im fehlerfall angehalten werden
           UpdateValueForms();
           Form_FunctionList.Update;
         end;
       end else Shape_ErrLamp.Brush.Color:= clLime;

       // Forms Updaten
       if(Form_Details.TrackBar_MainLoopSpeed.Position <> 0) then begin
         PCI_TimerWait(Cardauswahl, (Form_Details.TrackBar_MainLoopSpeed.Position*10), 1, ErrStatus);
         UpdateValueForms();
       end else begin
         if (MainLoopCount mod 500 = 0) then UpdateValueForms();
       end;

       // punkte laufen lassen
       if (MainLoopCount mod 2000 = 0) then begin
         if (length (Label_Points.Caption)> 3) then Label_Points.Caption:= ''
         else Label_Points.Caption:= Label_Points.Caption + '.';
       end;

       // hat der anwender  was gemacht
       Application.ProcessMessages();
     end;

     // Debug
     if (Form_Debug.CheckBox_Enabel.Checked) then begin
          Form_Debug.ListBoxDebug.Items.Add('LOOP STOP');
     end;

     UpdateValueForms();
     Label_ProgStatus.Caption:= TStop;
     Label_Points.Caption:= '';
end;

procedure TForm_FunctionList.ToolHelp1Click(Sender: TObject);
begin
     HelpFilename:= DateiNameHelpMain;
     Form_Help.Show;
end;

procedure TForm_FunctionList.Info1Click(Sender: TObject);
begin
     Form_Info.Show;
end;



// Vergleicht einen wert in einer  zeile mit dem einer andern zeile
procedure TForm_FunctionList.CompareValue(y_zelle:_WORD; RdDta:_DWORD; var ErrorFound:Boolean);

var CompY_zelle:_WORD;
    CompValue:_DWORD;

begin
     // Ergebenis  RdDta vergleichen
     if(StringGrid1.Cells[AColCmp,y_zelle] <> TEmpty) then begin
       CompY_zelle:=  StrToInt(StringGrid1.Cells[AColCmp,y_zelle]);     // zeile ermitteln
       CompValue:= DataValueArray[CompY_zelle];                   // wert aus liste entnehmen

       if(CompValue <> RdDta) then begin
         Form_Details.SystemMessagesListBox.Items.Add('Read IFK Z'+IntToStr(y_zelle)+
                     ':Comp.Err! exp.value:h-'+IntToHex(CompValue,4)+'  '+
                     'obt.value:h-'+IntToHex(RdDta,4));
         VerifyErrCount:= VerifyErrCount + 1;
         ErrCount := ErrCount +  1;
         ErrDetect:= true;
         ErrorFound:= true;
       end;

       // Debug
       if (Form_Debug.CheckBox_Enabel.Checked) then begin
            Form_Debug.ListBoxDebug.Items.Add('CMP:'+
            'y_zelle:'+ IntToStr(y_zelle)+ '- Row:'+StringGrid1.Cells[AColCmp,y_zelle]
            +'Value:'+ IntToHex(DataValueArray[StrToInt(StringGrid1.Cells[AColCmp,y_zelle])],4)
            +' CompWith:'+IntToHex(RdDta,4));
            if(ErrDetect) then Form_Debug.ListBoxDebug.Items.Add('-> ERROR <-');
       end;
     end;
end;

// DataValueArray löschen
procedure TForm_FunctionList.ClearDataArrayValue();

var index   :integer;
    maxindex:integer;

begin
     maxindex:= Length(DataValueArray);
     for index:= 1 to maxindex do DataValueArray[index]:= 0;
end;

procedure TForm_FunctionList.Extras1Click(Sender: TObject);
begin
    if(SpeedButton_Loop.Down=true) then  SpeedButton_Loop.Down:=false;
    Application.ProcessMessages();
    Form_FunctionList.Update;
end;

procedure TForm_FunctionList.Datei1Click(Sender: TObject);
begin
     if(SpeedButton_Loop.Down=true) then  SpeedButton_Loop.Down:=false;
     Application.ProcessMessages();
     Form_FunctionList.Update;
end;

procedure TForm_FunctionList.Shape_ErrLampMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   Form_Details.Button_ClearALL.Click;
   Shape_ErrLamp.Brush.Color:= clLime;
   Form_FunctionList.Update;
end;

// Loescht die komplette liste und stellt
// die beschriftung der felderwieder her
procedure TForm_FunctionList.StringGridClearComplete();

var
  i:integer;
  j:integer;

begin
  for i := StringGrid1.FixedCols to StringGrid1.ColCount - 1 do
  begin
    for j := StringGrid1.FixedRows to StringGrid1.RowCount - 1 do
    begin
      StringGrid1.Cells[i,j] := '';
    end;
  end;

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
end;

// Löscht auf knopfdruck die komplette liste
procedure TForm_FunctionList.Button_ClearTabelClick(Sender: TObject);

var button:integer;

begin
     button:= Application.messagebox('Soll die Tabelle wirklich gelöschen werden ?','Erfahrung ist die Belohnung des Schmerzes',33);
     case button of
          1: begin
             StringGridClearComplete();
             ClearDataArrayValue();
             end;
     end;
end;

procedure TForm_FunctionList.StringGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (ssShift in Shift) then
    case Chr(Key) of
      'C': GridCopy(Sender as TStringGrid);
      'V': GridPaste(Sender as TStringGrid);
      'X': GrindClear(Sender as TStringGrid);
    end;
end;

procedure TForm_FunctionList.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (ssCtrl in Shift) and (ssShift in Shift) then
    MouseDown := true;
    with StringGrid1 do
      MouseSelection.TopLeft := MouseCoord(X, Y);

end;

procedure TForm_FunctionList.StringGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);

var myCoord: TGridCoord;

begin
  if MouseDown then
    with StringGrid1 do
    begin
      MouseSelection.BottomRight := MouseCoord(X, Y);
      myCoord:= MouseCoord(X, Y);
      Selection := MouseSelection;

      //Nach unten der maus nachscrollen 
      if ((myCoord.Y mod 18)=0) then begin
         TopRow:= Selection.Bottom;
         sleep(100);
      end;


//      Form_Debug.ListBoxDebug.Items.Add(IntToStr(Y));
//      Form_Debug.ListBoxDebug.ItemIndex:= Form_Debug.ListBoxDebug.Items.Count;
//      Form_Debug.Update;
//      if ((Y mod 450)=0) then TopRow:= Selection.Bottom;

    end;
end;

procedure TForm_FunctionList.StringGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  MouseDown := false;
end;

// Markierten bereich kopieren
procedure TForm_FunctionList.GridCopy(sg: TStringGrid);
var
  iCol, iRow: Integer;
  s: TStrings;
begin
  ClipStrings.Clear;
  s := TStringList.Create;
  for iRow := sg.Selection.Top to sg.Selection.Bottom do
  begin
    s.Clear;
    for iCol := sg.Selection.Left to sg.Selection.Right do
      s.Add(sg.Cells[iCol, iRow]);
    ClipStrings.Add(s.CommaText);
  end;
  s.Free;
end;

// markierten bereich einfuegen
procedure TForm_FunctionList.GridPaste(sg: TStringGrid);
var
  iCol, iRow: Integer;
  s: TStrings;
begin
  s := TStringList.Create;
  for iRow := 0 to Pred(ClipStrings.Count) do
  begin
    s.CommaText := ClipStrings[iRow];
    for iCol := 0 to Pred(s.Count) do
      sg.Cells[sg.Col + iCol, sg.Row + iRow] := s[iCol];
  end;
  s.Free;
end;

// markierten bereich loeschen
procedure TForm_FunctionList.GrindClear(sg: TStringGrid);
var
   iRow: Integer;
begin
  for iRow := sg.Selection.Top to sg.Selection.Bottom do
  begin
    GrindRowClear(iRow);
  end;
end;

//prüfen ob eine zelle im stringgrid markiert ist ?
function TForm_FunctionList.IsCellSelected(StringGrid: TStringGrid; X, Y: Longint): Boolean;
begin
  Result := False;
  try
    if (X >= StringGrid.Selection.Left) and (X <= StringGrid.Selection.Right) and
      (Y >= StringGrid.Selection.Top) and (Y <= StringGrid.Selection.Bottom) then
      Result := True;
  except
  end;
end;


procedure TForm_FunctionList.StringGrid1DblClick(Sender: TObject);

var y_zelle :word;
    unity            :string;
    TempStr          :string;
    ValueStr         :string;
    index            :word;
    ValueFound       :boolean;
    CompOn           :boolean;
    FCTlineNr        :byte;
    StringLeng       :integer;
    StringIndex      :word;
    myPos            :integer;


begin
     MouseDown := false;
     y_zelle:= StringGrid1.Row;

     ValueFound:= false;
     FCTlineNr := 0;
     index     := 0;
     SpeedButton_Loop.Down := false;

     Form_Properties.ComboBox_IFKNr.Items.Clear;
     Form_Properties.ComboBox_IFKNr.Items     := IFKOnline;
     Form_Properties.ComboBox_IFKNr.ItemIndex := 0;

     // Nur wenn die Zeile leer ist
     if(Form_FunctionList.StringGrid1.Cells[AColDO,y_zelle] <> '') then begin

       // suche in der liste nach der eingetragen function
       Form_Properties.ComboBox_Function.ItemIndex:= Form_Properties.ComboBox_Function.Items.IndexOf(Form_FunctionList.StringGrid1.Cells[AColDO,y_zelle]);

       // Wird an dieser stelle nur gebraucht um die richtigen Dateien zur function zu laden
       Form_Properties.DisEbnable(0,true,false);

       // ist die spalte IFK nicht leer suche in der IFK-Liste nach dem eintrag
       if(Form_FunctionList.StringGrid1.Cells[AColIFK,y_zelle] <> TEmpty) then begin
         //steht die IFK in in einer anderen zeile
         myPos:= pos(TZeile,Form_FunctionList.StringGrid1.Cells[AColIFK,y_zelle]);
         if(myPos>0) then begin
           StringLeng:= length (Form_FunctionList.StringGrid1.Cells[AColIFK,y_zelle]);
           ValueStr:= copy(Form_FunctionList.StringGrid1.Cells[AColIFK,y_zelle], myPos+4, StringLeng-(length(TZeile)));
           Form_Properties.Combo_IFKNr_Row.ItemIndex:= Form_Properties.Combo_IFKNr_Row.Items.IndexOf(ValueStr);
           Form_Properties.ComboBox_IFKNr.Enabled:= false
         end else begin
             Form_Properties.ComboBox_IFKNr.ItemIndex:= Form_Properties.ComboBox_IFKNr.Items.IndexOf(string(Form_FunctionList.StringGrid1.Cells[AColIFK,y_zelle]));
             Form_Properties.Combo_IFKNr_Row.ItemIndex:=0;
             Form_Properties.ComboBox_IFKNr.Enabled:= true;
         end;
       end;

       // ist die spalte FCT nicht leer suche in der FCT-Liste nach dem eintrag
       if(Form_FunctionList.StringGrid1.Cells[AColFCT,y_zelle] <> TEmpty) then begin
          // Die Liste nach dem gesuchten FCT durchsuchen
          while(not ValueFound) and (index < Form_Properties.ComboBox_FCT.Items.Count) do begin
             TempStr:= copy(Form_Properties.ComboBox_FCT.Items[index],0,2);
             if(TempStr = Form_FunctionList.StringGrid1.Cells[AColFCT,y_zelle]) then begin
               FCTlineNr:= index;
               ValueFound:= true;
               Form_Properties.MaskEdit_FCTManuell.Text:= Form_FunctionList.StringGrid1.Cells[AColFCT,y_zelle];
             end;
             index:=index+1;
          end;

          // wurde ein eintrag in der liste nicht gefunden so wird es sich um ein manuellen wert  handeln
          if(not ValueFound) then begin
             FCTlineNr:= 0;
             Form_Properties.MaskEdit_FCTManuell.Text:= Form_FunctionList.StringGrid1.Cells[AColFCT,y_zelle];
          end;
       end;

       // spalte WR-Data
       if(Form_FunctionList.StringGrid1.Cells[AColWrData,y_zelle] <> TEmpty) then begin
         unity:= copy (Form_FunctionList.StringGrid1.Cells[AColWrData,y_zelle], 1, 4);
         if(unity = TZeile) then begin
            // in liste den eintrag suchen und anzeigen
            Form_Properties.ComboBox_Write_Data.ItemIndex:= Form_Properties.ComboBox_Write_Data.Items.IndexOf(TPropRowNr);
            //  manuellen wert ausder tabelle rausschneiden und in Form_Properties anzeigen
            Form_Properties.Edit_WR_Constant.Text:= copy (Form_FunctionList.StringGrid1.Cells[AColWrData,y_zelle], 5, 3);
         end else if(unity = TManuell) then begin
             // in liste den eintrag suchen und anzeigen
            Form_Properties.ComboBox_Write_Data.ItemIndex:= Form_Properties.ComboBox_Write_Data.Items.IndexOf(TPropManuel);
            Form_Properties.Edit_WR_Constant.EditMask:= ManHexInput; // MAske muss gesetzt sein, sonst datenverlust
            //  manuellen wert ausder tabelle rausschneiden und in Form_Properties anzeigen
            Form_Properties.Edit_WR_Constant.Text:= copy (Form_FunctionList.StringGrid1.Cells[AColWrData,y_zelle], 5, 4);
         end else if(unity = TCounter) then begin
            Form_Properties.ComboBox_Write_Data.ItemIndex:= Form_Properties.ComboBox_Write_Data.Items.IndexOf(TPropCount);
         end else if(unity = TiCounter) then begin
            Form_Properties.ComboBox_Write_Data.ItemIndex:= Form_Properties.ComboBox_Write_Data.Items.IndexOf(TPropICount);
         end else Form_Properties.ComboBox_Write_Data.ItemIndex:= Form_Properties.ComboBox_Write_Data.Items.IndexOf(TPropCount);

         //offset suchen, ausschneiden und eintragen
         myPos:= pos(TOffset,Form_FunctionList.StringGrid1.Cells[AColWrData,y_zelle]);
         if(myPos > 0) then begin
            ValueStr:= copy(Form_FunctionList.StringGrid1.Cells[AColWrData,y_zelle], myPos+4, 4);
            Form_Properties.Edit_Offset.Text:= ValueStr;
         end;
       end;

       // ist die spalte comp  nicht leer uebernimm den wert
       if(Form_FunctionList.StringGrid1.Cells[AColCmp,y_zelle] <> TEmpty) then begin
          Form_Properties.Combo_Compare_with.Text:= Form_FunctionList.StringGrid1.Cells[AColCmp,y_zelle];
          CompOn:= true;
       end else CompOn:= false;

       // bei timer copiere den wert von der tabelle
       if(Form_Properties.ComboBox_Function.Text = TSetTimer) then begin

         // Laenge feststellen
         StringLeng:= length (Form_FunctionList.StringGrid1.Cells[AColWrData,y_zelle]);

         // einheit rauschneiden
         StringIndex:= StringLeng-1;
         unity:= copy (Form_FunctionList.StringGrid1.Cells[AColWrData,y_zelle], StringIndex, 2);
         Form_Properties.ComboBox_unit.ItemIndex:= Form_Properties.ComboBox_unit.Items.IndexOf(unity);

         // wert rauschneiden
         Form_Properties.MaskEdit_Time.Text:= copy (Form_FunctionList.StringGrid1.Cells[AColWrData,y_zelle], 5, StringLeng-2-4);
       end;

       // bei Write Data prüfen ob zeile oder mnaueller  wert (funktioniert nicht richtig)
 {      if(Form_Properties.ComboBox_Function.Text = TWriteData) then begin
         unity:= copy (Form_FunctionList.StringGrid1.Cells[AColWrData,y_zelle], 0, 1);
         if(unity = 'z') then Form_Properties.ComboBox_Write_Data.Items.IndexOf('RD Data')
         else Form_Properties.ComboBox_Write_Data.Items.IndexOf('Manuell');
        end;       }

       // zeile enable oder disables
       if(Form_FunctionList.StringGrid1.Cells[AColActive,y_zelle] <> TEnable) then Form_Properties.CheckBox_Active.Checked:= false
       else Form_Properties.CheckBox_Active.Checked:= true;

       Form_Properties.SetTabelIndex(integer(y_zelle));
       Form_Properties.DisEbnable(FCTlineNr, CompOn, false);
       Form_Properties.Show;
     end else begin
       Form_Properties.SetTabelIndex(StringGrid1.Row);
       //Form_Properties.DisEbnable(0, CompOn, true);
       Form_Properties.ShowModal();
     end;
end;

// loescht eine zeile der tabelle ohne die erste spalte (nummerierung) zu loeschen
procedure TForm_FunctionList.GrindRowClear(Row:Integer);

var i:integer;

begin
 for i:=1 to StringGrid1.ColCount  do  begin
   StringGrid1.Cells[i,Row]:= '';
 end;
end;

// Schreibt den Wert in die Liste
procedure TForm_FunctionList.WriteValue(y_zelle:_WORD; Value:integer);

var CalueStr:string;

begin
     if(Form_Details.TrackBar_MainLoopSpeed.Position = 0) and (SpeedButton_Loop.Down = true) then begin
       if (MainLoopCount mod 100 = 0) or (ErrDetect=true) then begin
         StringGrid1.Cells[AColRdData,y_zelle]   := THex+IntToHex(Value,4);// Hex ausgabe
         CalueStr:= intToBinary(Value, 16); // in Bin umwandeln
         Insert('.',CalueStr,5);            // trennzeichen einfuegen
         Insert('.',CalueStr,10);
         Insert('.',CalueStr,15);
         StringGrid1.Cells[AcolRdDataBin,y_zelle]:= CalueStr; // Bin ausgabe
       end;
     end else begin
         StringGrid1.Cells[AColRdData,y_zelle]   := THex+IntToHex(Value,4);// Hex ausgabe
         CalueStr:= intToBinary(Value, 16); // in Bin umwandeln
         Insert('.',CalueStr,5);            // trennzeichen einfuegen
         Insert('.',CalueStr,10);
         Insert('.',CalueStr,15);
         StringGrid1.Cells[AcolRdDataBin,y_zelle]:= CalueStr; // Bin ausgabe
     end;
end;



procedure TForm_FunctionList.Test1Click(Sender: TObject);
begin
     Form_BitDescription.show;
end;

procedure TForm_FunctionList.Search1Click(Sender: TObject);
begin
     Form_SearchReplace.Show;
end;

procedure TForm_FunctionList.Button_SingelStepClick(Sender: TObject);

var myRect       :TGridRect;
    ErrorFound:Boolean;

begin
     // Loop-Button ausschalten
     if(SpeedButton_Loop.Down = true) then begin
       SpeedButton_Loop.Down := false;
       Form_FunctionList.Update;
     end;

     // Anzeige programm laeuft
     Label_ProgStatus.Caption:= TRun;
     Application.ProcessMessages();

     // prüfen ob der index zurueckgesetzt  wurde
     if(SelectionRowSingelStep = 0) then begin
       if(StringGrid1.Selection.Top >= 1) then SelectionRowSingelStep:= StringGrid1.Selection.Top
       else SelectionRowSingelStep :=1;
     end else begin
        if(StringGrid1.Selection.Top < 1) or (StringGrid1.Selection.Top >= StringGrid1.RowCount) then
          SelectionRowSingelStep:= 1
        else  SelectionRowSingelStep:= SelectionRowSingelStep + 1;
     end;

     // nach den ersten eintrag in der Functionsliste suchen
     while(StringGrid1.Cells[1,SelectionRowSingelStep] = '') and (SelectionRowSingelStep < StringGrid1.RowCount-1)do begin
       SelectionRowSingelStep:= SelectionRowSingelStep + 1;
     end;

     if(StringGrid1.Cells[1,SelectionRowSingelStep] <> '') and (SelectionRowSingelStep < StringGrid1.RowCount-1) then begin
       // Abgearbeitete Zelle Makieren
       myRect.Top    := SelectionRowSingelStep;
       myRect.Bottom := SelectionRowSingelStep;
       myRect.Right  := StringGrid1.ColCount;
       myRect.Left   := 1;
       StringGrid1.Selection:= myRect;
       Form_FunctionList.Update;

       // gefundene zeile ausfuehren
       if(StringGrid1.Cells[AColActive,SelectionRowSingelStep] = TEnable ) then AnalyseList(SelectionRowSingelStep, ErrorFound);

       // wurde eine fehler erkannt -> rote lampe an !
       if(ErrDetect = true) then Shape_ErrLamp.Brush.Color:= clRed
       else Shape_ErrLamp.Brush.Color:= clLime;

       UpdateValueForms();
     end;

     // Anzeige programm gestoppt
     Label_ProgStatus.Caption:= TStop;
     Application.ProcessMessages();
end;

procedure TForm_FunctionList.StringGrid1Click(Sender: TObject);
begin
     SelectionRowSingelStep:= 0; // Position fuer das SingelStep  ruecksetzten
end;

procedure TForm_FunctionList.Debug1Click(Sender: TObject);
begin
     Form_Debug.Show;
end;

procedure TForm_FunctionList.UpdateValueForms();

var index    :_WORD;
    CalueStr : string;
    ValueType: string;

begin
     index:= 1;

     Form_Details.UpdateFormDetails();

     while(index < StringGrid1.RowCount) do begin
       if (StringGrid1.Cells[AColDO,index] <> '' ) then begin
         if(StringGrid1.Cells[AColDO,index] = TReadIFK) or (StringGrid1.Cells[AColDO,index] = TReadData) then begin

           //Hex ausgabe
           StringGrid1.Cells[AColRdData,index]:= IntToHex(DataValueArray[index],4);

           // Bin ausgabe
           CalueStr:= intToBinary(DataValueArray[index], 16); // in Bin umwandeln
           Insert('.',CalueStr,5);            // trennzeichen einfuegen
           Insert('.',CalueStr,10);
           Insert('.',CalueStr,15);
           StringGrid1.Cells[AcolRdDataBin,index]:= CalueStr; // Bin ausgabe

         end else if (StringGrid1.Cells[AColDO,index] <> TSetTimer) and (StringGrid1.Cells[AColDO,index] <> TWriteFCT)then begin

           // Hex ausgabe der werte im feld 'wr-data'
           ValueType:= copy(StringGrid1.Cells[AColWrData,index],1,4);
           if(ValueType <> TManuell) and (ValueType <> TZeile) then // nicht den wert eintragen wenn vom user vorgegeben
            StringGrid1.Cells[AColWrData,index]:= ValueType+ IntToHex(DataValueArray[index],4);
         end;
       end;
       index:=index+1;
     end;

     if(Form_BitArrays.CheckBox_AutoUpdate.Checked = true) then begin
       Form_BitArrays.Button_update.Click
     end;
end;

// Lösche  Windows Message Queue
procedure TForm_FunctionList.ClearMessageQueue();
var
  Msg: TMsg;
begin
  while PeekMessage(Msg, 0, 0, $FFFF, pm_Remove) do
  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

// Daten Array Nullen
procedure TForm_FunctionList.DataValueArrayClr();

var index:integer;

begin
     for index:= 1 to 256 do DataValueArray[index]:= 0;
end;




end.
