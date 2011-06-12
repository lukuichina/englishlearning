unit ExplanationInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ADODB, DB, Buttons;

type
  TExplanationInputForm = class(TForm)
    tblDifficulty: TADOTable;
    dsDifficulty: TDataSource;
    dsImportance: TDataSource;
    tblImportance: TADOTable;
    dsWordType: TDataSource;
    tblWordType: TADOTable;
    dblkcbbWordType: TDBLookupComboBox;
    lbl2: TLabel;
    lblWord: TLabel;
    lblImportance: TLabel;
    dblkcbbImportance: TDBLookupComboBox;
    dblkcbbDifficulty: TDBLookupComboBox;
    lblDifficulty: TLabel;
    edt1: TEdit;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FWord:string;
    FWordExplanation:string;
    FWordType:integer;
    FImportanceLevel:integer;
    FDifficultyLevel:integer;
    //FQryExplanation:TADOQuery;
  public
    { Public declarations }
    property Word:string read FWord write FWord;
    property WordExplanation:string read FWordExplanation write FWordExplanation;
    property WordType:integer read FWordType write FWordType;
    property ImportanceLevel:integer read FImportanceLevel write FImportanceLevel;
    property DifficultyLevel:integer read FDifficultyLevel write FDifficultyLevel;
    //property QryExplanation:TADOQuery read FQryExplanation write FQryExplanation;
  end;

var
  ExplanationInputForm: TExplanationInputForm;

implementation

{$R *.dfm}

procedure TExplanationInputForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FWordExplanation := edt1.Text;
  FWordType := dblkcbbWordType.KeyValue;
  FImportanceLevel := dblkcbbImportance.KeyValue;
  FDifficultyLevel := dblkcbbDifficulty.KeyValue;
end;

procedure TExplanationInputForm.FormCreate(Sender: TObject);
begin
  Caption := '解释录入:' + Word;

  dblkcbbWordType.KeyValue := 1;
  dblkcbbImportance.KeyValue := 2;
  dblkcbbDifficulty.KeyValue := 3;
end;

procedure TExplanationInputForm.FormShow(Sender: TObject);
begin
//  Caption := '解释录入:' + Word;
//
//  dblkcbbWordType.KeyValue := 1;
//  dblkcbbImportance.KeyValue := 2;
//  dblkcbbDifficulty.KeyValue := 3;
end;

end.
