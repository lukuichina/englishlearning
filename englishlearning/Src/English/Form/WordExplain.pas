unit WordExplain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvOfficePager, ExtCtrls,
  Buttons, Grids, AdvObj, DBAdvGrid, Mask, DBCtrls, DB, ADODB, Menus,
  AdvMenus, ActnList, ImgList, BaseGrid, AdvGrid;

type
  TWordExplainForm = class(TForm)
    advfcpgr1: TAdvOfficePager;
    advfcpg1: TAdvOfficePage;
    grp1: TGroupBox;
    advfcpg2: TAdvOfficePage;
    dbdvgrd1: TDBAdvGrid;
    btnWordSearch: TButton;
    edtWord: TEdit;
    lblWord: TLabel;
    qryWordExplanation: TADOQuery;
    dsWordExplanation: TDataSource;
    ilGridPopMenu: TImageList;
    actlst1: TActionList;
    actAddExplanation: TAction;
    actImportToExcel: TAction;
    actDeleteExplanation: TAction;
    advpmn1: TAdvPopupMenu;
    mnuAddExplanation: TMenuItem;
    mnuExportToCsv: TMenuItem;
    mnuDelete: TMenuItem;
    cmdAdd: TADOCommand;
    cmdUpdate: TADOCommand;
    cmdDelete: TADOCommand;
    qryWord: TADOQuery;
    actViewPicture: TAction;
    N1: TMenuItem;
    actUpdateExplanation: TAction;
    mnuUpdateExplanation: TMenuItem;
    procedure btnWordSearchClick(Sender: TObject);
    procedure actAddExplanationExecute(Sender: TObject);
    procedure actDeleteExplanationExecute(Sender: TObject);
    procedure actViewPictureExecute(Sender: TObject);
    procedure actUpdateExplanationExecute(Sender: TObject);
    procedure edtWordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edtWordExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbdvgrd1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FIsChanged:Boolean;
    FWord:string;
    procedure SetWord(const Word:string);
    procedure ShowWordExplanation;
    function  GetWord:string;
    function  IsWordExist(const word:string):Boolean;

  public
    { Public declarations }
    property Word:string read GetWord write SetWord;
    property IsChanged:Boolean read FIsChanged;
  end;

var
  WordExplainForm: TWordExplainForm;

implementation

uses
  WordSearch, ExplanationInput, DataModule, WordPicture;

{$R *.dfm}

procedure TWordExplainForm.actAddExplanationExecute(Sender: TObject);
begin
  try
    ExplanationInputForm := TExplanationInputForm.Create(nil);
    ExplanationInputForm.Word := edtWord.Text;

    if ExplanationInputForm.ShowModal  <> mrOk then
      Exit;

    cmdAdd.Parameters.ParamByName('Word').Value := ExplanationInputForm.Word;
    cmdAdd.Parameters.ParamByName('WordType').Value := ExplanationInputForm.WordType;
    cmdAdd.Parameters.ParamByName('Word2').Value := ExplanationInputForm.Word;
    cmdAdd.Parameters.ParamByName('WordType2').Value := ExplanationInputForm.WordType;

    cmdAdd.Parameters.ParamByName('Explanation').Value := ExplanationInputForm.WordExplanation;
    cmdAdd.Parameters.ParamByName('ImportanceLevel').Value := ExplanationInputForm.ImportanceLevel;
    cmdAdd.Parameters.ParamByName('DifficultyLevel').Value := ExplanationInputForm.DifficultyLevel;
    cmdAdd.Execute;

    FIsChanged := True;

    qryWordExplanation.Close;
    qryWordExplanation.Open;
  finally
    ExplanationInputForm.Free;
  end;
end;

procedure TWordExplainForm.actDeleteExplanationExecute(Sender: TObject);
begin
    cmdDelete.Parameters.ParamByName('Word').Value := qryWordExplanation.FieldByName('Word').AsVariant;
    cmdDelete.Parameters.ParamByName('WordType').Value := qryWordExplanation.FieldByName('WordTypeID').AsVariant;
    cmdDelete.Parameters.ParamByName('ExplanationID').Value := qryWordExplanation.FieldByName('ExplanationID').AsVariant;
    cmdDelete.Execute;

    FIsChanged := True;

    qryWordExplanation.Close;
    qryWordExplanation.Open;
end;

