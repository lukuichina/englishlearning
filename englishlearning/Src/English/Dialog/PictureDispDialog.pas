unit PictureDispDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BasicDialog, StdCtrls, Buttons, ComCtrls, ToolWin, ExtActns,
  StdActns, ActnList, Menus, ImgList;

type
  TPictureDispDialogForm = class(TBasicDialogForm)
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    redtPictureDisp: TRichEdit;
    pm1: TPopupMenu;
    actlst1: TActionList;
    edtct1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    EditUndo1: TEditUndo;
    EditDelete1: TEditDelete;
    RichEditBold1: TRichEditBold;
    RichEditItalic1: TRichEditItalic;
    RichEditUnderline1: TRichEditUnderline;
    RichEditStrikeOut1: TRichEditStrikeOut;
    RichEditBullets1: TRichEditBullets;
    RichEditAlignLeft1: TRichEditAlignLeft;
    RichEditAlignRight1: TRichEditAlignRight;
    RichEditAlignCenter1: TRichEditAlignCenter;
    tlb1: TToolBar;
    btn1: TToolButton;
    btn2: TToolButton;
    btn3: TToolButton;
    ilt1: TImageList;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    Delete1: TMenuItem;
    Delete2: TMenuItem;
    SelectAll1: TMenuItem;
    N1: TMenuItem;
    Undo1: TMenuItem;
    btn4: TToolButton;
    btn5: TToolButton;
    btn6: TToolButton;
    btn7: TToolButton;
    btn8: TToolButton;
    N2: TMenuItem;
    AlignLeft1: TMenuItem;
    Center1: TMenuItem;
    AlignRight1: TMenuItem;
    N3: TMenuItem;
    Bold1: TMenuItem;
    Italic1: TMenuItem;
    Underline1: TMenuItem;
    Bullets2: TMenuItem;
    Strikeout1: TMenuItem;
    Font1: TMenuItem;
    Edit1: TMenuItem;
    Align1: TMenuItem;
    Format1: TMenuItem;
    FontEdit1: TFontEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FontEdit1Accept(Sender: TObject);
  private
    FPictureDisp:string;
    FRtfPath:string;
    { Private declarations }
  public
    { Public declarations }
    property PictureDisp:string read FPictureDisp write FPictureDisp;
    property RtfPath:string read FRtfPath write FRtfPath;
  end;

var
  PictureDispDialogForm: TPictureDispDialogForm;

implementation

{$R *.dfm}

procedure TPictureDispDialogForm.FontEdit1Accept(Sender: TObject);
begin
  inherited;

  redtPictureDisp.SelAttributes.Name := FontEdit1.Dialog.Font.Name;
  redtPictureDisp.SelAttributes.Pitch := FontEdit1.Dialog.Font.Pitch;
  redtPictureDisp.SelAttributes.Size := FontEdit1.Dialog.Font.Size;
  redtPictureDisp.SelAttributes.Style := FontEdit1.Dialog.Font.Style;
  redtPictureDisp.SelAttributes.Color := FontEdit1.Dialog.Font.Color;
  redtPictureDisp.SelAttributes.Charset := FontEdit1.Dialog.Font.Charset;
end;

procedure TPictureDispDialogForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  FPictureDisp := redtPictureDisp.Text;
end;

procedure TPictureDispDialogForm.FormShow(Sender: TObject);
begin
  inherited;

  redtPictureDisp.Text := FPictureDisp;

  if FileExists(FRtfPath) then
    redtPictureDisp.Lines.LoadFromFile(FRtfPath);

  if redtPictureDisp.Text = '' then
    redtPictureDisp.PasteFromClipboard;
end;

end.
