unit WordInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, AdvObj, BaseGrid,
  AdvGrid, DBAdvGrid, DB, ADODB, StdCtrls, ExtCtrls, DBCtrls, AdvGroupBox,
  Buttons, Menus, AdvMenus, ActnList, ImgList, ShellAPI;

type
  TWordInputForm = class(TForm)
    grpWord: TGroupBox;
    grdWord: TDBAdvGrid;
    grp1: TGroupBox;
    dsImportance: TDataSource;
    dsDifficulty: TDataSource;
    tblDifficulty: TADOTable;
    intfldDifficultyID: TIntegerField;
    strfldDifficultyName: TStringField;
    strfldDifficultyDisp: TStringField;
    tblImportance: TADOTable;
    intfldImportanceID: TIntegerField;
    strfldImportanceName: TStringField;
    strfldImportanceDisp: TStringField;
    cmdWord: TADOCommand;
    dsWord: TDataSource;
    tblWord: TADOTable;
    strfldWordWord: TStringField;
    intfldWordImportanceLevel: TIntegerField;
    intfldWordDifficultyLevel: TIntegerField;
    qryWord: TADOQuery;
    grp3: TGroupBox;
    dblkcbbDifficultyEdit: TDBLookupComboBox;
    lblDifficultyEdit: TLabel;
    lblImportanceEdit: TLabel;
    dblkcbbImportanceEdit: TDBLookupComboBox;
    edtWordEdit: TEdit;
    lblWordEdit: TLabel;
    dsDifficultyEdit: TDataSource;
    tblDifficultyEdit: TADOTable;
    intfld1: TIntegerField;
    strfld1: TStringField;
    strfld2: TStringField;
    tblImportanceEdit: TADOTable;
    intfld2: TIntegerField;
    strfld3: TStringField;
    strfld4: TStringField;
    dsImportanceEdit: TDataSource;
    grp4: TGroupBox;
    lblDifficulty: TLabel;
    dblkcbbDifficulty: TDBLookupComboBox;
    dblkcbbImportance: TDBLookupComboBox;
    lblImportance: TLabel;
    btnWord: TButton;
    edtWord: TEdit;
    lblWord: TLabel;
    pnl1: TPanel;
    btnA: TButton;
    btnB: TButton;
    btnC: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    btn7: TButton;
    btn8: TButton;
    btn9: TButton;
    btn10: TButton;
    btn11: TButton;
    btn12: TButton;
    btn13: TButton;
    btn14: TButton;
    btn15: TButton;
    btn16: TButton;
    btn17: TButton;
    btn18: TButton;
    btn19: TButton;
    btn20: TButton;
    btn21: TButton;
    btn22: TButton;
    btn23: TButton;
    btn24: TButton;
    btn1: TButton;
    btnA2Z: TButton;
    btnDelete: TBitBtn;
    btnUpdate: TBitBtn;
    cmdWordUpdate: TADOCommand;
    cmdWordDelete: TADOCommand;
    advpmn1: TAdvPopupMenu;
    mnuExportToCsv: TMenuItem;
    mnuDelete: TMenuItem;
    actlst1: TActionList;
    actImportToExcel: TAction;
    actDeleteWord: TAction;
    ilGridPopMenu: TImageList;
    mnuWordExplanation: TMenuItem;
    actViewExplanation: TAction;
    actViewPicture: TAction;
    mnuViewPicture: TMenuItem;
    qryWordNoSort: TADOQuery;
    dlgSave1: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure btnWordClick(Sender: TObject);
    procedure grdWordSelectionChanged(Sender: TObject; ALeft, ATop, ARight,
      ABottom: Integer);
    procedure qryWordMoveComplete(DataSet: TCustomADODataSet;
      const Reason: TEventReason; const Error: Error;
      var EventStatus: TEventStatus);
    procedure btnAClick(Sender: TObject);
    procedure btnA2ZClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure actImportToExcelExecute(Sender: TObject);
    procedure actDeleteWordExecute(Sender: TObject);
    procedure edtWordExit(Sender: TObject);
    procedure actViewExplanationExecute(Sender: TObject);
    procedure actViewPictureExecute(Sender: TObject);
    procedure edtWordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdWordCanSort(Sender: TObject; ACol: Integer;
      var DoSort: Boolean);
  private
    { Private declarations }
    procedure ShowCurrentWord;
    procedure ShowWords(const LikeWord:string);
    procedure ShowRecordCount;
    procedure SetRowHeader;
  public
    { Public declarations }
  end;

