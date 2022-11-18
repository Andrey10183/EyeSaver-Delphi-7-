unit Settings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ImgList, LightButton, Grids,
  ValEdit, IdHTTP, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, jpeg, registry,FileCtrl, MMSystem, ShellAPI, MultiLanguage;

type
  TFormSettings = class(TForm)
    RBRegular: TRadioButton;
    RBUser: TRadioButton;
    RBBoth: TRadioButton;
    UDRHour: TUpDown;
    EditRHour: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    EditRMin: TEdit;
    UDRMin: TUpDown;
    GBRestMode: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EditRDMin: TEdit;
    UDRDMin: TUpDown;
    Label7: TLabel;
    EditRDHour: TEdit;
    UDRDHour: TUpDown;
    LBAccept: TLightButton;
    Shape1: TShape;
    jh: TImageList;
    LBChancel: TLightButton;
    Shape2: TShape;
    ImageList1: TImageList;
    Label8: TLabel;
    EditRSec: TEdit;
    UDRSec: TUpDown;
    Label9: TLabel;
    Label10: TLabel;
    EditRDSec: TEdit;
    UDRDSec: TUpDown;
    GBQuotes: TGroupBox;
    MemoQuote_untr: TMemo;
    EditAuthor_untr: TEdit;
    Label11: TLabel;
    Label13: TLabel;
    LBAddQuote: TLightButton;
    Shape3: TShape;
    ImageList2: TImageList;
    ListBox1: TListBox;
    CBQuotes_untr: TComboBox;
    Label14: TLabel;
    ImageSave: TImageList;
    LBSave: TLightButton;
    ShapeSave: TShape;
    LBDel: TLightButton;
    ShapeDel: TShape;
    ImageDel: TImageList;
    PCMenu: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ImageMenu: TImageList;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    Shape6: TShape;
    ShapeDelUE: TShape;
    EditUserEvent_untr: TEdit;
    LBAddUserEvent: TLightButton;
    LBDelUserEvent: TLightButton;
    CB1: TCheckBox;
    CB2: TCheckBox;
    CB3: TCheckBox;
    CB4: TCheckBox;
    CB5: TCheckBox;
    CB7: TCheckBox;
    CB6: TCheckBox;
    Label2: TLabel;
    EditUH: TEdit;
    Label15: TLabel;
    EditUM: TEdit;
    Label17: TLabel;
    UDUH: TUpDown;
    UDUM: TUpDown;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    UDBDH: TUpDown;
    EditUDM: TEdit;
    UDBDM: TUpDown;
    Label21: TLabel;
    EditUDH: TEdit;
    EditUDS: TEdit;
    UDBDS: TUpDown;
    Label22: TLabel;
    Label23: TLabel;
    EditUS: TEdit;
    UDUS: TUpDown;
    SGUserEvent: TStringGrid;
    ListBox2: TListBox;
    PanelAddUserEvent: TPanel;
    CBAction: TComboBox;
    LBAddUEConfirm: TLightButton;
    Shape9: TShape;
    Shape10: TShape;
    LBAddUEChancel: TLightButton;
    Ltmp: TLabel;
    LBUEEdit: TLightButton;
    ShapeEditUE: TShape;
    ImageEdit: TImageList;
    PanelAddQuote: TPanel;
    LBQChancel: TLightButton;
    Shape7: TShape;
    LBQuoteAdd: TLightButton;
    Shape8: TShape;
    MemoQView_untr: TMemo;
    Label12: TLabel;
    Image1: TImage;
    About: TTabSheet;
    GroupBox2: TGroupBox;
    Label16: TLabel;
    Image2: TImage;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    LabelContact: TLabel;
    Shape11: TShape;
    CBAutorun: TCheckBox;
    CBQuote: TCheckBox;
    CBSound: TCheckBox;
    CBDimm: TCheckBox;
    CBTrain: TCheckBox;
    CBRemain: TCheckBox;
    ColR: TPanel;
    ColorDialog1: TColorDialog;
    ColQ: TPanel;
    ColT: TPanel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    ColRL: TPanel;
    ColTL: TPanel;
    ColQL: TPanel;
    LBDir_untr: TListBox;
    LBBrowse: TLightButton;
    Shape4: TShape;
    ImageBrowse: TImageList;
    LBDelDir: TLightButton;
    ShapeDelDir: TShape;
    ImageDelDir: TImageList;
    LBDirs: TListBox;
    Label33: TLabel;
    Label34: TLabel;
    LBtmp: TListBox;
    Label35: TLabel;
    EditTransp: TEdit;
    UDTransp: TUpDown;
    CBDefaultImage: TCheckBox;
    Label36: TLabel;
    CBMenu: TCheckBox;
    Label37: TLabel;
    UDMTransp: TUpDown;
    EditMTransp: TEdit;
    Label38: TLabel;
    CBPopup: TCheckBox;
    PanelQFont: TPanel;
    FDQuote: TFontDialog;
    PanelQFC: TPanel;
    PanelTFC: TPanel;
    PanelTFont: TPanel;
    Label39: TLabel;
    CBAll: TCheckBox;
    CBLang_untr: TComboBox;
    Label29: TLabel;
    LBLang: TListBox;
    procedure LBAcceptClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LBChancelClick(Sender: TObject);
    procedure LBAddQuoteClick(Sender: TObject);
    procedure CBQuotes_untrChange(Sender: TObject);
    procedure LBSaveClick(Sender: TObject);
    procedure LBDelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PCMenuDrawTab(Control: TCustomTabControl; TabIndex: Integer;
      const Rect: TRect; Active: Boolean);
    procedure PCMenuChanging(Sender: TObject; var AllowChange: Boolean);
    procedure LBAddUserEventClick(Sender: TObject);
    procedure SGUserEventSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure LBDelUserEventClick(Sender: TObject);
    procedure LBAddUEConfirmClick(Sender: TObject);
    procedure LBAddUEChancelClick(Sender: TObject);
    procedure SGUserEventDblClick(Sender: TObject);
    procedure LBUEEditClick(Sender: TObject);
    procedure LBQuoteAddClick(Sender: TObject);
    procedure LBQChancelClick(Sender: TObject);
    procedure CBSoundClick(Sender: TObject);
    procedure CBQuoteClick(Sender: TObject);
    procedure CBAutorunClick(Sender: TObject);
    procedure CBDimmClick(Sender: TObject);
    procedure CBTrainClick(Sender: TObject);
    procedure CBRemainClick(Sender: TObject);
    procedure ColRClick(Sender: TObject);
    procedure ColRLClick(Sender: TObject);
    procedure LBBrowseClick(Sender: TObject);
    procedure LBDelDirClick(Sender: TObject);
    procedure UDTranspChanging(Sender: TObject; var AllowChange: Boolean);
    procedure CBDefaultImageClick(Sender: TObject);
    procedure CBMenuClick(Sender: TObject);
    procedure UDMTranspChanging(Sender: TObject; var AllowChange: Boolean);
    procedure CBPopupClick(Sender: TObject);
    procedure PanelQFontClick(Sender: TObject);
    procedure PanelQFCClick(Sender: TObject);
    procedure Label39Click(Sender: TObject);
    procedure CBAllClick(Sender: TObject);
    procedure CBLang_untrChange(Sender: TObject);
    procedure CBLang_untrClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetRegularInterval;
    procedure SetRestPeriod;
    function GetDays:integer;
    procedure UpdateUserSG;
    procedure GetHMS(ASec:word;var AH,AM,ASe:word);
    procedure SetDays(ADays:string);
    procedure SetVis(ALB:TLightButton;AShape:TShape;AVis:boolean);
    procedure UpdateDir;
  end;

