unit WordViewThread;

interface

uses
  Classes, ADODB, advsmoothimagelistbox, SysUtils;

type
  TWordViewThreadEvent = procedure(const value:integer) of object;

type
  TWordViewThread = class(TThread)
  private
    { Private declarations }
    spWord:TADOStoredProc;
    lbxPicture:TAdvSmoothImageListBox;

    item: TAdvSmoothImageListBoxItem;
    strPicName: string;
    FWordViewThreadEvent:TWordViewThreadEvent;

//    FProgressForm: TForm;                                  {进度窗体}
//    FGauge: TGauge;                                        {进度条}
//    FShowProgress :Boolean;

  protected
    procedure Execute; override;
    procedure lbxPictureItemSelect(Sender: TObject;itemindex: Integer);
    procedure UpdatePictureBox;

  public
    //constructor Create();override;
    property WordStoredProc:TADOStoredProc write spWord;
    property PictureListBox:TAdvSmoothImageListBox write lbxPicture;
    property WordViewThreadEvent:TWordViewThreadEvent write FWordViewThreadEvent;
    //property ShowProgress: Boolean read FShowProgress write FShowProgress;
  end;

implementation

uses CommonInfo;

{ 
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);  

  and UpdateCaption could look like,

    procedure WordViewThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; 
    
    or 
    
    Synchronize( 
      procedure 
      begin
        Form1.Caption := 'Updated in thread via an anonymous method' 
      end
      )
    );
    
  where an anonymous method is passed.
  
  Similarly, the developer can call the Queue method with similar parameters as 
  above, instead passing another TThread class as the first parameter, putting
  the calling thread in a queue with the other thread.
    
}

{ WordViewThread }

procedure TWordViewThread.Execute;
//var
//  item: TAdvSmoothImageListBoxItem;
//  strPicName: string;
begin
  { Place thread code here }

//  lbxPicture.Items.BeginUpdate;
//
//  lbxPicture.Items.Clear;
//  lbxPicture.Header.Caption := '';
//  lbxPicture.Footer.Caption := '';
//  if ShowProgress then
//    CreateProcessForm(nil);

  spWord.First;
  while not spWord.Eof do
  begin
    strPicName := ConfigInfo.PicPath + spWord.FieldByName('PictureName').AsString;

    Synchronize(UpdatePictureBox);

//    item := lbxPicture.Items.Add;

//    if FileExists(strPicName) then
//      item.Image.LoadFromFile(strPicName);
//
//    item.FileName := strPicName;
//    item.Caption.Text := spWord.FieldByName('Word').AsString;
//    item.Caption.Location := TAdvSmoothImageListBoxLocation(cpCenterCenter);

    spWord.Next;
  end;

//  lbxPictureItemSelect(lbxPicture, 0);
//
//  lbxPicture.Items.EndUpdate;
end;

procedure TWordViewThread.lbxPictureItemSelect(Sender: TObject;
  itemindex: Integer);
begin
  spWord.First;

  if spWord.RecordCount = 0 then
    exit;

  spWord.RecNo := itemindex + 1;

  lbxPicture.Header.Caption := //spWord.FieldByName('Word').AsString + '        ' +
                               spWord.FieldByName('WordType').AsString + '  ' +
                               spWord.FieldByName('Explanation').AsString;

  lbxPicture.Footer.Caption := lbxPicture.Items[itemindex].FileName;
end;

procedure TWordViewThread.UpdatePictureBox;
begin
    //lbxPicture.Items.BeginUpdate;

    item := lbxPicture.Items.Add;

    if FileExists(strPicName) then
      item.Image.LoadFromFile(strPicName);

    item.FileName := strPicName;
    item.Caption.Text := spWord.FieldByName('Word').AsString;
    item.Caption.Location := TAdvSmoothImageListBoxLocation(cpCenterCenter);

    //lbxPicture.Items.EndUpdate;
    if Assigned(FWordViewThreadEvent) then
      FWordViewThreadEvent(spWord.RecNo);
end;

end.