var
  WordInputForm: TWordInputForm;

implementation

uses
  DataModule, Excel, WordExplain, WordPicture;

{$R *.dfm}

procedure TWordInputForm.actDeleteWordExecute(Sender: TObject);
begin
  if edtWordEdit.Text = '' then
    exit;

  cmdWordDelete.Parameters.ParamByName('Word').Value := edtWordEdit.Text;
  cmdWordDelete.Execute;

  grdWord.BeginUpdate;
  ShowWords('%');

  qryWord.Locate('Word', edtWordEdit.Text, []);
  grdWord.EndUpdate;
end;

procedure TWordInputForm.actImportToExcelExecute(Sender: TObject);
begin
  CopyDbAdvDataToExcel([grdWord]);
//  if not dlgSave1.Execute then
//    exit;
//
//  grdWord.SaveToXLS(dlgSave1.FileName, True);
//
//  ShellExecute(handle, 'open', PWideChar(dlgSave1.FileName), nil, nil, SW_SHOWNORMAL);
end;

procedure TWordInputForm.actViewExplanationExecute(Sender: TObject);
begin
  try
    WordExplainForm := TWordExplainForm.Create(nil);
    WordExplainForm.Word := qryWord.FieldByName('Word').AsString;
    WordExplainForm.ShowModal;

    if WordExplainForm.IsChanged then
    begin
      grdWord.BeginUpdate;

      ShowWords('%');

      qryWord.Locate('Word', edtWordEdit.Text, []);

      grdWord.EndUpdate;
    end;
  finally
    WordExplainForm.Free;
  end;
end;

procedure TWordInputForm.actViewPictureExecute(Sender: TObject);
begin
  try
    WordPictureForm := TWordPictureForm.Create(nil);
    WordPictureForm.Word := qryWord.FieldByName('Word').AsString;
    WordPictureForm.WordType := 0;//qryWord.FieldByName('WordTypeID').AsInteger;
    WordPictureForm.ExplanationID := 0;
    WordPictureForm.ShowModal;

    if WordPictureForm.IsChanged then
    begin
      grdWord.BeginUpdate;

      ShowWords('%');

      qryWord.Locate('Word', edtWordEdit.Text, []);

      grdWord.EndUpdate;
    end;
  finally
    WordPictureForm.Free;
  end;
end;

procedure TWordInputForm.btnA2ZClick(Sender: TObject);
begin
  ShowWords('%');
end;

procedure TWordInputForm.btnAClick(Sender: TObject);
begin
  SetBkColor((Sender as TButton).Handle, clRed);
  ShowWords((Sender as TButton).Caption + '%');

  ShowCurrentWord;
end;

procedure TWordInputForm.btnDeleteClick(Sender: TObject);
begin
  actDeleteWordExecute(Sender);
//  if edtWordEdit.Text = '' then
//    exit;
//
//  cmdWordDelete.Parameters.ParamByName('Word').Value := edtWordEdit.Text;
//  cmdWordDelete.Execute;
//
//  ShowWords('%');
//
//  qryWord.Locate('Word', edtWordEdit.Text, []);
end;

procedure TWordInputForm.btnUpdateClick(Sender: TObject);
begin
  if edtWordEdit.Text = '' then
    exit;

  cmdWordUpdate.Parameters.ParamByName('Word').Value := edtWordEdit.Text;
  cmdWordUpdate.Parameters.ParamByName('ImportanceLevel').Value := dblkcbbImportanceEdit.KeyValue;
  cmdWordUpdate.Parameters.ParamByName('DifficultyLevel').Value := dblkcbbDifficultyEdit.KeyValue;
  cmdWordUpdate.Execute;

  ShowWords('%');

  qryWord.Locate('Word', edtWordEdit.Text, []);
end;

