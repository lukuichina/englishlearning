unit WordSearchDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WordSearch, DB, ADODB, ComCtrls,
  Buttons, DBCtrls, StdCtrls,
  ViewData;

type
  TWordSearchDialogForm = class(TWordSearchForm)
    grpSelectWords: TGroupBox;
    btnAdd: TButton;
    btnDel: TButton;
    lstSelectWords: TListBox;
    btnClear: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure dbdvgrd1DblClick(Sender: TObject);
  private
    { Private declarations }
    FWords:TWords;

    function  GetWordsInfo:TWords;
  public
    { Public declarations }
    property WordsInfo:TWords read GetWordsInfo;
  end;

var
  WordSearchDialogForm: TWordSearchDialogForm;

implementation

{$R *.dfm}

procedure TWordSearchDialogForm.btnAddClick(Sender: TObject);
begin
  inherited;

  if qryWord.RecordCount = 0 then
    exit;

  if lstSelectWords.Items.IndexOf(qryWord.FieldByName('Word').AsString) > -1 then
    exit;

  lstSelectWords.Items.Add(qryWord.FieldByName('Word').AsString);
end;

procedure TWordSearchDialogForm.btnClearClick(Sender: TObject);
begin
  inherited;

  lstSelectWords.Items.Clear;
end;

procedure TWordSearchDialogForm.btnDelClick(Sender: TObject);
begin
  inherited;

  lstSelectWords.Items.Delete(lstSelectWords.ItemIndex);
end;

procedure TWordSearchDialogForm.dbdvgrd1DblClick(Sender: TObject);
begin
  //inherited;
  btnAddClick(Sender);
end;

function  TWordSearchDialogForm.GetWordsInfo:TWords;
var
  i:integer;
begin
  if qryWord.RecordCount = 0 then
    exit;

  if lstSelectWords.Items.Count = 0 then
    exit;

  SetLength(FWords, lstSelectWords.Items.Count);

  for i := Low(FWords) to High(FWords) do
  begin
    FWords[i]:= TWord.Create;
    FWords[i].Word := lstSelectWords.Items[i];
  end;

  Result := FWords;
end;


end.
