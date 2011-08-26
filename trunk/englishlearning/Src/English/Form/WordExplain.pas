unit WordExplain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvOfficePager,
  Buttons, DBAdvGrid, DBCtrls, DB, ADODB, Menus,
  AdvMenus, ActnList, AdvGrid, ImgList, Grids, AdvObj, BaseGrid;

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
    mnuViewPicture: TMenuItem;
    actUpdateExplanation: TAction;
    mnuUpdateExplanation: TMenuItem;
    actViewExtention: TAction;
    mnuViewExtention: TMenuItem;
    actKing: TAction;
    btnKing: TButton;
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
    procedure advpmn1Popup(Sender: TObject);
    procedure actViewExtentionExecute(Sender: TObject);
    procedure btnKingClick(Sender: TObject);
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
  WordSearch, ExplanationInputDialog, DataModule, WordPicture, WordExtension, ShellAPI,
  CommonInfo;

{$R *.dfm}

procedure TWordExplainForm.actAddExplanationExecute(Sender: TObject);
begin
  try
    ExplanationInputDialogForm := TExplanationInputDialogForm.Create(nil);
    ExplanationInputDialogForm.Word := edtWord.Text;

    if ExplanationInputDialogForm.ShowModal  <> mrOk then
      Exit;

    cmdAdd.Parameters.ParamByName('Word').Value := ExplanationInputDialogForm.Word;
    cmdAdd.Parameters.ParamByName('WordType').Value := ExplanationInputDialogForm.WordType;
    cmdAdd.Parameters.ParamByName('Word2').Value := ExplanationInputDialogForm.Word;
    cmdAdd.Parameters.ParamByName('WordType2').Value := ExplanationInputDialogForm.WordType;

    cmdAdd.Parameters.ParamByName('Explanation').Value := ExplanationInputDialogForm.WordExplanation;
    cmdAdd.Parameters.ParamByName('ImportanceLevel').Value := ExplanationInputDialogForm.ImportanceLevel;
    cmdAdd.Parameters.ParamByName('DifficultyLevel').Value := ExplanationInputDialogForm.DifficultyLevel;
    cmdAdd.Execute;

    FIsChanged := True;

    qryWordExplanation.Close;
    qryWordExplanation.Open;
  finally
    ExplanationInputDialogForm.Free;
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
    ExplanationInputDialogForm := TExplanationInputDialogForm.Create(nil);
    ExplanationInputDialogForm.Word := edtWord.Text;
//    ExplanationInputDialogForm.dblkcbbWordType.Enabled := False;
//    ExplanationInputDialogForm.dblkcbbWordType.KeyValue :=
//        qryWordExplanation.FieldByName('WordTypeID').AsInteger;
//    ExplanationInputDialogForm.dblkcbbImportance.KeyValue :=
//        qryWordExplanation.FieldByName('ImportanceID').AsInteger;
//    ExplanationInputDialogForm.dblkcbbDifficulty.KeyValue :=
//        qryWordExplanation.FieldByName('DifficultyID').AsInteger;
    ExplanationInputDialogForm.dbrgrpWordType.Enabled := False;
    ExplanationInputDialogForm.dbrgrpWordType.Value :=
        qryWordExplanation.FieldByName('WordTypeID').AsString;
    ExplanationInputDialogForm.dbrgrpImportance.Value :=
        qryWordExplanation.FieldByName('ImportanceID').AsString;
    ExplanationInputDialogForm.dbrgrpDifficulty.Value :=
        qryWordExplanation.FieldByName('DifficultyID').AsString;
    ExplanationInputDialogForm.edt1.Text := qryWordExplanation.FieldByName('Explanation').AsString;

    if ExplanationInputDialogForm.ShowModal  <> mrOk then
      Exit;

    cmdUpdate.Parameters.ParamByName('Word').Value := ExplanationInputDialogForm.Word;
    cmdUpdate.Parameters.ParamByName('WordType').Value := ExplanationInputDialogForm.WordType;
    cmdUpdate.Parameters.ParamByName('ExplanationID').Value := qryWordExplanation.FieldByName('ExplanationID').AsVariant;

    cmdUpdate.Parameters.ParamByName('Explanation').Value := ExplanationInputDialogForm.WordExplanation;
    cmdUpdate.Parameters.ParamByName('ImportanceLevel').Value := ExplanationInputDialogForm.ImportanceLevel;
    cmdUpdate.Parameters.ParamByName('DifficultyLevel').Value := ExplanationInputDialogForm.DifficultyLevel;
    cmdUpdate.Execute;

    FIsChanged := True;

    qryWordExplanation.Close;
    qryWordExplanation.Open;
  finally
    ExplanationInputDialogForm.Free;
  end;
end;

procedure TWordExplainForm.actViewExtentionExecute(Sender: TObject);
var
  ExplanationID:Integer;
begin
  try
    WordExtensionForm := TWordExtensionForm.Create(nil);
    WordExtensionForm.Word := edtWord.Text;
//    WordExtensionForm.WordType := 0;
//    WordExtensionForm.ExplanationID := 0;
    WordExtensionForm.ShowModal;

    if WordExtensionForm.IsChanged then
    begin
      FIsChanged := True;

      ExplanationID := qryWordExplanation.FieldByName('ExplanationID').AsInteger;

      dbdvgrd1.BeginUpdate;
      ShowWordExplanation;
      qryWordExplanation.Locate('ExplanationID', ExplanationID, []);
      dbdvgrd1.EndUpdate;
    end;
  finally
    WordExtensionForm.Free;
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

procedure TWordExplainForm.advpmn1Popup(Sender: TObject);
begin
  mnuUpdateExplanation.Enabled := (qryWordExplanation.RecordCount > 0) and
   (dbdvgrd1.RowSelectCount > 0);
  mnuDelete.Enabled := (qryWordExplanation.RecordCount > 0) and
   (dbdvgrd1.RowSelectCount > 0);
  mnuViewPicture.Enabled := (qryWordExplanation.RecordCount > 0) and
   (dbdvgrd1.RowSelectCount > 0);
end;

procedure TWordExplainForm.btnKingClick(Sender: TObject);
var
  Word:string;
  URL:string;
begin
  if Trim(edtWord.Text) = '' then
  begin
    MessageDlg('没有选择单词对象，请选择对象后再进行该处理！', mtError, [mbOK], 0);
    exit;
  end;

  Word := edtWord.Text;
  URL := 'http://www.iciba.com/' + Word;
  ShellExecute(handle, 'open', PWideChar(configInfo.Browser), PWideChar(URL), nil, SW_SHOWNORMAL);
  //ShellExecute(handle, 'open', PWideChar(URL), nil, nil, SW_SHOWNORMAL);
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

initialization
  RegisterClass(TWordExplainForm);

end.
