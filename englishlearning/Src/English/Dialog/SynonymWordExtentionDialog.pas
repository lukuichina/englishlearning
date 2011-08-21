unit SynonymWordExtentionDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BasicDialog, StdCtrls, Buttons, ExtCtrls, DBCtrls, DB, ADODB,
  SynonymWordExtentionView, SynonymWordExtentionController;

type
  TSynonymWordExtentionDialogForm = class(TBasicDialogForm, ISynonymWordExtentionView)
    dsBaseType: TDataSource;
    tblBaseType: TADOTable;
    dbrgrpBaseType: TDBRadioGroup;
    dsExtendType: TDataSource;
    tblExtendType: TADOTable;
    dbrgrpExtendType: TDBRadioGroup;
    btnCancel: TBitBtn;
    btnOK: TBitBtn;
    btnExtendWordSearch: TButton;
    edtExtendWord: TEdit;
    lblExtendWord: TLabel;
    dsBaseExplanation: TDataSource;
    dblkcbblBaseExplanation: TDBLookupComboBox;
    lblBaseExplanation: TLabel;
    dsExtendExplanation: TDataSource;
    dblkcbblExtendExplanation: TDBLookupComboBox;
    Label1: TLabel;
    btnReset: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnExtendWordSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbrgrpBaseTypeClick(Sender: TObject);
    procedure dbrgrpExtendTypeClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnResetClick(Sender: TObject);
  private
    { Private declarations }
    FWord:string;
    FWordType:integer;
    FExplanationID:integer;
    FSynonymWord:string;
    FSynonymWordType:integer;
    FSynonymExplanationID:integer;
    FExtentionType:integer;

    FSynonymWordExtentionController:ISynonymWordExtentionController;

  public
    { Public declarations }
    property Word:string read FWord write FWord;
    property WordType:integer read FWordType write FWordType;
    property ExplanationID:integer read FExplanationID write FExplanationID;
    property SynonymWord:string read FSynonymWord write FSynonymWord;
    property SynonymWordType:integer read FSynonymWordType write FSynonymWordType;
    property SynonymExplanationID:integer read FSynonymExplanationID write FSynonymExplanationID;
    property ExtentionType:Integer write FExtentionType;

    procedure ShowBaseWordExplanation(value:TCustomADODataSet);
    procedure ShowExtendWordExplanation(value:TCustomADODataSet);
  end;

var
  SynonymWordExtentionDialogForm: TSynonymWordExtentionDialogForm;

implementation

uses WordSearch;

{$R *.dfm}

procedure TSynonymWordExtentionDialogForm.btnExtendWordSearchClick(Sender: TObject);
begin
  inherited;

  try
    WordSearchForm := TWordSearchForm.Create(nil);
    WordSearchForm.Word := edtExtendWord.Text;

    if WordSearchForm.ShowModal <> mrOk then
    begin
      //if not IsWordExist(edtWord.Text) then
        edtExtendWord.SetFocus;

      exit;
    end;

    edtExtendWord.Text := WordSearchForm.Word;

    dbrgrpExtendTypeClick(Sender);
    //ShowWordExplanation;
  finally
    WordSearchForm.Free;
  end;
end;

procedure TSynonymWordExtentionDialogForm.btnResetClick(Sender: TObject);
begin
  inherited;

  dbrgrpBaseType.Value := '0';
  dblkcbblBaseExplanation.KeyValue := 0;
  edtExtendWord.Text := '';
  dbrgrpExtendType.Value := '0';
  dblkcbblExtendExplanation.KeyValue := 0;

  dbrgrpBaseTypeClick(Sender);
  dbrgrpExtendTypeClick(Sender);
end;

procedure TSynonymWordExtentionDialogForm.dbrgrpBaseTypeClick(Sender: TObject);
begin
  inherited;

  FSynonymWordExtentionController.ShowBaseWordExplanation(FWord, dbrgrpBaseType.ItemIndex + 1);
end;

procedure TSynonymWordExtentionDialogForm.dbrgrpExtendTypeClick(
  Sender: TObject);
begin
  inherited;

  FSynonymWordExtentionController.ShowExtendWordExplanation(edtExtendWord.Text, dbrgrpExtendType.ItemIndex + 1);
end;

procedure TSynonymWordExtentionDialogForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  FWordType := StrToInt(dbrgrpBaseType.Value);
  FExplanationID := dblkcbblBaseExplanation.KeyValue;
  FSynonymWord := edtExtendWord.Text;
  FSynonymWordType := StrToInt(dbrgrpExtendType.Value);
  FSynonymExplanationID := dblkcbblExtendExplanation.KeyValue;

  //FSynonymWordExtentionController.
end;

procedure TSynonymWordExtentionDialogForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;

  if ModalResult <> mrOk then
    Exit;

  if edtExtendWord.Text = '' then
  begin
    MessageDlg('扩展单词不能为空！', mtError, [mbOK], 0);
    CanClose := False;
    edtExtendWord.SetFocus;
  end;
end;

procedure TSynonymWordExtentionDialogForm.FormCreate(Sender: TObject);
begin
  inherited;

  tblBaseType.First;
  while not tblBaseType.Eof do
  begin
    dbrgrpBaseType.Values.Add(tblBaseType.FieldByName('ID').AsString);
    dbrgrpBaseType.Items.Add(tblBaseType.FieldByName('Disp').AsString);

    tblBaseType.Next;
  end;

  tblExtendType.First;
  while not tblExtendType.Eof do
  begin
    dbrgrpExtendType.Values.Add(tblExtendType.FieldByName('ID').AsString);
    dbrgrpExtendType.Items.Add(tblExtendType.FieldByName('Disp').AsString);

    tblExtendType.Next;
  end;

//  dbrgrpBaseType.Value := '1';
//  dbrgrpExtendType.Value := '1';

  FExtentionType := 2;

  FSynonymWordExtentionController := TSynonymWordExtentionController.Create(self);
end;

procedure TSynonymWordExtentionDialogForm.FormShow(Sender: TObject);
begin
  inherited;

  dbrgrpBaseType.Value := IntToStr(FWordType);
  dblkcbblBaseExplanation.KeyValue := FExplanationID;
  edtExtendWord.Text := FSynonymWord;
  dbrgrpExtendType.Value := IntToStr(FSynonymWordType);
  dblkcbblExtendExplanation.KeyValue := FSynonymExplanationID;

  dbrgrpBaseTypeClick(Sender);
  dbrgrpExtendTypeClick(Sender);

  case FExtentionType of
    1:
      Caption := '形似扩展';
    2:
      Caption := '同义扩展';
    3:
      Caption := '反义扩展';
    4:
      Caption := '近义扩展';
    5:
      Caption := '同类扩展';
  end;
end;

procedure TSynonymWordExtentionDialogForm.ShowBaseWordExplanation(value:TCustomADODataSet);
begin
  dsBaseExplanation.DataSet := value;
end;

procedure TSynonymWordExtentionDialogForm.ShowExtendWordExplanation(value:TCustomADODataSet);
begin
  dsExtendExplanation.DataSet := value;
end;

end.
