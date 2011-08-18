unit WordRange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BasicDialog, StdCtrls, Buttons, ExtCtrls;

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
    rgWordOption: TRadioGroup;
    btnReset: TBitBtn;
    procedure btnWordSearchClick(Sender: TObject);
    procedure btnWordEndSearchClick(Sender: TObject);
    procedure edtWordExit(Sender: TObject);
    procedure edtWordEndExit(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure SetWordStart(const value:string);
    procedure SetWordEnd(const value:string);
    procedure SetViewType(const value:integer);

    function GetWordStart:string;
    function GetWordEnd:string;
    function GetViewType:integer;
  public
    { Public declarations }
    property WordStart:string read GetWordStart write SetWordStart;
    property WordEnd:string read GetWordEnd write SetWordEnd;
    property ViewType:Integer read GetViewType write SetViewType;
  end;

var
  WordRangeForm: TWordRangeForm;

implementation

uses
  WordSearch;

{$R *.dfm}

procedure TWordRangeForm.btnResetClick(Sender: TObject);
begin
  inherited;

  edtWord.Clear;
  edtWordEnd.Clear;
  rgWordOption.ItemIndex := 1;
end;

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

procedure TWordRangeForm.FormShow(Sender: TObject);
begin
  inherited;

  btnOK.Enabled := (edtWord.Text <> '') and (edtWordEnd.Text <> '');
end;

procedure TWordRangeForm.SetWordStart(const value:string);
begin
  edtWord.Text := Trim(value);
end;

procedure TWordRangeForm.SetWordEnd(const value:string);
begin
  edtWordEnd.Text := Trim(value);
end;

procedure TWordRangeForm.SetViewType(const value:integer);
begin
  rgWordOption.ItemIndex := value;
end;

function TWordRangeForm.GetWordStart:string;
begin
  Result := Trim(edtWord.Text);
end;

function TWordRangeForm.GetWordEnd:string;
begin
  Result := Trim(edtWordEnd.Text);
end;

function TWordRangeForm.GetViewType:integer;
begin
  Result := rgWordOption.ItemIndex;
end;

end.
