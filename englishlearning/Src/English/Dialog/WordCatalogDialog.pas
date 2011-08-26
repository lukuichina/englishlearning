unit WordCatalogDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BasicDialog, StdCtrls, Buttons, datelbl, ComCtrls,
  WordCatalogView,
  ViewData;

type
  TWordCatalogDialogFrom = class(TBasicDialogForm, IWordCatalogDialogView)
    lblWord: TLabel;
    btnCancel: TBitBtn;
    btnOK: TBitBtn;
    edtCatalogName: TEdit;
    lbl2: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edtCatalogDisp: TEdit;
    lblUpdateTime: TDateLabel;
    lblCreateTime: TDateLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FWordCatalog:TWordCatalog;
    FEditMode:TEditMode;
  public
    { Public declarations }
    function  GetCatalogInfo:TWordCatalog;
    procedure SetCatalogInfo(const value:TWordCatalog);
    procedure SetEditMode(const value:TEditMode);

    property CatalogInfo:TWordCatalog read GetCatalogInfo write SetCatalogInfo;
    property EditMode:TEditMode write SetEditMode;
  end;

var
  WordCatalogDialogFrom: TWordCatalogDialogFrom;

implementation

{$R *.dfm}

procedure TWordCatalogDialogFrom.FormCreate(Sender: TObject);
begin
  inherited;

  FWordCatalog := TWordCatalog.Create;

  lblUpdateTime.Caption := '';
  lblCreateTime.Caption := '';
end;

procedure TWordCatalogDialogFrom.FormShow(Sender: TObject);
begin
  inherited;
  edtCatalogName.SetFocus;
end;

function  TWordCatalogDialogFrom.GetCatalogInfo:TWordCatalog;
begin
  FWordCatalog.CatalogName := edtCatalogName.Text;
  FWordCatalog.CatalogDisp := edtCatalogDisp.Text;

  Result := FWordCatalog;
end;

procedure TWordCatalogDialogFrom.SetCatalogInfo(const value:TWordCatalog);
begin
  FWordCatalog := value;

  edtCatalogName.Text := FWordCatalog.CatalogName;
  edtCatalogDisp.Text := FWordCatalog.CatalogDisp;

  lblCreateTime.Caption := DateTimeToStr(FWordCatalog.CreateTime);
  lblUpdateTime.Caption := DateTimeToStr(FWordCatalog.UpdateTime);
end;

procedure TWordCatalogDialogFrom.SetEditMode(const value:TEditMode);
begin
  FEditMode := value;

  if value = emInsert then
    Caption := '单词分类（添加）'
  else if value = emUpdate then
  begin
    Caption := '单词分类（更新）';
  end;
end;

end.
