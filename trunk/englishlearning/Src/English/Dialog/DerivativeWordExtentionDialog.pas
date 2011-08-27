unit DerivativeWordExtentionDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BasicDialog, StdCtrls, Buttons, DBCtrls, DB, ADODB, ExtCtrls;

type
  TDerivativeWordExtentionDialogForm = class(TBasicDialogForm)
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
    procedure FormCreate(Sender: TObject);
    procedure btnExtendWordSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FWord:string;
    FWordType:integer;
    FExplanationID:integer;
    FSynonymWord:string;
    FSynonymWordType:integer;
    FSynonymExplanationID:integer;

  public
    { Public declarations }
    property BaseWord:string read FWord write FWord;
    property BaseType:integer read FWordType write FWordType;
    //property ExplanationID:integer read FExplanationID write FExplanationID;
    property ExtendWord:string read FSynonymWord write FSynonymWord;
    property ExtendType:integer read FSynonymWordType write FSynonymWordType;
    //property SynonymExplanationID:integer read FSynonymExplanationID write FSynonymExplanationID;
  end;

var
  DerivativeWordExtentionDialogForm: TDerivativeWordExtentionDialogForm;

implementation

uses WordSearch, DataModule, AutoComplete;

{$R *.dfm}

procedure TDerivativeWordExtentionDialogForm.btnExtendWordSearchClick(Sender: TObject);
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

    //ShowWordExplanation;
  finally
    WordSearchForm.Free;
  end;
end;

procedure TDerivativeWordExtentionDialogForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  //FBaseWord := edtWord.Text;
  FWordType := StrToInt(dbrgrpBaseType.Value);
  FSynonymWord := edtExtendWord.Text;
  FSynonymWordType := StrToInt(dbrgrpExtendType.Value);
end;

procedure TDerivativeWordExtentionDialogForm.FormCreate(Sender: TObject);
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

  dbrgrpBaseType.Value := '1';
  dbrgrpExtendType.Value := '1';

  //引用自动完成功能用以下过程
  //第二个参数是TStrings类型，用户可以自行取数，只要最终转化为TStrings类型即可
  SetAutoCompleteControl(edtExtendWord.Handle, dmManager.WordList);
end;

procedure TDerivativeWordExtentionDialogForm.FormShow(Sender: TObject);
begin
  inherited;

  dbrgrpBaseType.Value := IntToStr(FWordType);
  edtExtendWord.Text := FSynonymWord;
  dbrgrpExtendType.Value := IntToStr(FSynonymWordType);
end;

end.