procedure TWordExplainForm.actUpdateExplanationExecute(Sender: TObject);
begin
  try
    ExplanationInputForm := TExplanationInputForm.Create(nil);
    ExplanationInputForm.Word := edtWord.Text;
    ExplanationInputForm.dblkcbbWordType.Enabled := False;
    ExplanationInputForm.dblkcbbWordType.KeyValue :=
        qryWordExplanation.FieldByName('WordTypeID').AsInteger;
    ExplanationInputForm.dblkcbbImportance.KeyValue :=
        qryWordExplanation.FieldByName('ImportanceID').AsInteger;
    ExplanationInputForm.dblkcbbDifficulty.KeyValue :=
        qryWordExplanation.FieldByName('DifficultyID').AsInteger;
    ExplanationInputForm.edt1.Text := qryWordExplanation.FieldByName('Explanation').AsString;

    if ExplanationInputForm.ShowModal  <> mrOk then
      Exit;

    cmdUpdate.Parameters.ParamByName('Word').Value := ExplanationInputForm.Word;
    cmdUpdate.Parameters.ParamByName('WordType').Value := ExplanationInputForm.WordType;
    cmdUpdate.Parameters.ParamByName('ExplanationID').Value := qryWordExplanation.FieldByName('ExplanationID').AsVariant;

    cmdUpdate.Parameters.ParamByName('Explanation').Value := ExplanationInputForm.WordExplanation;
    cmdUpdate.Parameters.ParamByName('ImportanceLevel').Value := ExplanationInputForm.ImportanceLevel;
    cmdUpdate.Parameters.ParamByName('DifficultyLevel').Value := ExplanationInputForm.DifficultyLevel;
    cmdUpdate.Execute;

    FIsChanged := True;

    qryWordExplanation.Close;
    qryWordExplanation.Open;
  finally
    ExplanationInputForm.Free;
  end;
end;

procedure TWordExplainForm.actViewPictureExecute(Sender: TObject);
var
  ExplanationID:Integer;
begin
  try
    WordPictureForm := TWordPictureForm.Create(nil);
    WordPictureForm.Word := edtWord.Text;
    WordPictureForm.WordType := qryWordExplanation.FieldByName('WordTypeID').AsInteger;
    WordPictureForm.ExplanationID := qryWordExplanation.FieldByName('ExplanationID').AsInteger;
    WordPictureForm.ShowModal;

    if WordPictureForm.IsChanged then
    begin
      FIsChanged := True;

      ExplanationID := qryWordExplanation.FieldByName('ExplanationID').AsInteger;

      dbdvgrd1.BeginUpdate;
      ShowWordExplanation;
      qryWordExplanation.Locate('ExplanationID', ExplanationID, []);
      dbdvgrd1.EndUpdate;
    end;
  finally
    WordPictureForm.Free;
  end;
end;

procedure TWordExplainForm.btnWordSearchClick(Sender: TObject);
begin
  try
    WordSearchForm := TWordSearchForm.Create(nil);
    WordSearchForm.Word := edtWord.Text;

    if WordSearchForm.ShowModal <> mrOk then
    begin
      if not IsWordExist(edtWord.Text) then
        edtWord.SetFocus;

      exit;
    end;

    edtWord.Text := WordSearchForm.Word;

    ShowWordExplanation;
  finally
    WordSearchForm.Free;
  end;
end;

procedure TWordExplainForm.dbdvgrd1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i:Integer;
begin
  for i := 0 to advpmn1.Items.Count - 1 do
    advpmn1.Items[i].Enabled := edtWord.Text <> '';
end;

procedure TWordExplainForm.edtWordExit(Sender: TObject);
var
  p:TPoint;
begin
  if edtWord.Text = '' then
    Exit;

  GetCursorPos(p);
  p:= ScreenToClient(p);

  if PtInRect(btnWordSearch.BoundsRect, p) then
    exit;

  if not IsWordExist(edtWord.Text) then
  begin
    MessageDlg('单词不存在，请重新输入或选择单词！', mtError, [mbOK], 0);
    edtWord.SetFocus;
    exit;
  end;

  ShowWordExplanation;
end;

procedure TWordExplainForm.edtWordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key <> VK_RETURN then
    exit;

  ShowWordExplanation;
end;

procedure TWordExplainForm.FormCreate(Sender: TObject);
var
  i:Integer;
begin
  for i := 0 to advpmn1.Items.Count - 1 do
    advpmn1.Items[i].Enabled := False;
end;

procedure TWordExplainForm.FormShow(Sender: TObject);
begin
  if edtWord.Text = '' then
    edtWord.SetFocus
  else
    ShowWordExplanation;
end;

procedure TWordExplainForm.SetWord(const Word:string);
begin
  edtWord.Text := Word;
  FWord := Word;
end;

function TWordExplainForm.GetWord:string;
begin
  Result := FWord;
end;

procedure TWordExplainForm.ShowWordExplanation;
begin
  qryWordExplanation.Parameters.ParamByName('Word').Value := edtWord.Text;

  qryWordExplanation.Close;
  qryWordExplanation.Open;
end;

function TWordExplainForm.IsWordExist(const word: string):Boolean;
begin
  qryWord.Parameters.ParamByName('Word').Value := word;

  qryWord.Close;
  qryWord.Open;

  Result := qryWord.RecordCount > 0;
end;

end.
