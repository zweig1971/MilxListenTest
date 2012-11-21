program Project1;

uses
  Forms,
  Unit_Main in 'Unit_Main.pas' {Form_FunctionList},
  Unit_Details in 'Unit_Details.pas' {Form_Details},
  Unit_Properties in 'Unit_Properties.pas' {Form_Properties},
  Unit_ChoosePCI in 'Unit_ChoosePCI.pas' {Form_Choose_PCI_MIL_Card},
  Unit_IFKsearch in 'Unit_IFKsearch.pas' {Form_IFK_search},
  UnitMil in 'PCIMilTreiber_DelphiUnits\UnitMil.pas',
  GlobaleVar in 'GlobaleVar.pas',
  Unit_BitArrays in 'Unit_BitArrays.pas' {Form_BitArrays},
  Unit_IFKOnline in 'Unit_IFKOnline.pas' {Form_IFKOnline},
  Unit_Help in 'Unit_Help.pas' {Form_Help},
  Info in 'Info.pas' {Form_Info},
  Unit_BitDescrip in 'Unit_BitDescrip.pas' {Form_BitDescription},
  Unit_SearchReplace in 'Unit_SearchReplace.pas' {Form_SearchReplace},
  Unit_Debug in 'Unit_Debug.pas' {Form_Debug};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm_FunctionList, Form_FunctionList);
  Application.CreateForm(TForm_Details, Form_Details);
  Application.CreateForm(TForm_Properties, Form_Properties);
  Application.CreateForm(TForm_Choose_PCI_MIL_Card, Form_Choose_PCI_MIL_Card);
  Application.CreateForm(TForm_IFK_search, Form_IFK_search);
  Application.CreateForm(TForm_BitArrays, Form_BitArrays);
  Application.CreateForm(TForm_IFKOnline, Form_IFKOnline);
  Application.CreateForm(TForm_Help, Form_Help);
  Application.CreateForm(TForm_Info, Form_Info);
  Application.CreateForm(TForm_BitDescription, Form_BitDescription);
  Application.CreateForm(TForm_SearchReplace, Form_SearchReplace);
  Application.CreateForm(TForm_Debug, Form_Debug);
  Application.Run;
end.