procedure TWordInputForm.btnWordClick(Sender: TObject);
begin
  if edtWord.Text = '' then
    exit;

  cmdWord.Parameters.ParamByName('Word').Value := edtWord.Text;
  cmdWord.Parameters.ParamByName('ImportanceLevel').Value := dblkcbbImportance.KeyValue;
  cmdWord.Parameters.ParamByName('DifficultyLevel').Value := dblkcbbDifficulty.KeyValue;
  cmdWord.Execute;

  ShowWords('%');

  qryWord.Locate('Word', edtWord.Text, []);
  edtWord.Clear;
end;

procedure TWordInputForm.grdWordCanSort(Sender: TObject; ACol: Integer;
  var DoSort: Boolean);
var
  fldname:string;
begin
  DoSort := False; // disable internal sort

  // toggle sort order
  if grdWord.SortSettings.Direction = sdAscending then
    grdWord.SortSettings.Direction := sdDescending
  else
    grdWord.SortSettings.Direction := sdAscending;

  // get field name of the column clicked
//  fldname :=  qryWord.FieldList.Fields[ACol - 1].FieldName;
  fldname :=  grdWord.Columns[ACol].FieldName;

  if pos(' ',fldname) > 0 then
    fldname := '"'+fldname+'"';

  // add ORDER BY clause to the query
  qryWord.SQL.Text := qryWordNoSort.SQL.Text + ' ORDER BY '+fldname;

  if grdWord.SortSettings.Direction = sdDescending then
   qryWord.SQL.Text := qryWord.SQL.Text + ' DESC';

  qryWord.Close;
  qryword.Open;

  grdWord.SortSettings.Column := ACol;

  //SetRowHeader;
end;

procedure TWordInputForm.grdWordSelectionChanged(Sender: TObject; ALeft, ATop,
  ARight, ABottom: Integer);
begin
  ShowCurrentWord;
end;

procedure TWordInputForm.edtWordExit(Sender: TObject);
begin
  qryWord.Locate('Word', edtWord.Text, []);

  ShowCurrentWord;
end;

procedure TWordInputForm.edtWordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    btnWordClick(btnWord);
end;

procedure TWordInputForm.FormCreate(Sender: TObject);
begin
  dblkcbbImportance.KeyValue := 2;
  dblkcbbDifficulty.KeyValue := 3;

  ShowCurrentWord;
end;

procedure TWordInputForm.qryWordMoveComplete(DataSet: TCustomADODataSet;
  const Reason: TEventReason; const Error: Error;
  var EventStatus: TEventStatus);
begin
//  if not IsCreated then
//    exit;
//
//  edtWordEdit.Text := qryWord.FieldByName('Word').AsVariant;
//  dblkcbbImportanceEdit.KeyValue := qryWord.FieldByName('ImportanceID').AsVariant;
//  dblkcbbDifficultyEdit.KeyValue := qryWord.FieldByName('DifficultyID').AsVariant;
end;

procedure TWordInputForm.ShowCurrentWord;
begin
  if qryWord.RecordCount > 0 then
  begin
    edtWordEdit.Text := qryWord.FieldByName('Word').AsVariant;
    dblkcbbImportanceEdit.KeyValue := qryWord.FieldByName('ImportanceID').AsVariant;
    dblkcbbDifficultyEdit.KeyValue := qryWord.FieldByName('DifficultyID').AsVariant;
  end
  else
  begin
    edtWordEdit.Clear;
    dblkcbbImportanceEdit.KeyValue := -1;
    dblkcbbDifficultyEdit.KeyValue := -1;
  end;

  ShowRecordCount;
end;

procedure TWordInputForm.ShowWords(const LikeWord:string);
begin
  //qryWord.SQL.Text := qryWordNoSort.SQL.Text + 'ORDER BY Word';
  qryWord.Parameters.ParamByName('Word').Value := LikeWord;
  qryWord.Close;
  qryWord.Open;

  //SetRowHeader;

  ShowRecordCount;
end;

procedure TWordInputForm.ShowRecordCount;
begin
  grpWord.Caption := Format('单词一览(记录数：%d)' , [qryWord.RecordCount]);
end;

procedure TWordInputForm.SetRowHeader;
var
  i:Integer;
begin
  qryWord.First;

  for i := 1 to qryword.RecordCount  do
  begin
    grdWord.RowHeaders.Add(qryWord.FieldByName('Rowid').asstring);
    qryWord.Next;
  end;

  qryWord.First;
end;

end.