var
  FormSettings: TFormSettings;
  Tab_index:integer;
  b:TBitmap;
  RowActive:integer;
  SaveQuoteState:boolean=false;
  SettingsInit:boolean=false;
  tmpLang:integer;
const
   AN:word=2;
   Actions:array[0..1] of string=('Pause','Power Off');

implementation

uses Main, ControlPanel, Confirm,Types;
{$R *.dfm}

procedure GetLngFiles( Path: string; Lb: TListBox );
var
   sRec: TSearchRec;
   isFound: boolean;
begin
   isFound := FindFirst( Path + '\*.*', faAnyFile, sRec ) = 0;
   while isFound do
   begin
      if ( sRec.Name <> '.' ) and ( sRec.Name <> '..' ) then
      begin
         if ( sRec.Attr and faDirectory ) = faDirectory then
            GetLngFiles( Path + '\' + sRec.Name, Lb);
         if (LowerCase(ExtractFileExt(Path + '\' + sRec.Name))='.lng') then Lb.Items.Add( Path + '\' + sRec.Name );
      end;
      Application.ProcessMessages;
      isFound := FindNext( sRec ) = 0;
   end;
   FindClose( sRec );
end;

procedure TFormSettings.GetHMS(ASec:word;var AH,AM,ASe:word);
begin
   AH:=ASec div 3600;
   AM:=(ASec-AH*3600) div 60;
   ASe:= ASec-AH*3600-60*AM;
end;

procedure TFormSettings.SetVis(ALB:TLightButton;AShape:TShape;AVis:boolean);
begin
   ALB.Visible:=AVis;
   AShape.Visible:=AVis;
end;

procedure TFormSettings.LBAcceptClick(Sender: TObject);
begin
   SetRegularInterval;
   SetRestPeriod;
   Options.Transp:=255-round(UDTransp.Position*2.55);
   Options.MTransp:=255-round(UDMTransp.Position*2.55);

   if RBRegular.Checked then Options.RestMode:=0;
   if RBUser.Checked then Options.RestMode:=1;
   if RBBoth.Checked then Options.RestMode:=2;
   Ini.WriteBool('Options','Sound',Options.Sound);
   Ini.WriteInteger('Options','RestMode',Options.RestMode);
   Ini.WriteInteger('Options','RegularInterval',Options.RegularInterval);
   Ini.WriteInteger('Options','RestPeriod',Options.RestPeriod);
   Ini.WriteInteger('Options','Transp',Options.Transp);
   Ini.WriteInteger('Options','MTransp',Options.MTransp);

   LBAddUEChancelClick(Sender);
   Close;
end;

procedure TFormSettings.FormCreate(Sender: TObject);
var
   H,M,S:integer;
   tmpBool:boolean;
   i,tmpi:integer;
   reg: TRegistry;
begin
   case Options.RestMode of
      0:RBRegular.Checked:=true;
      1:RBUser.Checked:=true;
      2:RBBoth.Checked:=true;
   end;
   H:=Options.RegularInterval div 3600;
   M:=(Options.RegularInterval-H*3600) div 60;
   S:= Options.RegularInterval-H*3600-60*M;
   UDRHour.Position:=H;
   UDRMin.Position:=M;
   UDRSec.Position:=S;

   H:=Options.RestPeriod div 3600;
   M:=(Options.RestPeriod-H*3600) div 60;
   S:= Options.RestPeriod-H*3600-60*M;
   //FormControlPanel.Label5.Caption:= inttostr(H)+' '+inttostr(M)+' '+ IntToStr(S);
   UDRDHour.Position:=H;
   UDRDMin.Position:=M;
   UDRDSec.Position:=S;

   //Quote.ReadSectionValues('Quote',ValueListEditor1.Strings);

   Quote.ReadSection('Quote',CBQuotes_untr.Items);
   CBQuotes_untr.ItemIndex:=0;
   //MemoQuote_untr.Text:= Quote.ReadString('Quote',CBQuotes.Items[0],'');
   CBQuotes_untrChange(Sender);

   //PCMenu.Pages[0].Brush.Color:=clGreen;
   tab_index := -1; // Это описано в классе формы, потом поймешь зачем
   PCMenu.OwnerDraw := true;
   PCMenu.DoubleBuffered := true;
   b:=Graphics.TBitmap.Create;
   //GetMo

   SGUserEvent.Cells[0,0]:='Name';
   SGUserEvent.Cells[1,0]:='Days';
   SGUserEvent.Cells[2,0]:='Time';
   SGUserEvent.Cells[3,0]:='Duration';
   SGUserEvent.Cells[4,0]:='Action';
   SGUserEvent.ColWidths[0]:=300;
   SGUserEvent.ColWidths[1]:=160;
   SGUserEvent.ColWidths[2]:=100;
   SGUserEvent.ColWidths[3]:=100;
   SGUserEvent.ColWidths[4]:=150;

   UDTransp.Position:=100-Round(Options.Transp*100/255);
   UDMTransp.Position:=100-Round(Options.MTransp*100/255);
   AlphaBlendValue:=Options.MTransp;

   UpdateUserSG;
   If SGUserEvent.RowCount>1 then
   begin
      SGUserEventSelectCell(Sender,0,1,tmpBool);
      {LBUEEdit.Visible:=true;
      LBDelUserEvent.Visible:=true;
      ShapeDelUE.Visible:=true;
      ShapeEditUE.Visible:=true;}
   end
   else
   begin
      {LBUEEdit.Visible:=false;
      LBDelUserEvent.Visible:=false;
      ShapeDelUE.Visible:=false;
      ShapeEditUE.Visible:=false;}
   end;

   for i:=0 to AN-1 do
      CBAction.Items[i]:=Actions[i];
   CBAction.ItemIndex:=0;
   PCMenu.ActivePage:=TabSheet1;

   CBSound.Checked:=Options.Sound;
   CBQuote.Checked:=Options.ShowQuote;
   CBTrain.Checked:=Options.ShowTrain;
   CBRemain.Checked:=Options.ShowRemain;
   CBDefaultImage.Checked:=Options.ShowDefImage;
   CBDimm.Checked:= Options.DimmScreen;
   CBMenu.Checked:=Options.ShowMenu;
   CBPopup.Checked:=Options.PopupNotify;

   
   reg := TRegistry.Create();
   reg.RootKey := HKEY_LOCAL_MACHINE;
   if reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', False) then
   begin
      if reg.ValueExists(Application.Title) then
         CBAutorun.Checked:=true else CBAutorun.Checked:=false;
      reg.CloseKey();
   end;

   ColQ.Color:=Options.QCol;
   ColR.Color:=Options.RCol;
   ColT.Color:=Options.TCol;
   ColQL.Color:=Options.QLCol;
   ColRL.Color:=Options.RLCol;
   ColTL.Color:=Options.TLCol;
   PanelQFC.Color:=FormControlPanel.LabelQuote1_untr.Font.Color;

   if FormMain.LBShuffleQuotes.Items.Count=0 then
   begin
      SetVis(LBDel,ShapeDel,false);
      SetVis(LBSave,ShapeSave,false);
   end;

   UpdateDir;
   FormMain.ShuffleImages;
   //Ini.ReadSection('Dir',LBDir.Items);
   FormMain.TimerMain.Enabled:=true;
   if LBDir_untr.Items.Count>0 then LBDir_untr.ItemIndex:=0
   else SetVis(LBDelDir,ShapeDelDir,false);

   GetLngFiles(ExtractFilePath(Application.ExeName)+'Languages',LBLang);
   for i:=0 to LBLang.Items.Count-1 do
      CBLang_untr.Items.Add(ExtractFileName(LBLang.Items[i]));

   CBLang_untr.ItemIndex:=LBLang.Items.IndexOf(Options.LangPath);

   SettingsInit:=true;
end;

procedure TFormSettings.UpdateDir;
var
   i,tmpi:integer;
begin
   Ini.ReadSectionValues('Dir',LBDir_untr.Items);
   for i:=0 to LBDir_untr.Items.Count-1 do
   begin
      tmpi:=Pos('=',LBDir_untr.Items[i]);
      if tmpi<>0 then LBDir_untr.Items[i]:=copy(LBDir_untr.Items[i],tmpi+1,Length(LBDir_untr.Items[i]));
      FormMain.GetAllFiles(LBDir_untr.Items[i],FormMain.ListBoxShuffle,'.jpg');
   end;
end;

procedure TFormSettings.UpdateUserSG;
var
   i,j:integer;
   b:byte;
   tmpstr:string;
   H,M,S,mS:word;

begin
   UserEvents.ReadSections(ListBox2.Items);
   SGUserEvent.RowCount:=ListBox2.Items.Count+1;
   for  i:=0 to ListBox2.Items.Count-1 do
   begin
      SGUserEvent.Cells[0,i+1]:=ListBox2.Items[i];
      b:=UserEvents.ReadInteger(ListBox2.Items[i],'Days',0);
      tmpstr:='';
      for j:=6 downto 0 do
         if ((b shr j) and 1 = 1) then tmpstr:=tmpstr+','+
         TranslateString(Options.LangPath,DaysArr[6-j]);
      Delete(tmpstr,1,1);
      SGUserEvent.Cells[1,i+1]:=tmpstr;
      SGUserEvent.Cells[2,i+1]:=TimeToStr(UserEvents.ReadTime(ListBox2.Items[i],'Time',0));
      j:=UserEvents.ReadInteger(ListBox2.Items[i],'Duration',0);
      GetHMS(j,H,M,S);
      SGUserEvent.Cells[3,i+1]:=inttostr(H)+':'+inttostr(M)+':'+inttostr(S);
      SGUserEvent.Cells[4,i+1]:=Actions[UserEvents.ReadInteger(ListBox2.Items[i],'Action',0)]
   end;

   If SGUserEvent.RowCount>1 then
   begin
      LBUEEdit.Visible:=true;
      LBDelUserEvent.Visible:=true;
      ShapeDelUE.Visible:=true;
      ShapeEditUE.Visible:=true;
   end
   else
   begin
      LBUEEdit.Visible:=false;
      LBDelUserEvent.Visible:=false;
      ShapeDelUE.Visible:=false;
      ShapeEditUE.Visible:=false;
   end;
   UpdateLanguage(Options.LangPath,SGUserEvent);
end;

function TFormSettings.GetDays:integer;
begin
   Result:=ord(CB7.Checked)+(ord(CB6.Checked) shl 1)+
      (ord(CB5.Checked) shl 2)+
      (ord(CB4.Checked) shl 3)+
      (ord(CB3.Checked) shl 4)+
      (ord(CB2.Checked) shl 5)+
      (ord(CB1.Checked) shl 6);
end;

procedure TFormSettings.SetRegularInterval;
begin
   Options.RegularInterval:=  UDRHour.Position*3600
                              +UDRMin.Position*60
                              +UDRSec.Position;
end;

procedure TFormSettings.SetRestPeriod;
begin
   Options.RestPeriod:=  UDRDHour.Position*3600
                              +UDRDMin.Position*60
                              +UDRDSec.Position;
end;

procedure TFormSettings.LBChancelClick(Sender: TObject);
begin
   Close;
   LBAddUEChancelClick(Sender);
end;

procedure TFormSettings.LBAddQuoteClick(Sender: TObject);
var
   tmpstr:string;
   i:integer;
begin
   PanelAddQuote.Visible:=true;
   MemoQuote_untr.Clear;
   EditAuthor_untr.Text:='';
end;

procedure TFormSettings.CBQuotes_untrChange(Sender: TObject);
var
   str1:string;
begin
   str1:= Quote.ReadString('Quote',CBQuotes_untr.Items[CBQuotes_untr.ItemIndex],'');
   MemoQView_untr.Clear;

   MemoQView_untr.Lines.Add(copy(str1,1,Pos('+',str1)-1));
   MemoQView_untr.Lines.Add('');
   MemoQView_untr.Lines.Add(copy(str1,Pos('+',str1)+1,Length(str1)));
end;

procedure TFormSettings.LBSaveClick(Sender: TObject);
var
   str1,str2:string;
begin
   SaveQuoteState:=true;
   PanelAddQuote.Visible:=true;

   str1:= Quote.ReadString('Quote',CBQuotes_untr.Items[CBQuotes_untr.ItemIndex],'');
   MemoQuote_untr.Clear;

   MemoQuote_untr.Text:= (copy(str1,1,Pos('+',str1)-1));
   EditAuthor_untr.Text:= copy(str1,Pos('+',str1)+1,Length(str1));
end;

procedure TFormSettings.LBDelClick(Sender: TObject);
begin

   FormConfirm.LabelAsk.Caption:='Are you shure want to delete this Quote';
   UpdateLanguage(Options.LangPath,FormConfirm);
   FormConfirm.ShowModal;
   if FormConfirm.ModalResult=mrOk then
   begin
      Quote.DeleteKey('Quote',CBQuotes_untr.Items[CBQuotes_untr.ItemIndex]);

      Quote.ReadSection('Quote',CBQuotes_untr.Items);
      CBQuotes_untr.ItemIndex:=CBQuotes_untr.ItemIndex+1;
      CBQuotes_untrChange(Sender);
      FormMain.ShuffleQuotes;
      FormMain.NextQuote;
      if FormMain.LBShuffleQuotes.Items.Count=0 then
      begin
         SetVis(LBDel,ShapeDel,false);
         SetVis(LBSave,ShapeSave,false);
      end;
   end
   else exit;
end;

procedure TFormSettings.FormShow(Sender: TObject);
begin
  FormMain.OnWork(false);
  FormMain.TimerMain.Enabled:=false;
end;

procedure TFormSettings.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FormMain.TimerMain.Enabled:=true;
  //!!!FormMain.OnWork;
end;



procedure TFormSettings.PCMenuDrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
var
  AText: string;
  APoint: TPoint;
  //r: TRect;
  s : string;
begin
   case TabIndex of
      0:if Active then ImageMenu.GetBitmap(0,b) else ImageMenu.GetBitmap(1,b);
      1:if Active then ImageMenu.GetBitmap(2,b) else ImageMenu.GetBitmap(3,b);
      2:if Active then ImageMenu.GetBitmap(4,b) else ImageMenu.GetBitmap(5,b);
      3:if Active then ImageMenu.GetBitmap(6,b) else ImageMenu.GetBitmap(7,b);
   end;

   Control.Canvas.Draw(Rect.Left+(((Rect.Right - Rect.Left)-b.Width) div 2),Rect.Top+(((Rect.Bottom - Rect.Top))-b.Height)div 2,b);
end;

procedure TFormSettings.PCMenuChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
    Tab_index:=PCMenu.TabIndex;
    LBAddUEChancelClick(Sender);
    PlaySound(PansiChar(ExtractFilePath(Application.ExeName)+'Sounds\Service\MenuBtn.wav'),0, SND_ASYNC);
end;

procedure TFormSettings.LBAddUserEventClick(Sender: TObject);
var
   tmpstr:string;
   i,j:integer;
begin
   PanelAddUserEvent.Visible:=true;
   j:=1;

   while UserEvents.SectionExists('User Event '+inttostr(j)) do
   begin
      inc(j);
   end;

   EditUserEvent_untr.Text:='User Event '+inttostr(j);
   CBAction.ItemIndex:=0;
   SetDays('');

   UDUH.Position:=0;
   UDUM.Position:=0;
   UDUS.Position:=0;
   UDBDH.Position:= 0;
   UDBDM.Position:= 0;
   UDBDS.Position:= 0;
end;

procedure TFormSettings.SGUserEventSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
   H,M,S,mS:word;
   tmpstr:string;
   i:integer;
begin
   if ARow<>0 then
   begin
      EditUserEvent_untr.Text:=SGUserEvent.Cells[0,ARow];
      DecodeTime(strtotime(SGUserEvent.Cells[2,ARow]),H,M,S,mS);

      UDUH.Position:=H;
      UDUM.Position:=M;
      UDUS.Position:=S;

      DecodeTime(StrToTime(SGUserEvent.Cells[3,ARow]),H,M,S,mS);

      UDBDH.Position:= H;
      UDBDM.Position:= M;
      UDBDS.Position:= S;

      tmpstr:=SGUserEvent.Cells[1,ARow];
      SetDays(tmpstr);

      CBAction.ItemIndex:=UserEvents.ReadInteger(EditUserEvent_untr.Text,'Action',0);
   end;

   RowActive:=ARow;
   if RowActive=0 then
   begin
      LBUEEdit.Visible:=false;
      LBDelUserEvent.Visible:=false;
      ShapeDelUE.Visible:=false;
      ShapeEditUE.Visible:=false;
   end
   else
   begin
      LBUEEdit.Visible:=true;
      LBDelUserEvent.Visible:=true;
      ShapeDelUE.Visible:=true;
      ShapeEditUE.Visible:=true;
   end;
end;

procedure TFormSettings.SetDays;
begin
   if pos(TranslateString(Options.LangPath,'Mn'),ADays)<>0 then CB1.Checked:=true else CB1.Checked:=false;
   if pos(TranslateString(Options.LangPath,'Tu'),ADays)<>0 then CB2.Checked:=true else CB2.Checked:=false;
   if pos(TranslateString(Options.LangPath,'We'),ADays)<>0 then CB3.Checked:=true else CB3.Checked:=false;
   if pos(TranslateString(Options.LangPath,'Th'),ADays)<>0 then CB4.Checked:=true else CB4.Checked:=false;
   if pos(TranslateString(Options.LangPath,'Fr'),ADays)<>0 then CB5.Checked:=true else CB5.Checked:=false;
   if pos(TranslateString(Options.LangPath,'Sa'),ADays)<>0 then CB6.Checked:=true else CB6.Checked:=false;
   if pos(TranslateString(Options.LangPath,'Su'),ADays)<>0 then CB7.Checked:=true else CB7.Checked:=false;
end;

procedure TFormSettings.LBDelUserEventClick(Sender: TObject);
begin
   FormConfirm.LabelAsk.Caption:='Are you sure you want to delete this event?';
   UpdateLanguage(Options.LangPath,FormConfirm);
   FormConfirm.ShowModal;
   if FormConfirm.ModalResult=mrOk then
   begin
      if UserEvents.SectionExists(SGUserEvent.Cells[0,RowActive]) then
         UserEvents.EraseSection(SGUserEvent.Cells[0,RowActive]);
      UpdateUserSG;
      FormMain.UpdateUserEvents;
   end;
end;

procedure TFormSettings.LBAddUEConfirmClick(Sender: TObject);
var
   tmpstr:string;
   tmpbool:boolean;
begin
   if EditUserEvent_untr.Text='' then
   begin
      FormConfirm.LabelAsk.Caption:='Enter the name of event that you create!';
      UpdateLanguage(Options.LangPath, FormConfirm);
      FormConfirm.ShowModal;
      exit;
   end;

   if GetDays=0 then
   begin
      FormConfirm.LabelAsk.Caption:='You should shoose at least one day of the week!';
      UpdateLanguage(Options.LangPath, FormConfirm);
      FormConfirm.ShowModal;
      exit;
   end;

   if (UDBDH.Position=0) and (UDBDM.Position=0) and (UDBDS.Position=0) then
   begin
      FormConfirm.LabelAsk.Caption:='You should set the duration of the event you create!';
      UpdateLanguage(Options.LangPath, FormConfirm);
      FormConfirm.ShowModal;
      exit;
   end;

   PanelAddUserEvent.Visible:=false;

   tmpstr:=EditUH.Text+':'+EditUM.Text+':'+EditUS.Text;
   UserEvents.WriteTime(EditUserEvent_untr.Text,'Time',StrToDateTime(tmpstr));
   UserEvents.WriteInteger(EditUserEvent_untr.Text,'Days',GetDays);
   UserEvents.WriteInteger(EditUserEvent_untr.Text,'Duration',strtoint(EditUDH.text)*3600+strtoint(EditUDM.Text)*60+strtoint(EditUDS.Text));
   UserEvents.WriteInteger(EditUserEvent_untr.Text,'Action',CBAction.ItemIndex);
   FormMain.UpdateUserEvents;
   UpdateUserSG;
   tmpBool:=false;
   SGUserEvent.Row:=SGUserEvent.RowCount-1;

end;

procedure TFormSettings.LBAddUEChancelClick(Sender: TObject);
begin
   PanelAddUserEvent.Visible:=false;
end;

procedure TFormSettings.SGUserEventDblClick(Sender: TObject);
var
   tmpbool:boolean;
begin
   if RowActive=0 then exit;
   PanelAddUserEvent.Visible:=true;
   SGUserEventSelectCell(Sender, 0,  RowActive, tmpBool);
end;

procedure TFormSettings.LBUEEditClick(Sender: TObject);
var
   tmpbool:boolean;
begin
   PanelAddUserEvent.Visible:=true;
   SGUserEventSelectCell(Sender, 0,  RowActive, tmpBool);
end;

procedure TFormSettings.LBQuoteAddClick(Sender: TObject);
var
   tmpstr:string;
   i:integer;
begin
   PanelAddQuote.Visible:=false;

   if MemoQuote_untr.Lines.Count=0 then exit;
   tmpstr:='';
   for i:=0 to MemoQuote_untr.Lines.Count-1 do
      tmpstr:=tmpstr+MemoQuote_untr.Lines[i];
   tmpstr:=tmpstr+'+'+EditAuthor_untr.Text;
   Quote.ReadSection('quote',ListBox1.Items);
   if SaveQuoteState then i:=strtoint(CBQuotes_untr.Items[CBQuotes_untr.ItemIndex]) else
      if ListBox1.Items.Count=0 then i:=1 else i:=strtoint(ListBox1.Items[ListBox1.Items.Count-1])+1;
   Quote.WriteString('quote',inttostr(i),tmpstr);
   Quote.ReadSection('Quote',CBQuotes_untr.Items);
   CBQuotes_untr.ItemIndex:=CBQuotes_untr.Items.Count-1;
   CBQuotes_untrChange(Sender);
   FormMain.ShuffleQuotes;
   if FormMain.LBShuffleQuotes.Items.Count>0 then
   begin
      SetVis(LBDel,ShapeDel,true);
      SetVis(LBSave,ShapeSave,true);
   end;
   SaveQuoteState:=false;
end;

procedure TFormSettings.LBQChancelClick(Sender: TObject);
begin
   PanelAddQuote.Visible:=false;
   SaveQuoteState:=false;
end;

procedure TFormSettings.CBSoundClick(Sender: TObject);
begin
   if SettingsInit then
   begin
      if CBSound.Checked then
      begin
         Options.Sound:=true;
         FormControlPanel.LabelSound.Caption:='Mute';
         Ini.WriteBool('Options','Sound',true);
         FormControlPanel.LBSound.Glyphs:=FormControlPanel.ImageSound;
         FormMain.PopupMenu2.Items[4].Checked:=true;
      end else
      begin
         Options.Sound:=false;
         FormControlPanel.LabelSound.Caption:='Sound';
         Ini.WriteBool('Options','Sound',false);
         FormControlPanel.LBSound.Glyphs:=FormControlPanel.ImageNoSound;
         FormSettings.CBSound.Checked:=false;
         FormMain.PopupMenu2.Items[4].Checked:=false;
      end;
   end;
end;

procedure TFormSettings.CBQuoteClick(Sender: TObject);
begin
   if SettingsInit then
   begin
      if CBQuote.Checked then
      begin
         Options.ShowQuote:=true;
         FormControlPanel.PanelQuote.Visible:=true;
         Ini.WriteBool('Options','ShowQuote',true);
         FormMain.PopupMenu2.Items[0].Checked:=true;
      end else
      begin
         Options.ShowQuote:=false;
         FormControlPanel.PanelQuote.Visible:=false;
         Ini.WriteBool('Options','ShowQuote',false);
         FormMain.PopupMenu2.Items[0].Checked:=false;
      end;
   end;
end;

procedure TFormSettings.CBAutorunClick(Sender: TObject);
var
   reg: TRegistry;
begin
   if SettingsInit then
   begin
      reg := TRegistry.Create();
      reg.RootKey := HKEY_LOCAL_MACHINE;
      if CBAutorun.Checked then
      begin
         if reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', True) then
         begin
            reg.WriteString( Application.Title, Application.ExeName);
            reg.CloseKey();
         end;
      end
      else if reg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', False) then
         begin
            reg.DeleteValue( Application.Title );
            reg.CloseKey();
         end;
   end;
end;

procedure TFormSettings.CBDimmClick(Sender: TObject);
begin
   if SettingsInit then
   begin
      if CBDimm.Checked then
      begin
         Options.DimmScreen:=true;
         Ini.WriteBool('Options','DimmScreen',true);
      end
      else
      begin
         Options.DimmScreen:=false;
         Ini.WriteBool('Options','DimmScreen',false);
      end;
   end;
end;

procedure TFormSettings.CBTrainClick(Sender: TObject);
begin
   if SettingsInit then
   begin
      if CBTrain.Checked then
      begin
         Options.ShowTrain:=true;
         FormControlPanel.PanelTrain.Visible:=true;
         //FormControlPanel.TimerTAnim.Enabled:=true;
         Ini.WriteBool('Options','ShowTrain',true);
         FormMain.PopupMenu2.Items[2].Checked:=true;
      end else
      begin
         Options.ShowTrain:=false;
         FormControlPanel.PanelTrain.Visible:=false;
         //FormControlPanel.TimerTAnim.Enabled:=true;
         Ini.WriteBool('Options','ShowTrain',false);
         FormMain.PopupMenu2.Items[2].Checked:=false;
      end;
   end;
end;

procedure TFormSettings.CBRemainClick(Sender: TObject);
begin
   if SettingsInit then
   begin
      if CBRemain.Checked then
      begin
         Options.ShowRemain:=true;
         FormControlPanel.PanelRemain.Visible:=true;
         Ini.WriteBool('Options','ShowRemain',true);
         FormMain.PopupMenu2.Items[1].Checked:=true;
      end else
      begin
         Options.ShowRemain:=false;
         FormControlPanel.PanelRemain.Visible:=false;
         Ini.WriteBool('Options','ShowRemain',false);
         FormMain.PopupMenu2.Items[1].Checked:=false;
      end;
   end;
end;

procedure TFormSettings.ColRClick(Sender: TObject);
begin
   if ColorDialog1.Execute then
   begin
      if TPanel(Sender).Name='ColT' then
      begin
         FormControlPanel.PanelHT.Color:=ColorDialog1.Color;
         FormControlPanel.ShapeHT.Pen.Color:=ColorDialog1.Color;
         FormControlPanel.PanelHT.Font.Color:=$FFFFFF xor ColorDialog1.Color;
      end;
      if TPanel(Sender).Name='ColQ' then
      begin
         FormControlPanel.PanelHQ.Color:=ColorDialog1.Color;
         FormControlPanel.ShapeHQ.Pen.Color:=ColorDialog1.Color;
         FormControlPanel.PanelHQ.Font.Color:=$FFFFFF xor ColorDialog1.Color;
      end;
      if TPanel(Sender).Name='ColR' then
      begin
         FormControlPanel.PanelHR.Color:=ColorDialog1.Color;
         FormControlPanel.ShapeHR.Pen.Color:=ColorDialog1.Color;
         FormControlPanel.PanelHR.Font.Color:=$FFFFFF xor ColorDialog1.Color;
      end;
      if TPanel(Sender).Name='ColRL' then FormControlPanel.PanelHR.Font.Color:=ColorDialog1.Color;
      if TPanel(Sender).Name='ColQL' then FormControlPanel.PanelHQ.Font.Color:=ColorDialog1.Color;
      if TPanel(Sender).Name='ColTL' then FormControlPanel.PanelHT.Font.Color:=ColorDialog1.Color;
      TPanel(Sender).Color:=ColorDialog1.Color;
      Ini.WriteInteger('Options',TPanel(Sender).Name,ColorDialog1.Color);
   end;
end;

procedure TFormSettings.ColRLClick(Sender: TObject);
begin
   if ColorDialog1.Execute then
   begin
      if TPanel(Sender).Name='ColRL' then FormControlPanel.PanelHR.Font.Color:=ColorDialog1.Color;
      if TPanel(Sender).Name='ColQL' then FormControlPanel.PanelHQ.Font.Color:=ColorDialog1.Color;
      if TPanel(Sender).Name='ColTL' then FormControlPanel.PanelHT.Font.Color:=ColorDialog1.Color;
      TPanel(Sender).Color:=ColorDialog1.Color;
      Ini.WriteInteger('Options',TPanel(Sender).Name,ColorDialog1.Color);
   end;
end;

procedure TFormSettings.LBBrowseClick(Sender: TObject);
var
   tmpstr:string;
   i:integer;
begin
   if SelectDirectory('Выберите каталог', '', tmpstr) then
   begin
      //for i:=0 to LBDir.Items.Count-1 do
      i:=0;
      while i<=LBDir_untr.Items.Count-1 do
      begin
         //if LBDir.Items[i]=tmpstr then
         if (pos(tmpstr,LBDir_untr.Items[i])<>0) or (pos(LBDir_untr.Items[i],tmpstr)<>0) then
         begin
            if (length(LBDir_untr.Items[i])=length(tmpstr)) or (length(tmpstr)>length(LBDir_untr.Items[i])) then
            begin
               FormConfirm.LabelAsk.Caption:='This directory alredy added!';
               UpdateLanguage(Options.LangPath,FormConfirm);
               FormConfirm.ShowModal;
               exit;
            end;
            if length(tmpstr)<length(LBDir_untr.Items[i]) then
            begin
               LBDir_untr.Items.Delete(i);
               continue;
            end;

         end;
         inc(i);
      end;
      LBDir_untr.Items.Add(tmpstr);

      FormMain.GetAllFiles( tmpstr,FormMain.ListBoxShuffle,'.jpg');

      Ini.EraseSection('Dir');
      for i:=0 to LBDir_untr.Items.Count-1 do
      begin
         Ini.WriteString('Dir',inttostr(i),LBDir_untr.Items[i]);
      end;
      LBDir_untr.ItemIndex:=LBDir_untr.Items.Count-1;
      if LBDir_untr.ItemIndex>=0 then SetVis(LBDelDir,ShapeDelDir,true);
      FormMain.ShuffleImages;
   end;
end;

procedure TFormSettings.LBDelDirClick(Sender: TObject);
var
   i,j:integer;
begin
   FormConfirm.LabelAsk.Caption:='Images from this directory will no longer appear during the break! Are you shure want to delete this link?';
   UpdateLanguage(Options.LangPath,FormConfirm);
   FormConfirm.ShowModal;
   if FormConfirm.ModalResult=mrOk then
   begin
      Ini.ReadSectionValues('Dir',LBDirs.Items);
      if LBDirs.Items.Count=0 then exit;
      for i:=0 to LBDirs.Items.Count-1 do
      begin
         if copy(LBDirs.Items[i],pos('=',LBDirs.Items[i])+1,Length(LBDirs.Items[i]))=LBDir_untr.Items[LBDir_untr.ItemIndex] then
         begin
            //for j:=0 to FormMain.ListBoxShuffle.Items.Count-1 do
            j:=0;
            while j<=FormMain.ListBoxShuffle.Items.Count-1 do
            begin
               if pos(LBDir_untr.Items[LBDir_untr.ItemIndex],FormMain.ListBoxShuffle.Items[j])<>0 then
                  FormMain.ListBoxShuffle.Items.Delete(j) else
               inc(j)
            end;

            Ini.DeleteKey('Dir',copy(LBDirs.Items[i],1,pos('=',LBDirs.Items[i])-1));
            UpdateDir;
            if LBDir_untr.Items.Count>0 then LBDir_untr.ItemIndex:=LBDir_untr.Items.Count-1 else
               SetVis(LBDelDir,ShapeDelDir,false);
            FormMain.ShuffleImages;
            break;
         end;
      end;
   end;
end;

procedure TFormSettings.UDTranspChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if SettingsInit then
      Options.Transp:=255-round(UDTransp.Position*2.55);
end;

procedure TFormSettings.CBDefaultImageClick(Sender: TObject);
var
   i:integer;
begin
   if SettingsInit then
   begin
      if CBDefaultImage.Checked then
      begin
         Options.ShowDefImage:=true;
         Ini.WriteBool('Options','ShowDefImage',true);
         FormMain.GetAllFiles(DefaultDir,FormMain.ListBoxShuffle,'.jpg');
         FormMain.ShuffleImages;
      end else
      begin
         Options.ShowDefImage:=false;
         Ini.WriteBool('Options','ShowDefImage',false);
         i:=0;
         while i<=FormMain.ListBoxShuffle.Items.Count-1 do
            if pos(DefaultDir,FormMain.ListBoxShuffle.Items[i])<>0 then
               FormMain.ListBoxShuffle.Items.Delete(i) else inc(i);
         FormMain.ShuffleImages;
      end;
   end;
end;

procedure TFormSettings.CBMenuClick(Sender: TObject);
begin
   if SettingsInit then
   begin
      if CBMenu.Checked then
      begin
         Options.ShowMenu:=true;
         Ini.WriteBool('Options','ShowMenu',true);
         FormControlPanel.PanelSystem.Visible:=true;
         FormMain.PopupMenu2.Items[3].Checked:=true;
      end else
      begin
         Options.ShowMenu:=false;
         Ini.WriteBool('Options','ShowMenu',false);
         FormControlPanel.PanelSystem.Visible:=false;
         FormMain.PopupMenu2.Items[3].Checked:=false;
      end;
   end;
end;

procedure TFormSettings.UDMTranspChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if SettingsInit then
   begin
      Options.MTransp:=255-round(UDMTransp.Position*2.55);
      AlphaBlendValue:=Options.MTransp;
   end;
end;

procedure TFormSettings.CBPopupClick(Sender: TObject);
begin
   if SettingsInit then
   begin
      if CBPopup.Checked then
      begin
         Options.PopupNotify:=true;
         Ini.WriteBool('Options','PopUp',true);
         //CBSound.Checked:=false;
      end else
      begin
         Options.PopupNotify:=false;
         Ini.WriteBool('Options','PopUp',false);
      end;
   end;
end;

procedure TFormSettings.PanelQFontClick(Sender: TObject);
var
   TmpCol:TColor;
begin
   FDQuote.Font.Charset:=RUSSIAN_CHARSET;
   if (TPanel(Sender).Name='PanelQFont') {or
         (TPanel(Sender).Name='ChangeFont')} then
   begin
      FDQuote.Font:=FormControlPanel.LabelQuote1_untr.Font;
      TmpCol:=FormControlPanel.LabelQuote1_untr.Font.Color;
   end;
   if TPanel(Sender).Name='PanelTFont' then
   begin
      FDQuote.Font:=FormControlPanel.LabelTraining.Font;
      TmpCol:=FormControlPanel.LabelTraining.Font.Color;
   end;
   
   if FDQuote.Execute then
   begin

      if (TPanel(Sender).Name='PanelQFont') then
      begin
         FormControlPanel.LabelQuote1_untr.Font:=FDQuote.Font;
         FormControlPanel.LabelQuote1_untr.Font.Color:=TmpCol;
         FormMain.SaveFont('QuoteFont',FormControlPanel.LabelQuote1_untr.Font);
         FormControlPanel.PanelQuote.Height:= FormControlPanel.LabelQuote1_untr.Top+
            FormControlPanel.LabelQuote1_untr.Height+20;
      end;
      if TPanel(Sender).Name='PanelTFont' then
      begin
         FormControlPanel.LabelTraining.Font:=FDQuote.Font;
         FormControlPanel.LabelTraining.Font.Color:=TmpCol;
         FormMain.SaveFont('TrainFont',FormControlPanel.LabelTraining.Font);
         FormControlPanel.PanelTrain.Height:= FormControlPanel.LabelTraining.Top+
            FormControlPanel.LabelTraining.Height+20;
      end;
      {if (FormControlPanel.MemoQuote_untr.Font.Color=clBlack) or
         (FormControlPanel.MemoQuote_untr.Font.Color=-16777208) then}
         //FormControlPanel.MemoQuote_untr.Font.Color:=clWhite;
      //FDQuote.Font.Style

   end;
end;

procedure TFormSettings.PanelQFCClick(Sender: TObject);
begin
   if ColorDialog1.Execute then
   begin
      if TPanel(Sender).Name='PanelQFC' then
      begin
         FormControlPanel.LabelQuote1_untr.Font.Color:=ColorDialog1.Color;
         Ini.WriteInteger('Options','QuoteFontColor',ColorDialog1.Color);
         PanelQFC.Color:=ColorDialog1.Color;
      end;
      if TPanel(Sender).Name='PanelRFC' then
      begin
         FormControlPanel.LabelLabelRemain1_untr.Font.Color:=ColorDialog1.Color;
         Ini.WriteInteger('Options','RemainFontColor',ColorDialog1.Color);
      end;
      if TPanel(Sender).Name='PanelTFC' then
      begin
         FormControlPanel.LabelTraining.Font.Color:=ColorDialog1.Color;
         Ini.WriteInteger('Options','TrainFontColor',ColorDialog1.Color);
         PanelTFC.Color:=ColorDialog1.Color;
      end;
   end;
end;

procedure TFormSettings.Label39Click(Sender: TObject);
begin
   ShellExecute(Handle,'open','Readme.txt',nil,nil,SW_ShowNormal);
end;

procedure TFormSettings.CBAllClick(Sender: TObject);
begin
   CB1.Checked:=CBAll.Checked;
   CB2.Checked:=CBAll.Checked;
   CB3.Checked:=CBAll.Checked;
   CB4.Checked:=CBAll.Checked;
   CB5.Checked:=CBAll.Checked;
   CB6.Checked:=CBAll.Checked;
   CB7.Checked:=CBAll.Checked;
end;

procedure TFormSettings.CBLang_untrChange(Sender: TObject);
begin
   FormConfirm.LabelAsk.Caption:='Restart the application for the changes to take effect!';
   UpdateLanguage(Options.LangPath,FormConfirm);
   FormConfirm.ShowModal;
   if FormConfirm.ModalResult=mrOk then
   begin
      //Options.LangPath:=LBLang.Items[CBLang_untr.ItemIndex];
      Ini.WriteString('Options','LangPath',ExtractFileName(LBLang.Items[CBLang_untr.ItemIndex]));
   end else
      CBLang_untr.ItemIndex:=LBLang.Items.IndexOf(Options.LangPath);
end;

procedure TFormSettings.CBLang_untrClick(Sender: TObject);
begin
   tmpLang:=CBLang_untr.ItemIndex;
end;

end.
