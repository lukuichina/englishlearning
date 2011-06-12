unit ExplanationInputDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ADODB, DB, Buttons, ExtCtrls;

type
  TExplanationInputDialogForm = class(TForm)
    tblDifficulty: TADOTable;
    dsDifficulty: TDataSource;
    dsImportance: TDataSource;
    tblImportance: TADOTable;
    dsWordType: TDataSource;
    tblWordType: TADOTable;
    lbl2: TLabel;
    edt1: TEdit;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    dbrgrpImportance: TDBRadioGroup;
    dbrgrpDifficulty: TDBRadioGroup;
    dbrgrpWordType: TDBRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dbrgrpWordTypeChange(Sender: TObject);
    procedure dbrgrpImportanceChange(Sender: TObject);
    procedure dbrgrpDifficultyChange(Sender: TObject);
  private
    { Private declarations }
    FWord:string;
    FWordExplanation:string;
    FWordType:integer;
    FImportanceLevel:integer;
    FDifficultyLevel:integer;
    FIsDropDown:Boolean;
    FCurrentWordType:integer;
    FCurrentImportanceLevel:integer;
    FCurrentDifficultyLevel:integer;
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
  ExplanationInputDialogForm: TExplanationInputDialogForm;

implementation

{$R *.dfm}

procedure TExplanationInputDialogForm.dbrgrpWordTypeChange(Sender: TObject);
begin
  //tblWordType.Locate('ID', dbrgrpWordType.ItemIndex + 1 , []);
end;

procedure TExplanationInputDialogForm.dbrgrpImportanceChange(Sender: TObject);
begin
  //tblImportance.Locate('ID', dbrgrpImportance.ItemIndex + 1 , []);
end;

procedure TExplanationInputDialogForm.dbrgrpDifficultyChange(Sender: TObject);
begin
  //tblDifficulty.Locate('ID', dbrgrpDifficulty.ItemIndex + 1 , []);
end;

procedure TExplanationInputDialogForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FWordExplanation := edt1.Text;
  FWordType := StrToInt(dbrgrpWordType.Value);
  FImportanceLevel := StrToInt(dbrgrpImportance.Value);
  FDifficultyLevel := StrToInt(dbrgrpDifficulty.Value);
end;

procedure TExplanationInputDialogForm.FormCreate(Sender: TObject);
begin
  //FIsDropDown := True;

  tblWordType.First;
  while not tblWordType.Eof do
  begin
    dbrgrpWordType.Values.Add(tblWordType.FieldByName('ID').AsString);
    dbrgrpWordType.Items.Add(tblWordType.FieldByName('Disp').AsString);

    tblWordType.Next;
  end;

  tblImportance.First;
  while not tblImportance.Eof do
  begin
    dbrgrpImportance.Values.Add(tblImportance.FieldByName('ID').AsString);
    dbrgrpImportance.Items.Add(tblImportance.FieldByName('Disp').AsString);

    tblImportance.Next;
  end;

  tblDifficulty.First;
  while not tblDifficulty.Eof do
  begin
    dbrgrpDifficulty.Values.Add(tblDifficulty.FieldByName('ID').AsString);
    dbrgrpDifficulty.Items.Add(tblDifficulty.FieldByName('Disp').AsString);

    tblDifficulty.Next;
  end;

  dbrgrpWordType.Value := '1';
  dbrgrpImportance.Value := '2';
  dbrgrpDifficulty.Value := '3';
end;

procedure TExplanationInputDialogForm.FormShow(Sender: TObject);
begin
  Caption := 'Ω‚ Õ¬º»Î£∫' + Word;
//
//  dblkcbbWordType.KeyValue := 1;
//  dblkcbbImportance.KeyValue := 2;
//  dblkcbbDifficulty.KeyValue := 3;
end;

end.
