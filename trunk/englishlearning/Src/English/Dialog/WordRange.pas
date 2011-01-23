unit WordRange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BasicDialog, StdCtrls, Buttons;

type
  TWordRangeForm = class(TBasicDialogForm)
    lblWord: TLabel;
    edtWord: TEdit;
    btnWordSearch: TButton;
    lblWordEnd: TLabel;
    edtWordEnd: TEdit;
    btnWordEndSearch: TButton;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnWordSearchClick(Sender: TObject);
    procedure btnWordEndSearchClick(Sender: TObject);
    procedure edtWordExit(Sender: TObject);
    procedure edtWordEndExit(Sender: TObject);
  private
    { Private declarations }
    function GetWordStart:string;
    function GetWordEnd:string;
  public
    { Public declarations }
    property WordStart:string read GetWordStart;
    property WordEnd:string read GetWordEnd;
  end;

var
  WordRangeForm: TWordRangeForm;

implementation

uses
  WordSearch;

{$R *.dfm}

procedure TWordRangeForm.btnWordEndSearchClick(Sender: TObject);
begin
  inherited;

  try
    WordSearchForm := TWordSearchForm.Create(nil);

    if WordSearchForm.ShowModal <> mrOk then
      exit;

    edtWordEnd.Text := WordSearchForm.Word;

    btnOK.Enabled := (edtWord.Text <> '') and (edtWordEnd.Text <> '');
  finally
    WordSearchForm.Free;
  end;
end;

procedure TWordRangeForm.btnWordSearchClick(Sender: TObject);
begin
  inherited;

  try
    WordSearchForm := TWordSearchForm.Create(nil);

    if WordSearchForm.ShowModal <> mrOk then
      exit;

    edtWord.Text := WordSearchForm.Word;

    btnOK.Enabled := (edtWord.Text <> '') and (edtWordEnd.Text <> '');
  finally
    WordSearchForm.Free;
  end;
end;

procedure TWordRangeForm.edtWordEndExit(Sender: TObject);
begin
  inherited;

  btnOK.Enabled := (edtWord.Text <> '') and (edtWordEnd.Text <> '');
end;

procedure TWordRangeForm.edtWordExit(Sender: TObject);
begin
  inherited;

  btnOK.Enabled := (edtWord.Text <> '') and (edtWordEnd.Text <> '');
end;

function TWordRangeForm.GetWordStart:string;
begin
  Result := Trim(edtWord.Text);
end;

function TWordRangeForm.GetWordEnd:string;
begin
  Result := Trim(edtWordEnd.Text);
end;

end.
