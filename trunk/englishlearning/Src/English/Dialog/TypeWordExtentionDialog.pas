unit TypeWordExtentionDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BasicDialog, StdCtrls, Buttons, ExtCtrls, DBCtrls, DB, ADODB;

type
  TTypeWordExtentionDialogForm = class(TBasicDialogForm)
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
    FBaseWord:string;
    FBaseType:integer;
    FExtendWord:string;
    FExtendType:integer;

  public
    { Public declarations }
    property BaseWord:string read FBaseWord write FBaseWord;
    property BaseType:integer read FBaseType write FBaseType;
    property Word:string read FExtendWord write FExtendWord;
    property WordType:integer read FExtendType write FExtendType;
  end;

var
  TypeWordExtentionDialogForm: TTypeWordExtentionDialogForm;

implementation

uses WordSearch;

{$R *.dfm}

procedure TTypeWordExtentionDialogForm.btnExtendWordSearchClick(Sender: TObject);
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

procedure TTypeWordExtentionDialogForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  //FBaseWord := edtWord.Text;
  FBaseType := StrToInt(dbrgrpBaseType.Value);
  FExtendWord := edtExtendWord.Text;
  FExtendType := StrToInt(dbrgrpExtendType.Value);
end;

procedure TTypeWordExtentionDialogForm.FormCreate(Sender: TObject);
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
end;

procedure TTypeWordExtentionDialogForm.FormShow(Sender: TObject);
begin
  inherited;

  dbrgrpBaseType.Value := IntToStr(FBaseType);
  edtExtendWord.Text := FExtendWord;
  dbrgrpExtendType.Value := IntToStr(FExtendType);
end;

end.
