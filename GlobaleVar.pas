//-----------------------------
// GSI Gesellschaft f�r
// Schwerionenforschung mbH,
// Darmstadt, Germany
//
// GlobaleVar.pas
//
// Autor           : Zweig,Marcus
// letzte �nderung : 05.11
//-------------------------------


unit GlobaleVar;


interface

uses UnitMil;

type
 TProperties = record
    ActiveBool   :boolean;
    IFKNrStr     :string;
    FCTCodeStr   :string;
    ManuelFctStr :string;
    WriteDtaStr  :string;
    WrConstRowStr:string;
    OffsetStr    :string;
    CompRowStr   :string;
    CompOnBool   :boolean;
    TimeStr      :string;
    UnitStr      :string;
  end;

const
StringGridCol_0 = 'Nr.';
StringGridCol_1 = 'Do';
StringGridCol_2 = 'IFK';
StringGridCol_3 = 'FCT';
StringGridCol_4 = 'Wr-Data';
StringGridCol_5 = 'Rd-Data';
StringGridCol_6 = 'Data Bin';
StringGridCol_7 = 'Comp';
StringGridCol_8 = 'Active';
StringGridCol_9 = 'Comments';
StringGridCol_99= 'All';

TWriteIFK   = 'Write IFK';
TReadIFK    = 'Read IFK';
TWriteFCT   = 'Write FCT';
TWriteData  = 'Write Data';
TReadData   = 'Read Data';
TWrCmd      = 'Write Cmd';
TSetTimer   = 'Timer';
TConstante  = 'Constante';

TPropCount  = 'Counter';
TPropICount = 'nCounter';
//TPropRDDta  = 'RD Data';
//TPropWRDta  = 'WR Data';
TPropRowNr  = 'Row Nr';
TPropManuel = 'Manuel';

TiCounter   = 'nC: ';
TCounter    = ' C: ';
TZeile      = ' Z: ';
TManuell    = ' M: ';
TTimer      = ' T: ';
TOffset     = ' +: ';
THex        = 'h-';
TBin        = 'b-';

TMs         = 'ms';
Tus         = 'us';

TEmpty      = '---';
TEnable     = 'EN';
TDisable    = 'X';
TErr        = 'ERR';

TRun        = 'Running';
TStop       = 'Stop';

VerzDateiHelp = 'Help';

ManHexInput     = '>CCCC';
EditOffsetInput = '>CCCC';
ManZeilEmpty    = '000';
WRConstEmpty    = '0000';
OffsetEmpty     = '0000';
FCTManEmpty     = '00';
PropEmpty       = 'NIL';

ComBoxFCTDef    = 0;
ComBoxWRDataDef = 0;
ComBoxCmpDef    = 0;
ComBoxUnitDef   = 0;

MasEdit_AddManIFK_Mask = 'aa';

AColNr        = 0;
AColDO        = 1;
AColIFK       = 2;
AColFCT       = 3;
AColWrData    = 4;
AColRdData    = 5;
AcolRdDataBin = 6;
AColCmp       = 7;
AColActive    = 8;
AColComment   = 9;

MaxCounterSend = $10000;

DateiNameHelpBitArrays     = 'HBitArrays.txt';
DateiNameHelpDetails       = 'HDetails.txt';
DateiNameHelpIFKOnline     = 'HIFKOnline.txt';
DateiNameHelpIFKsearch     = 'HIFKsearch.txt';
DateiNameHelpMain          = 'HMain.txt';
DateiNameHelpPropertiest   = 'HPropertiest.txt';
DateiNameHelpSearchReplace = 'HSearchReplace.txt';
DateiWriteFTC              = 'WriteFCTs.txt';
DateiReadFTC               = 'ReadFCTs.txt';
DateiAllFCT                = 'AllFCT.txt';



var MainLoopCount    :_DWORD;
    VerifyErrCount   :_DWORD;
    ErrCount         :_DWORD;
    ErrDetect        :boolean;
    TabelIndex       :integer;
    IFKaktive        :integer;

    DataValueArray   : array[1..256] of _WORD;
    
    Anwendungsverzeichnis:string;

implementation

end.
