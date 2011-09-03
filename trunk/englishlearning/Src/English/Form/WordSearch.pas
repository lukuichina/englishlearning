unit WordSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid,
  AdvOfficePager, DB, ADODB, Buttons, ComCtrls,
  ViewData, ExtCtrls;

type
  TWordSearchForm = class(TForm)
    grp1: TGroupBox;
    btnSearch: TButton;
    grpWord: TGroupBox;
    dbdvgrd1: TDBAdvGrid;
    dsWord: TDataSource;
    qryWord: TADOQuery;
    tblImportance: TADOTable;
    dsImportance: TDataSource;
    dsDifficulty: TDataSource;
    tblDifficulty: TADOTable;
    lblWord: TLabel;
    edtWord: TEdit;
    dblkcbbImportance: TDBLookupComboBox;
    lblImportance: TLabel;
    lblDifficulty: TLabel;
    dblkcbbDifficulty: TDBLookupComboBox;
    btnOK: TBitBtn;
    stat1: TStatusBar;
    rgCatalogOption: TRadioGroup;
    rgExplanationOption: TRadioGroup;
    rgPictureOption: TRadioGroup;
    procedure edtWordExit(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
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
  WordExplain, AutoComplete, DataModule;

{$R *.dfm}

procedure TWordSearchForm.btnSearchClick(Sender: TObject);
begin
  ShowWords(edtWord.Text);
end;

procedure TWordSearchForm.dbdvgrd1DblClick(Sender: TObject);
begin
  if Owner  = nil then
  begin
    Close;
    ModalResult := mrOk;
  end;
end;

procedure TWordSearchForm.dbdvgrd1ScrollCell(Sender: TObject; ACol, ARow,
  ScrollPosition, ScrollMin, ScrollMax: Integer);
begin
  stat1.Panels[0].Text := Format('第%d行',[ARow]);
end;

procedure TWordSearchForm.edtWordExit(Sender: TObject);
begin
  LocateWord;
end;

procedure TWordSearchForm.edtWordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    LocateWord;
  end;
end;

procedure TWordSearchForm.FormCreate(Sender: TObject);
begin
  FWord := TWord.Create;

  //引用自动完成功能用以下过程
  //第二个参数是TStrings类型，用户可以自行取数，只要最终转化为TStrings类型即可
  SetAutoCompleteControl(edtWord.Handle, dmManager.WordList);
end;

procedure TWordSearchForm.FormShow(Sender: TObject);
begin
  edtWord.SetFocus;

  grpWord.Caption := Format('检索结果(记录数：%d)' , [qryWord.RecordCount]);
end;

procedure TWordSearchForm.ShowWords(const LikeWord:string);
begin
  qryWord.Parameters.ParamByName('Word').Value := LikeWord + '%';

  case rgCatalogOption.ItemIndex of
    0:
    begin
      qryWord.Parameters.ParamByName('CatalogOption1').Value := '○';
      qryWord.Parameters.ParamByName('CatalogOption2').Value := '×';
    end;
    1:
    begin
      qryWord.Parameters.ParamByName('CatalogOption1').Value := '○';
      qryWord.Parameters.ParamByName('CatalogOption2').Value := '○';
    end;
    2:
    begin
      qryWord.Parameters.ParamByName('CatalogOption1').Value := '×';
      qryWord.Parameters.ParamByName('CatalogOption2').Value := '×';
    end;
  end;

  case rgExplanationOption.ItemIndex of
    0:
    begin
      qryWord.Parameters.ParamByName('ExplanationOption1').Value := '○';
      qryWord.Parameters.ParamByName('ExplanationOption2').Value := '×';
    end;
    1:
    begin
      qryWord.Parameters.ParamByName('ExplanationOption1').Value := '○';
      qryWord.Parameters.ParamByName('ExplanationOption2').Value := '○';
    end;
    2:
    begin
      qryWord.Parameters.ParamByName('ExplanationOption1').Value := '×';
      qryWord.Parameters.ParamByName('ExplanationOption2').Value := '×';
    end;
  end;

  case rgPictureOption.ItemIndex of
    0:
    begin
      qryWord.Parameters.ParamByName('PictureOption1').Value := '○';
      qryWord.Parameters.ParamByName('PictureOption2').Value := '×';
    end;
    1:
    begin
      qryWord.Parameters.ParamByName('PictureOption1').Value := '○';
      qryWord.Parameters.ParamByName('PictureOption2').Value := '○';
    end;
    2:
    begin
      qryWord.Parameters.ParamByName('PictureOption1').Value := '×';
      qryWord.Parameters.ParamByName('PictureOption2').Value := '×';
    end;
  end;

  qryWord.ExecSQL;
  qryWord.Close;
  qryWord.Open;

  grpWord.Caption := Format('检索结果(记录数：%d)' , [qryWord.RecordCount]);
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

  if not qryWord.Locate('Word', edtWord.Text, []) then
     qryWord.Locate('Word', edtWord.Text, [loPartialKey])
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

initialization
  RegisterClass(TWordSearchForm);

end.
