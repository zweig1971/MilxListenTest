//-----------------------------
// GSI Gesellschaft für
// Schwerionenforschung mbH,
// Darmstadt, Germany
//
// Unit_IFKOnline.pas
//
// Autor           : Zweig,Marcus
// letzte Änderung : 12.09
//-------------------------------
//
//->Unit_IFKOnline
//  sucht und zeigt alle IFKs am bus an.
//  kommen neue IFKs hinzu werden diese in
//  IFK new angezeigt. Verschwinden wärend der
//  suche IFKs werden diese in IFKs unreliable angezeigt
//  wird ueber das menue von unit_main aufgerufen
//-------------------------------

unit Unit_IFKsearch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls, UnitMil, ComCtrls, Menus, GlobaleVar;

type
  TForm_IFK_search = class(TForm)
    Panel1: TPanel;
    Panel5: TPanel;
    ListBox_IFKOnline: TListBox;
    ListBox_IFKNEW: TListBox;
    ListBox_IFKUnreliable: TListBox;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Panel_IFKOnline: TPanel;
    Panel_IFKNew: TPanel;
    Panel_IFKUnreliable: TPanel;
    SpeedButton_startsearch: TSpeedButton;
    Button_Close: TButton;
    Label7: TLabel;
    Label8: TLabel;
    TrackBar_LoopSpeed: TTrackBar;
    Label9: TLabel;
    MainMenu1: TMainMenu;
    Help1: TMenuItem;
    procedure Button_CloseClick(Sender: TObject);
    procedure SpeedButton_startsearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IFKSearch();
    procedure Help1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form_IFK_search: TForm_IFK_search;
  IFKnew: TStrings;
  IFKunreliable: TStrings;
  IFKTemp:TStrings;
  IFKOnHand:integer;


implementation

uses Unit_Help;

{$R *.DFM}

procedure TForm_IFK_search.Button_CloseClick(Sender: TObject);
begin
     if(SpeedButton_startsearch.Down = true)  then SpeedButton_startsearch.Down := false;
     Application.ProcessMessages;
     Form_IFK_search.Update;
     Form_IFK_search.Close;
end;

procedure TForm_IFK_search.SpeedButton_startsearchClick(Sender: TObject);

var IFKaktive:integer;
    ErrStatus:_DWORD;

begin
     //Aktueller IFK bestand aufnehmen
     if (Form_IFK_search.SpeedButton_startsearch.Down = true) then begin

        // Listen loeschen
        IFKOnline.Clear;
        IFKnew.Clear;
        IFKunreliable.Clear;
        IFKaktive:= 0;

        // IFKs suchen & anzeigen
        IFKFound(IFKOnline, IFKaktive);
        ListBox_IFKOnline.Items:= IFKOnline;

        //Aktive IFKs anzahl anzeigen
        Panel_IFKOnline.Caption:= IntToStr(IFKaktive);
        Application.ProcessMessages;
        Form_IFK_search.Update;
     end;

     while (Form_IFK_search.SpeedButton_startsearch.Down = true) do begin
       if(TrackBar_LoopSpeed.Position <> 0) then PCI_TimerWait(Cardauswahl, (TrackBar_LoopSpeed.Position*10), 1, ErrStatus);
       IFKSearch();
     end;
end;

procedure TForm_IFK_search.FormCreate(Sender: TObject);
begin
     IFKnew          := TStringList.Create;// neu hinzugekommene IFKs
     IFKunreliable   := TStringList.Create;// wackelkandidaten
     IFKTemp         := TStringList.Create;
end;

procedure TForm_IFK_search.IFKSearch();

var IFKaktive:integer;
    index:_WORD;
    IndexOfItem:integer;

begin
     index:=0;

     //IFKs suchen
     IFKTemp.Clear;
     IFKFound(IFKTemp, IFKaktive);

     // Nach neuen IFKs suchen
     while index <>  IFKTemp.Count do begin
        IndexOfItem:= IFKOnline.IndexOf(IFKTemp[index]);

        // Neue IFK nicht gefunden
        if(IndexOfItem = -1) then begin
          // pruefen ob die IFK bereits in der neuen liste vorhanden ist
          IndexOfItem:= IFKnew.IndexOf(IFKTemp[index]);
          if(IndexOfItem = -1) then begin
             IFKnew.Add(IFKTemp[index]);  // wenn neu in liste aufnehemen
          end;
        end;
        index:=index+1;
     end;

     // Nach abhanden  gekommenen  IFKs suchen
     index:=0;
     while index < IFKOnline.Count do begin
        IndexOfItem:= IFKTemp.IndexOf(IFKOnline[index]);
        // IFK ist weg
        if(IndexOfItem = -1) then begin
          //prüfen ob die IFK bereits in der unreliable vorhanden  ist
          IndexOfItem:= IFKunreliable.IndexOf(IFKOnline[index]);
          if(IndexOfItem = -1) then begin
             IFKunreliable.Add(IFKOnline[index]);
          end;
        end;
        index:=index+1;
     end;

     //neue liste uebernehmen
     IFKOnline.Clear;
     ListBox_IFKOnline.Clear;
     IFKOnline.Assign(IFKTemp);
 
     ListBox_IFKOnline.Items:= IFKTemp;
     Panel_IFKOnline.Caption:= IntToStr(IFKaktive);
     Form_IFK_search.Update;

     // Pruefen ob alle IFKs noch vorhanden sind
     index:=0;
     while index <> IFKnew.Count do begin
        IndexOfItem:= IFKOnline.IndexOf(IFKnew[index]);

        // eine IFK ist abhanden gekommen -> in die liste unreliable aufnehmen
        if(IndexOfItem = -1) then begin
          //prüfen ob die IFK bereits in listeaufgenommen worden ist
          IndexOfItem:= IFKunreliable.IndexOf(IFKnew[index]);
          if(IndexOfItem = -1) then begin
             IFKunreliable.Add(IFKnew[index]); // wenn neu in liste aufneheme
          end;
        end;
        index:=index+1;
     end;   

     // Ausgabe aktuallisieren
     Panel_IFKNew.Caption:= IntToStr(IFKnew.Count);
     Panel_IFKUnreliable.Caption:= IntToStr(IFKunreliable.Count);

     ListBox_IFKNEW.Items:= IFKnew;
     ListBox_IFKUnreliable.Items:= IFKunreliable;
     Application.ProcessMessages;
     Form_IFK_search.Update;
end;

procedure TForm_IFK_search.Help1Click(Sender: TObject);
begin
     HelpFilename:= DateiNameHelpIFKsearch;
     Form_Help.Show;
end;

end.
