unit WordSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid,
  AdvOfficePager, DB, ADODB, Buttons, ComCtrls,
  ViewData;

type
  TWordSearchForm = class(TForm)
    grp1: TGroupBox;
    btn2: TButton;
    grp3: TGroupBox;
    dbdvgrd1: TDBAdvGrid;
    dsWord: TDataSource;
    qryWord: TADOQuery;
    tblImportance: TADOTable;
    intfldImportanceID: TIntegerField;
    strfldImportanceName: TStringField;
    strfldImportanceDisp: TStringField;
    dsImportance: TDataSource;
    dsDifficulty: TDataSource;
    tblDifficulty: TADOTable;
    intfldDifficultyID: TIntegerField;
    strfldDifficultyName: TStringField;
    strfldDifficultyDisp: TStringField;
    lblWord: TLabel;
    edtWord: TEdit;
    dblkcbbImportance: TDBLookupComboBox;
    lblImportance: TLabel;
    lblDifficulty: TLabel;
    dblkcbbDifficulty: TDBLookupComboBox;
    btn1: TBitBtn;
    stat1: TStatusBar;
    procedure edtWordExit(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure dbdvgrd1DblClick(Sender: TObject);
    procedure edtWordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbdvgrd1ScrollCell(Sender: TObject; ACol, ARow, ScrollPosition,
      ScrollMin, ScrollMax: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FWord:TWord;

    procedure ShowWords(const LikeWord:string);
    procedure SetWord(const value:string);
    function GetWord:string;
    procedure LocateWord;

    function  GetWordInfo:TWord;
  public
    { Public declarations }
    property Word:string read GetWord write SetWord;
    property WordInfo:TWord read GetWordInfo;
  end;

var
  WordSearchForm: TWordSearchForm;

implementation

uses
  WordExplain, Main;

{$R *.dfm}

procedure TWordSearchForm.btn2Click(Sender: TObject);
begin
  ShowWords(edtWord.Text);
end;

procedure TWordSearchForm.dbdvgrd1DblClick(Sender: TObject);
begin
  if Owner  <> MainForm then
  begin
    Close;
    ModalResult := mrOk;
  end;

//  if not WordExplainForm.Showing then
//    WordExplainForm.ShowModal;

end;

procedure TWordSearchForm.dbdvgrd1ScrollCell(Sender: TObject; ACol, ARow,
  ScrollPosition, ScrollMin, ScrollMax: Integer);
begin
  stat1.Panels[0].Text := Format('µÚ%dÐÐ',[ARow]);
end;

procedure TWordSearchForm.edtWordExit(Sender: TObject);
begin
  LocateWord;
end;

procedure TWordSearchForm.edtWordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if Key = 13 then
//    ShowWords(edtWord.Text);
end;

procedure TWordSearchForm.FormCreate(Sender: TObject);
begin
  FWord := TWord.Create;
end;

procedure TWordSearchForm.FormShow(Sender: TObject);
begin
  edtWord.SetFocus;
end;

procedure TWordSearchForm.ShowWords(const LikeWord:string);
begin
  qryWord.Parameters.ParamByName('Word').Value := LikeWord + '%';
  qryWord.ExecSQL;
  qryWord.Close;
  qryWord.Open;
end;

function TWordSearchForm.GetWord:string;
begin
  if qryWord.RecordCount > 0 then
    Result := qryWord.FieldByName('Word').AsString;
end;

procedure TWordSearchForm.LocateWord;
begin
  if qryWord.RecordCount = 0 then
    exit;

  qryWord.Locate('Word', edtWord.Text, []);
end;

procedure TWordSearchForm.SetWord(const value:string);
begin
  edtWord.Text := value;

  LocateWord;
end;

function  TWordSearchForm.GetWordInfo:TWord;
begin
  if qryWord.RecordCount = 0 then
    exit;

  FWord.Word := qryWord.FieldByName('Word').AsString;

  Result := Fword;
end;

end.
