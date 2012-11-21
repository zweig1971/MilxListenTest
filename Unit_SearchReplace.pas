//-----------------------------
// GSI Gesellschaft für
// Schwerionenforschung mbH,
// Darmstadt, Germany
//
// Unit_SearchReplace.pas
//
// Autor           : Zweig,Marcus
// letzte Änderung : 01.10
//-------------------------------


unit Unit_SearchReplace;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, GlobaleVar, grids, Mask;

type
  TForm_SearchReplace = class(TForm)
    Button_Go: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    SearchFor_Edit: TEdit;
    ReplaceIt_Edit: TEdit;
    Label3: TLabel;
    ComboBox_SearchIn: TComboBox;
    procedure H1Click(Sender: TObject);
    procedure Button_GoClick(Sender: TObject);
    procedure SearchFor_EditKeyPress(Sender: TObject; var Key: Char);
    procedure ReplaceIt_EditKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form_SearchReplace: TForm_SearchReplace;

implementation

uses Unit_Help, Unit_Main;

{$R *.DFM}

procedure TForm_SearchReplace.H1Click(Sender: TObject);

var HelpFilename:string;

begin
     HelpFilename:= DateiNameHelpSearchReplace;
     Form_Help.Show;
end;

//Sucht die gesammte tabelle nach den vorgegebenen Zeiche durch
//und ersetzt diese wenn gewünscht
procedure TForm_SearchReplace.Button_GoClick(Sender: TObject);

var RowIndex     :integer; //laufender zeilen index
    ColIndex     :integer; //laufender spalten index

    RowMaxIndex  :integer; // maximale obere grenze zeile
    ColMaxIndex  :integer; // maximale obere grenze spalte

    RowStartIndex:integer; // startwert fuer zeilen index
    ColStartIndex:integer; // startwert für spalten index

    button       :integer;
    myRect       :TGridRect;
    SScanValue   :string;
    IPos         :integer;
    SearchBreak  :boolean;

begin
     SearchBreak:= false;

     case ComboBox_SearchIn.ItemIndex+1 of
          AColDO:    begin
                       RowStartIndex:= 1;
                       RowMaxIndex  := Form_FunctionList.StringGrid1.RowCount-1;

                       ColStartIndex:= AColDO;
                       ColMaxIndex  := AColDO;
                     end;

          AColIFK:   begin
                       RowStartIndex:= 1;
                       RowMaxIndex  := Form_FunctionList.StringGrid1.RowCount-1;

                       ColStartIndex:= AColIFK;
                       ColMaxIndex  := AColIFK;
                     end;

          AColFCT:   begin
                       RowStartIndex:= 1;
                       RowMaxIndex  := Form_FunctionList.StringGrid1.RowCount-1;

                       ColStartIndex:= AColFCT;
                       ColMaxIndex  := AColFCT;
                     end;

          AColWrData:begin
                       RowStartIndex:= 1;
                       RowMaxIndex  := Form_FunctionList.StringGrid1.RowCount-1;

                       ColStartIndex:= AColWrData;
                       ColMaxIndex  := AColWrData;
                     end;

          AColRdData:begin
                       RowStartIndex:= 1;
                       RowMaxIndex  := Form_FunctionList.StringGrid1.RowCount-1;

                       ColStartIndex:= AColRdData;
                       ColMaxIndex  := AColRdData;
                     end;
           else begin
                   ColStartIndex:= 1;
                   RowStartIndex:= 1;
                   RowMaxIndex:= Form_FunctionList.StringGrid1.RowCount-1;
                   ColMaxIndex:= Form_FunctionList.StringGrid1.ColCount-1;
                 end;
    end;

    RowIndex:= RowStartIndex;
    ColIndex:= ColStartIndex;

     while (RowIndex <= RowMaxIndex) and (SearchBreak = false) do begin
       while(ColIndex <= ColMaxIndex) and (SearchBreak = false) do begin

         //den gesuchten string innerhalb der zelle suchen
         SScanValue:= Form_FunctionList.StringGrid1.Cells[ColIndex, RowIndex];
         IPos:= pos(SearchFor_Edit.Text, SScanValue);

         if(IPos <> 0) then begin
         //if(Form_FunctionList.StringGrid1.Cells[ColIndex, RowIndex] = Edit_SearchFor.Text) then begin

           // Gefundene Zelle Makieren
           myRect.Top    := RowIndex;
           myRect.Bottom := RowIndex;
           myRect.Right  := ColIndex;
           myRect.Left   := ColIndex;

           // nur makieren wenn nicht schon makiert
        //   if not(Form_FunctionList.IsCellSelected(Form_FunctionList.StringGrid1, RowIndex, ColIndex)) then begin
             Form_FunctionList.StringGrid1.Selection:= myRect;
             Form_FunctionList.Update;

         //  end;

           button:= Application.messagebox('Found something, replace ?','Wuff Wuff',35);
           case button of

                2: SearchBreak:=true;

                6: begin
                   Form_FunctionList.StringGrid1.Cells[ColIndex, RowIndex] :=
                   StringReplace(SScanValue, SearchFor_Edit.Text, ReplaceIt_Edit.Text,[rfReplaceAll]);
                   end;
           end;
         end;
         ColIndex:=ColIndex+1;
        end;
        RowIndex:=RowIndex+1;
        ColIndex:=ColStartIndex;
     end;
     Application.MessageBox('End of list has been reached !', 'Wuff Wuff', 64);
end;

procedure TForm_SearchReplace.SearchFor_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
   // if(Key in ['a'..'z']) Then Key:= UpCase(Key);
    //  if(Key in ['a'..'z']) or (Key in ['A'..'Z']) Then Key:= Key;
end;

procedure TForm_SearchReplace.ReplaceIt_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
     //if(Key in ['a'..'z']) Then Key:= UpCase(Key);
end;

procedure TForm_SearchReplace.FormCreate(Sender: TObject);
begin
     ComboBox_SearchIn.Items.Add(StringGridCol_99);
     ComboBox_SearchIn.Items.Add(StringGridCol_2);
     ComboBox_SearchIn.Items.Add(StringGridCol_3);
     ComboBox_SearchIn.Items.Add(StringGridCol_4);
     ComboBox_SearchIn.Items.Add(StringGridCol_5);
     ComboBox_SearchIn.ItemIndex := 0;
end;

procedure TForm_SearchReplace.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Form_FunctionList.StringGrid1.Selection:= TGridRect(Rect(1, 1, 1, 1));
end;

end.
