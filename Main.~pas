unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, mmsystem, IniFiles,ShellApi,
  Menus, MPlayer, ActnList,Event1, AppEvnts, MultiLanguage;

const
  WM_ICONTRAY = WM_USER + 1;

type
  TFormMain = class(TForm)
    Image1: TImage;
    TimerDelayControlPanel: TTimer;
    TimerMain: TTimer;
    TimerMainAnimation: TTimer;
    ListBoxShuffle: TListBox;
    LBShuffleQuotes: TListBox;
    PopupMenu1: TPopupMenu;
    About: TMenuItem;
    Exit2: TMenuItem;
    Makeabreak1: TMenuItem;
    LBUserEvents: TListBox;
    LBShuffleUser: TListBox;
    LBTrain: TListBox;
    MP: TMediaPlayer;
    PopupMenu2: TPopupMenu;
    ShQuote: TMenuItem;
    ShRemainTime: TMenuItem;
    ShTrain: TMenuItem;
    ShMenuPanel: TMenuItem;
    plSound: TMenuItem;
    BacktoWindows2: TMenuItem;
    Settings2: TMenuItem;
    BacktoWindows3: TMenuItem;
    ExitEyeSaver1: TMenuItem;
    ActionList1: TActionList;
    Action1: TAction;
    ApplicationEvents1: TApplicationEvents;
    Settings1: TMenuItem;
    Work0000001: TMenuItem;
    procedure TimerDelayControlPanelTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TimerMainTimer(Sender: TObject);
    procedure TimerMainAnimationTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Settings1Click(Sender: TObject);
    procedure Exit2Click(Sender: TObject);
    procedure Makeabreak1Click(Sender: TObject);
    procedure AboutClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ShQuoteClick(Sender: TObject);
    procedure ShRemainTimeClick(Sender: TObject);
    procedure ShTrainClick(Sender: TObject);
    procedure ShMenuPanelClick(Sender: TObject);
    procedure plSoundClick(Sender: TObject);
    procedure Settings2Click(Sender: TObject);
    procedure ExitEyeSaver1Click(Sender: TObject);
    procedure BacktoWindows3Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
  private
    { Private declarations }
    TrayIconData: TNotifyIconData;



    procedure ShuffleUser;
    procedure ShuffleTraining;

  public
    { Public declarations }
    procedure TrayMessage(var Msg: TMessage); message WM_ICONTRAY;
    procedure OnRest;
    procedure OnWork(AReset:boolean);
    procedure InitSettingsForm;
    procedure ReadSettings;
    procedure UpdateUserEvents;
    function  DayOfWeek(ADays:byte;ADay:word):boolean;
    procedure PowerOff;
    procedure ShuffleQuotes;
    procedure GetAllFiles( Path: string; Lb: TListBox ;AExt:string );
    procedure ShuffleImages;
    function ProporIt(AH,AW:integer):boolean;
    function StratchIt(AH,AW:integer):boolean;
    procedure PlayS;
    Procedure StopS;
    procedure BlockI(AValue:boolean);
    procedure NextQuote;
    Procedure SaveFont(APanel:string;AFont:TFont);
    procedure LoadFont(APanel:string;AFont:TFont);
  end;

type
   TRestMode=(rm_regular,rm_user,rm_both);
type
   TOptions=record
      Sound:boolean;
      RestMode:byte;
      RegularInterval:integer;
      RestPeriod:integer;
      ShowQuote:boolean;
      ShowTrain:boolean;
      ShowRemain:boolean;
      ShowDefImage:boolean;
      ShowMenu:boolean;
      PopupNotify:boolean;
      DimmScreen:boolean;
      LangPath:string;
      Transp: byte;
      MTransp: byte;
      RectTrain:TRect;
      RectQuote:TRect;
      RectRemain:TRect;
      RectEvent:TRect;
      TCol:TColor;
      QCol:TColor;
      RCol:TColor;
      TLCol:TColor;
      QLCol:TColor;
      RLCol:TColor;
   end;

type
   PUserEvent=^TUserEvent;
   TUserEvent=Record
      Time:TDateTime;
      Days:Byte;
      Duration:integer;
      Name:string;
      Action:integer;
   end;

var
  FormMain: TFormMain;
  TmpDateTime:TDateTime;
  RestState:boolean;
  ImageList:TStrings;
  Ini:TIniFile;
  UserEvents:TIniFile;
  Options:TOptions;
  Quote:TIniFile;
  CtrDisplay:boolean;
  CurrentSound:string;
  ShuffleImagesIndex:integer;
  ShuffleQuoteIndex:integer;
  ShuffleUserIndex:integer;
  ShuffleTrainIndex:integer;
  LitUserEvents:TList;
  tmpUEvent:TUserEvent;
  FUserRest:boolean;
  CurrUBName:string;
  CurrUBDuration:integer;
  Rect:TRect;
  DefaultDir:string;
  FirstIdle:boolean=true;
  CurrentMessage:string='';
const
   DaysArr: array[0..6] of string=('Mn','Tu','We','Th','Fr','Sa','Su');

implementation

uses ControlPanel, DateUtils, Math, Settings, Confirm;

{$R *.dfm}
Procedure TFormMain.SaveFont(APanel:string;AFont:TFont);
var
   i:integer;
begin

   Ini.WriteString('Options',APanel+'Name',AFont.Name);
   Ini.WriteInteger('Options',APanel+'Size',AFont.Size);
   i:=0;
   if fsBold in AFont.Style then i:=i+$1;
   if fsItalic in AFont.Style then i:=i or $2;
   if fsUnderline in AFont.Style then i:=i or $4;
   if fsStrikeOut in AFont.Style then i:=i or $8;
   Ini.WriteInteger('Options',APanel+'Style',i);
end;

procedure TFormMain.LoadFont(APanel:string;AFont:TFont);
var
   i:integer;
   tmp:TFontStyles;
begin
   AFont.Name:= Ini.ReadString('Options',APanel+'Name','Times New Roman');
   AFont.Size:=Ini.ReadInteger('Options',APanel+'Size',10);
   AFont.Color:=Ini.ReadInteger('Options',APanel+'Color',clWhite);
   i:=Ini.ReadInteger('Options',APanel+'Style',0);
   tmp:=[];
   if (i and 1=1) then
      Include(tmp,TFontStyle(fsBold));
   if i and $2=$2 then
      Include(tmp,fsItalic);
   if i and $4=$4 then
      Include(tmp,fsUnderline);
   if i and $8=$8 then
      Include(tmp,fsStrikeOut);
   AFont.Style:=tmp;
end;


procedure TFormMain.BlockI(AValue:boolean);

   function FuncAvail(dllName, funcName: string; var p: pointer): boolean;
   var
     lib: THandle;
   begin
     result := false;
     p := nil;
     if LoadLibrary(PChar(dllName)) = 0 then exit;
     lib := GetModuleHandle(PChar(dllName)) ;
     if lib <> 0 then
     begin
      p := GetProcAddress(lib, PChar(funcName)) ;
      if p <> nil then Result := true;
     end;
   end;
 
   var
     BlockInput : function(Block: BOOL): BOOL; stdcall;
begin
  if FuncAvail('USER32.DLL', 'BlockInput', @BlockInput) then
     BlockInput(AValue) ;
end;

procedure TFormMain.PlayS;
begin
      if FileExists(CurrentSound) and (Options.Sound) and not Options.PopupNotify then
      begin
         try
            MP.FileName:=CurrentSound;
            MP.Open;
            MP.Play;
         finally
         end;
      end;
end;

Procedure TFormMain.StopS;
begin
    //if Options.Sound and not Options.PopupNotify then
    if MP.FileName<>'' then
    begin
      try
         MP.Stop;
         MP.Close;
         MP.FileName:='';
      finally
      end;
    end;
end;

function TFormMain.ProporIt(AH,AW:integer):boolean;
const
   kC:real=0.01;
   kH:real=0.2;
   hW:real=0.2;
var
   Sides:real;
begin
   Sides:=Screen.Width/Screen.Height;
   if (AW/AH<=Sides+kH) and (AW/AH>=Sides-kH) then result:=false
   else Result:=true;
end;

function TFormMain.StratchIt(AH,AW:integer):boolean;
const
   kC:real=0.01;
   kH:real=0.01;
   hW:real=0.01;
begin
   if (Screen.Width/AW>1.5) or (Screen.Height/AH>1.5) then result:=false
   else result:=true;
end;

function  TFormMain.DayOfWeek(ADays:byte;ADay:word):boolean;
var
   i:integer;
begin
   Result:=false;
   for i:=6 downto 0 do
      if ((ADays shr i) and 1 = 1) and (ADay=7-i) then
      begin
         result:=true;
         break;
      end;
end;

procedure  TFormMain.UpdateUserEvents;
var
   i:integer;
   p:PUserEvent;
begin
   LitUserEvents.Clear;
   LBUserEvents.Clear;
   UserEvents.ReadSections(LBUserEvents.Items);

   for i:=0 to LBUserEvents.Items.Count-1 do
   begin
      p:=New(PUserEvent);
      p^.Time:=UserEvents.ReadDateTime(LBUserEvents.Items[i],'Time',0);
      p^.Name:=LBUserEvents.Items[i];
      p^.Duration:=UserEvents.ReadInteger(LBUserEvents.Items[i],'Duration',0);
      p^.Days:=UserEvents.ReadInteger(LBUserEvents.Items[i],'Days',0);
      p^.Action:=UserEvents.ReadInteger(LBUserEvents.Items[i],'Action',0);
      LitUserEvents.Add(p);
   end;
end;

procedure TFormMain.TrayMessage(var Msg: TMessage);
var
  P: TPoint;
  tmpP,x1,x2:integer;
  tmps:string;
begin
  case Msg.LParam of
    WM_LBUTTONDOWN:
      {ShowMessage('Нажата левая кнопка мыши')}
      begin
         if FormSettings.Showing then
         begin
            FormSettings.Close;
         end
         else
         begin
            FormSettings.Show;
         end;
      end;
      //FormSettings.Show;
    WM_RBUTTONDOWN:
    begin
      tmpP:= round(Options.RegularInterval-SecondSpan(Now,TmpDateTime));
      x1:=tmpP div 3600;
      x2:=(tmpP-x1*3600) div 60;
      tmps:=Format('%.2d',[x1])+':'+Format('%.2d',[x2])+':'+ Format('%.2d',[tmpP-x1*3600-x2*60]);
      if Not RestState then
      begin
         if (Options.RestMode=0) or (Options.RestMode=2) then
            PopupMenu1.Items[0].Caption:=TranslateString(Options.LangPath,'Work')+' '+tmps
         else PopupMenu1.Items[0].Caption:=TranslateString(Options.LangPath,'No breaks');
      end
      else PopupMenu1.Items[0].Caption:=TranslateString(Options.LangPath,'Break');
      GetCursorPos(p);
      PopupMenu1.Popup(P.X, P.Y);
    end;
  end;
end;

procedure TFormMain.ReadSettings;
var
   tmpFont:TFont;
begin
   Options.Sound:=Ini.ReadBool('Options','Sound',true);
   Options.RestMode:=Ini.ReadInteger('Options','RestMode',0);
   Options.RegularInterval:=Ini.ReadInteger('Options','RegularInterval',6);
   Options.RestPeriod:=Ini.ReadInteger('Options','RestPeriod',15);
   Options.ShowQuote:=Ini.ReadBool('Options','ShowQuote',true);
   Options.ShowTrain:=Ini.ReadBool('Options','ShowTrain',true);
   Options.ShowRemain:=Ini.ReadBool('Options','ShowRemain',true);
   Options.ShowDefImage:=Ini.ReadBool('Options','ShowDefImage',true);
   Options.ShowMenu:=Ini.ReadBool('Options','ShowMenu',true);
   Options.PopupNotify:=Ini.ReadBool('Options','PopUp',false);
   Options.DimmScreen:=Ini.ReadBool('Options','DimmScreen',false);
   Options.Transp:=Ini.ReadInteger('Options','Transp',150);
   Options.MTransp:=Ini.ReadInteger('Options','MTransp',150);
   Options.RectTrain.Left:=Ini.ReadInteger('Options','TrainL',400);
   Options.RectTrain.Top:=Ini.ReadInteger('Options','TrainT',100);
   Options.RectQuote.Left:=Ini.ReadInteger('Options','QuoteL',250);
   Options.RectQuote.Top:=Ini.ReadInteger('Options','QuoteT',100);
   Options.RectRemain.Left:=Ini.ReadInteger('Options','RemainL',10);
   Options.RectRemain.Top:=Ini.ReadInteger('Options','RemainT',10);

   Options.RectEvent.Left:=Ini.ReadInteger('Options','EventL',10);
   Options.RectEvent.Top:=Ini.ReadInteger('Options','EventT',10);

   Options.TCol:=Ini.ReadInteger('Options','ColT',$0074F5A8);
   Options.QCol:=Ini.ReadInteger('Options','ColQ',$00EDBF81);
   Options.RCol:=Ini.ReadInteger('Options','ColR',$0030A5EB);
   Options.TLCol:=Ini.ReadInteger('Options','ColTL',clBlack);
   Options.QLCol:=Ini.ReadInteger('Options','ColQL',clBlack);
   Options.RLCol:=Ini.ReadInteger('Options','ColRL',clBlack);
   Options.LangPath:=Ini.ReadString('Options','LangPath','');
   if Options.LangPath<>'' then Options.LangPath:=ExtractFilePath(Application.ExeName)+'Languages\'+Options.LangPath;
   //LoadFont('QuoteFont',FormControlPanel.LabelQuote1.Font);
end;


procedure TFormMain.InitSettingsForm;
var
   H,M,S:integer;
begin
   case Options.RestMode of
      0:FormSettings.RBRegular.Checked:=true;
      1:FormSettings.RBUser.Checked:=true;
      2:FormSettings.RBBoth.Checked:=true;
   end;
end;

procedure TFormMain.TimerDelayControlPanelTimer(Sender: TObject);
begin
   FormControlPanel.AlphaBlendValue:=0;
   FormControlPanel.TimerPanelAnimation.Enabled:=true;
   FormControlPanel.Show;
   TimerDelayControlPanel.Enabled:=false;
end;

procedure TFormMain.ShuffleQuotes;
var
   i,y:integer;
   temp:string;
begin
   ShuffleQuoteIndex:=0;
   Randomize;
   LBShuffleQuotes.Clear;
   Quote.ReadSectionValues('Quote',LBShuffleQuotes.Items);
   for i:=0 to LBShuffleQuotes.Items.Count-1 do
   begin
      y:=Random(LBShuffleQuotes.Items.Count);
      temp:=LBShuffleQuotes.Items[i];
      LBShuffleQuotes.Items[i]:=LBShuffleQuotes.Items[y];
      LBShuffleQuotes.Items[y]:=temp;
   end;
end;

function MyExitWindows(RebootParam: Longword): Boolean;
var
   TTokenHd: THandle;
   TTokenPvg: TTokenPrivileges;
   cbtpPrevious: DWORD;
   rTTokenPvg: TTokenPrivileges;
   pcbtpPreviousRequired: DWORD;
   tpResult: Boolean;
const
   SE_SHUTDOWN_NAME = 'SeShutdownPrivilege';
begin
   if Win32Platform = VER_PLATFORM_WIN32_NT then
   begin
      tpResult := OpenProcessToken(GetCurrentProcess(),
      TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY,
      TTokenHd);
      if tpResult then
      begin
         tpResult := LookupPrivilegeValue(nil,
                                       SE_SHUTDOWN_NAME,
                                       TTokenPvg.Privileges[0].Luid);
         TTokenPvg.PrivilegeCount := 1;
         TTokenPvg.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
         cbtpPrevious := SizeOf(rTTokenPvg);
         pcbtpPreviousRequired := 0;
         if tpResult then
            Windows.AdjustTokenPrivileges(TTokenHd,
                                      False,
                                      TTokenPvg,
                                      cbtpPrevious,
                                      rTTokenPvg,
                                      pcbtpPreviousRequired);
      end;
   end;
  Result := ExitWindowsEx(RebootParam, 0);
end;

procedure TFormMain.ShuffleUser;
var
   i,y:integer;
   temp:string;
begin
   ShuffleUserIndex:=0;
   Randomize;
   for i:=0 to LBShuffleUser.Items.Count-1 do
   begin
      y:=Random(LBShuffleUser.Items.Count);
      temp:=LBShuffleUser.Items[i];
      LBShuffleUser.Items[i]:=LBShuffleUser.Items[y];
      LBShuffleUser.Items[y]:=temp;
   end;
end;

procedure TFormMain.PowerOff;
begin
   try
      MyExitWindows(EWX_POWEROFF or EWX_FORCE);//Выключение
      //MyExitWindows(EWX_REBOOT or EWX_FORCE);//Перезагрузка
   except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
   end;
   Close;
end;

procedure TFormMain.ShuffleTraining;
var
   i,y:integer;
   temp:string;
begin
   ShuffleTrainIndex:=0;
   Randomize;
   for i:=0 to LBTrain.Items.Count-1 do
   begin
      y:=Random(LBTrain.Items.Count);
      temp:=LBTrain.Items[i];
      LBTrain.Items[i]:=LBTrain.Items[y];
      LBTrain.Items[y]:=temp;
   end;
end;

procedure TFormMain.ShuffleImages;
var
   i,y:integer;
   temp:string;
begin
   ShuffleImagesIndex:=0;
   Randomize;
   for i:=0 to ListBoxShuffle.Items.Count-1 do
   begin
      y:=Random(ListBoxShuffle.Items.Count);
      temp:=ListBoxShuffle.Items[i];
      ListBoxShuffle.Items[i]:=ListBoxShuffle.Items[y];
      ListBoxShuffle.Items[y]:=temp;
   end;
end;

procedure TFormMain.FormCreate(Sender: TObject);
var
   Sides:real;
begin
   //DoubleBuffered:=true;
   LitUserEvents:=TList.Create;

   with TrayIconData do
   begin
      cbSize:= SizeOf(TrayIconData);
      Wnd:= Handle;
      uID:= 0;
      uFlags:= NIF_MESSAGE + NIF_ICON + NIF_TIP;
      uCallbackMessage:= WM_ICONTRAY;
      hIcon:= Application.Icon.Handle;
      szTip:= 'Eye Saver';
   end;
   Shell_NotifyIcon(NIM_ADD, @TrayIconData);

   Ini:=TIniFile.Create(copy(Application.ExeName,1,Length(Application.ExeName)-4)+'.ini');
   UserEvents:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'UserEvents.ini');

   Quote:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'Quote.ini');
   UpdateUserEvents;
   ReadSettings;

   Sides:=Screen.Width/Screen.Height;
   if (Sides>1.2) and (Sides<1.4) then
   begin
      DefaultDir:=ExtractFilePath(Application.ExeName)+'\Images\4_3\';
      if Options.ShowDefImage then GetAllFiles(DefaultDir,ListBoxShuffle,'.jpg');
      GetAllFiles(ExtractFilePath(Application.ExeName)+'Images\User Breaks\4_3',LBShuffleUser,'.jpg');

   end
   else
   begin
      DefaultDir:=ExtractFilePath(Application.ExeName)+'\Images\16_9\';
      if Options.ShowDefImage then GetAllFiles(DefaultDir,ListBoxShuffle,'.jpg');
      GetAllFiles(ExtractFilePath(Application.ExeName)+'Images\User Breaks\16_9',LBShuffleUser,'.jpg');
   end;

   GetAllFiles(ExtractFilePath(Application.ExeName)+'Images\Training',LBTrain,'.bmp');

   ShuffleImages;
   ShuffleUser;

   ShuffleQuotes;
   ShuffleTraining;

   ShuffleImagesIndex:=0;
   ShuffleQuoteIndex:=0;
   ShuffleUserIndex:=0;
   ShuffleTrainIndex:=0;
   PopupMenu2.Items[0].Checked:=Options.ShowQuote;
   PopupMenu2.Items[1].Checked:=Options.ShowRemain;
   PopupMenu2.Items[2].Checked:=Options.ShowTrain;
   PopupMenu2.Items[3].Checked:=Options.ShowMenu;
   PopupMenu2.Items[4].Checked:=Options.Sound;

   

   TmpDateTime:=Now;
   RestState:=false;
   FUserRest:=false;
   CtrDisplay:=false;
   //Options.LangPath:=ExtractFilePath(Application.ExeName)+'\Languages\English.lng';
end;

procedure TFormMain.NextQuote;
var
   tmpstr,tmpNum:string;
   TmpPos:integer;

begin
   if LBShuffleQuotes.Items.Count=0 then tmpStr:=TranslateString(Options.LangPath,'No records found') else
   begin
      tmpstr:=LBShuffleQuotes.Items[ShuffleQuoteIndex];

      inc(ShuffleQuoteIndex);
      if ShuffleQuoteIndex>=LBShuffleQuotes.Items.Count then ShuffleQuotes;

      TmpPos:=Pos('=',tmpstr);
      tmpNum:=copy(tmpstr,1,TmpPos-1);
      Delete(tmpstr,1,TmpPos);
      Insert(#13+#13, tmpstr, Pos('+',tmpstr));
      Delete(tmpstr,Pos('+',tmpstr),1);
      FormControlPanel.LabelQuote1_untr.Tag:=strtoint(tmpNum);
   end;
   FormControlPanel.LabelQuote1_untr.Caption:=tmpstr;
   FormControlPanel.PanelQuote.Height:= FormControlPanel.LabelQuote1_untr.Top+
      FormControlPanel.LabelQuote1_untr.Height+20;
end;

procedure TFormMain.OnRest;
var
  Hour, Min, Sec, MSec: Word;
  tmpstr:string;
  TmpPos,bh,ih:integer;
  TrainTmp:string;
  tmpRect:TRect;
begin
   //PopupMenu1.Items[3].Caption:='Rest Mode';
   RestState:=true;
   CtrDisplay:=true;
   TmpDateTime:=Now;

      if not FUserRest then
      begin
         if ListBoxShuffle.Items.Count=0 then tmpstr:='' else tmpstr:=ListBoxShuffle.Items[ShuffleImagesIndex];
         inc(ShuffleImagesIndex);
         if ShuffleImagesIndex>=ListBoxShuffle.Items.Count then
         begin
            ShuffleImages;
            ShuffleImagesIndex:=0;
         end;

         //BlockI(true);
         //ShowCursor(false);
      end else
      begin
         FormControlPanel.LabelUser_untr.Visible:=true;
         FormControlPanel.PanelUser.Visible:=true;
         if LBShuffleUser.Items.Count=0 then tmpstr:='' else tmpstr:=LBShuffleUser.Items[ShuffleUserIndex];
         inc(ShuffleUserIndex);
         if ShuffleUserIndex>=LBShuffleUser.Items.Count then ShuffleUser;
      end;

      if LBTrain.Items.Count=0 then TrainTmp:='' else TrainTmp:=LBTrain.Items[ShuffleTrainIndex];
      inc(ShuffleTrainIndex);
      if ShuffleTrainIndex>=LBTrain.Items.Count then ShuffleTraining;



      if FileExists(tmpstr) then
      begin
         Image1.Picture.LoadFromFile(tmpstr);
         Image1.Stretch:=StratchIt(Image1.Picture.Graphic.Height,Image1.Picture.Graphic.Width);
         Image1.Proportional:=ProporIt(Image1.Picture.Graphic.Height,Image1.Picture.Graphic.Width);
      end
      else
      begin
         Image1.Picture:=Nil;
      end; {ShowMessage('Image does not exist')}

      if FileExists(TrainTmp) then
      begin
         FormControlPanel.ImageTrain.Picture.LoadFromFile(TrainTmp);
         TrainTmp:=ExtractFileName(TrainTmp);
         FormControlPanel.LabelTraining.Caption:=TranslateString(Options.LangPath,
            Quote.ReadString('Train',copy(TrainTmp,1,2),''));
      end else
      begin
         FormControlPanel.LabelTraining.Caption:=TranslateString(Options.LangPath,'No records found');
         FormControlPanel.ImageTrain.Canvas.Font.Color:=clWhite;
         FormControlPanel.ImageTrain.Canvas.Font.Name:='Times new Roman';
         FormControlPanel.ImageTrain.Canvas.Font.Size:=-15;
         FormControlPanel.ImageTrain.Canvas.Brush.Color:=clBlack;
         FormControlPanel.ImageTrain.Canvas.FillRect(FormControlPanel.ImageTrain.Canvas.ClipRect);
         FormControlPanel.ImageTrain.Canvas.TextOut(
            FormControlPanel.ImageTrain.Width div 2-FormControlPanel.ImageTrain.Canvas.TextWidth(TranslateString(Options.LangPath,'No Image found')) div 2,
            FormControlPanel.ImageTrain.Height div 2-FormControlPanel.ImageTrain.Canvas.TextHeight('N') ,
            TranslateString(Options.LangPath,'No Image found'));
      end;

      FormControlPanel.PanelTrain.Height:= FormControlPanel.LabelTraining.Top+
         FormControlPanel.LabelTraining.Height+20;


      CurrentSound:=ExtractFilePath(Application.ExeName)+'Sounds\'+
         Copy(ExtractFileName(tmpstr),1,Length(ExtractFileName(tmpstr))-4)+'.mp3';

      PlayS;
      NextQuote;

   if Options.PopupNotify then
   begin
      FormEvent.AddEvent(CurrentMessage);
      if CurrentMessage='Time to take a break' then UpdateLanguage(Options.LangPath,FormEvent);
   end
   else
   begin
      SetWindowPos(Self.Handle, HWND_TOP, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);
      FormMain.Show;
      //!!!FormMain.Visible:=true;
      TimerMainAnimation.Enabled:=true;
   end;
end;

procedure TFormMain.OnWork;
begin
   FormControlPanel.LabelUser_untr.Visible:=false;
   FormControlPanel.PanelUser.Visible:=false;
   RestState:=false;
   FUserRest:=false;
   CtrDisplay:=false;
   if AReset then TmpDateTime:=Now;
   FormMain.Visible:=false;
   AlphaBlendValue:=0;
   FormControlPanel.Visible:=false;

   TimerMainAnimation.Enabled:=false;

   TimerDelayControlPanel.Enabled:=false;
   FormControlPanel.AlphaBlendValue:=0;

   FormControlPanel.TimerPanelAnimation.Enabled:=false;
   if FormConfirm.Showing then FormConfirm.Close;
   //BlockI(false);

   StopS;
   if Options.DimmScreen then SendMessage(Handle, WM_SYSCOMMAND, SC_MONITORPOWER, -1);
   If FormEvent.Showing then
   begin
    FormEvent.Close;
    FormEvent.Height:=0;
   end;
end;

procedure TFormMain.TimerMainTimer(Sender: TObject);
var
  d : double;
  tmpInt,tmpP,x1,x2:integer;
  tmps:string;
  i:integer;
  H1,M1,S1,Ms1,H2,M2,S2,Ms2,Y,WY,DW:word;
  TmpTime:TDateTime;
  chtmp:array [0..7] of Ansichar;
begin
   d:=SecondSpan(Now,TmpDateTime);



   if (Options.RestMode=0) or (Options.RestMode=2) then
   begin
      if (d>=Options.RegularInterval) and Not RestState then
      begin
         CurrentMessage:='Time to take a break';
         OnRest;
         d:=SecondSpan(Now,TmpDateTime);//!!!
      end;
      if (d>=Options.RestPeriod) and RestState and (Not FUserRest) then
      begin
         OnWork(true);
      end;

   end;
   if (Options.RestMode=1) or (Options.RestMode=2) then
   begin
      //User notifications
      if Not FUserRest{Not RestState} then
      begin
         for i:=0 to LitUserEvents.Count-1 do
         begin
            TmpTime:=TUserEvent(LitUserEvents.Items[i]^).Time;
            DecodeTime(Now,H1,M1,S1,Ms1);
            DecodeDateWeek(Now,Y,WY,DW);
            DecodeTime(TmpTime,H2,M2,S2,Ms2);
            if (H1=H2) and (M1=M2) {and (Not RestState)} then
            begin
               if DayOfWeek(TUserEvent(LitUserEvents.Items[i]^).Days,DW) then
               begin
                  CurrentMessage:=TUserEvent(LitUserEvents.Items[i]^).Name;
                  FormControlPanel.LabelUser_untr.Caption:=TUserEvent(LitUserEvents.Items[i]^).Name;
                  CurrUBDuration:=TUserEvent(LitUserEvents.Items[i]^).Duration;
                  //

                  if RestState then OnWork(true);
                  FUserRest:=true;
                  TmpDateTime:=Now;
                  d:=SecondSpan(Now,TmpDateTime);

                  case TUserEvent(LitUserEvents.Items[i]^).Action of
                     0:OnRest;
                     1:
                        begin
                           Image1.Picture.LoadFromFile(LBShuffleUser.Items[random(LBShuffleUser.Items.Count)]);
                           FormMain.Show;
                           //OnRest;
                           //FormControlPanel.Visible:=false;
                           FormMain.TimerMain.Enabled:=false;

                           FormConfirm.LabelAsk.Caption:='You were planning to shut down the computer at this time. Turn it off?';
                           UpdateLanguage(Options.LangPath,FormConfirm);
                           FormConfirm.TimerPowerOff.Enabled:=true;
                           FormConfirm.LabelTime.Visible:=true;
                           FormConfirm.ShowModal;
                           FormConfirm.TimerPowerOff.Enabled:=false;
                           FormConfirm.LabelTime.Visible:=false;
                           if FormConfirm.ModalResult=mrOk then
                           begin
                              PowerOff;
                              Close;
                           end;
                           OnWork(true);
                           FormMain.TimerMain.Enabled:=true;

                        end;
                  end;
                  LitUserEvents.Delete(i);
                  break;
               end;
            end;

         end;

      end;
      if (d>=CurrUBDuration) and RestState and FUserRest then
      begin
         OnWork(True);

      end;
   end;

   if RestState then
      begin
         if FUserRest then tmpInt:=round(CurrUBDuration-d)
         else tmpInt:=Round(Options.RestPeriod-d);
         //FormControlPanel.LabelRemain.Caption:=Format('%.2d',[tmpInt div 60])+':'+ Format('%.2d',[tmpInt-(tmpInt div 60)*60]);
         FormControlPanel.LabelLabelRemain1_untr.Caption:=Format('%.2d',[tmpInt div 60])+':'+ Format('%.2d',[tmpInt-(tmpInt div 60)*60]);
         FormEvent.LabelRTime_untr.Caption:=Format('%.2d',[tmpInt div 60])+':'+ Format('%.2d',[tmpInt-(tmpInt div 60)*60]);
      end
      else
      begin
         {tmpP:= (round(Options.RegularInterval-d));
         x1:=tmpP div 3600;
         x2:=(tmpP-x1*3600) div 60;

         tmps:=Format('%.2d',[x1])+':'+Format('%.2d',[x2])+':'+ Format('%.2d',[tmpP-x1*3600-x2*60]);
         PopupMenu1.Items[3].Caption:=tmps;}
      end;


   if (MP.FileName<>'') and (MP.Position=MP.Length) and (Options.Sound) then
   begin
      MP.Rewind;
      MP.Play;
   end;
end;

procedure TFormMain.TimerMainAnimationTimer(Sender: TObject);
begin
   AlphaBlendValue:=AlphaBlendValue+10;
   if AlphaBlendValue>=245 then
   begin
      AlphaBlendValue:=255;
      TimerMainAnimation.Enabled:=false;
      TimerDelayControlPanel.Enabled:=true;
   end;
end;

procedure TFormMain.GetAllFiles( Path: string; Lb: TListBox ;AExt:string);
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
            GetAllFiles( Path + '\' + sRec.Name, Lb, AExt );
         if (LowerCase(ExtractFileExt(Path + '\' + sRec.Name))='.jpg') or
         (LowerCase(ExtractFileExt(Path + '\' + sRec.Name))='.bmp') then Lb.Items.Add( Path + '\' + sRec.Name );
      end;
      Application.ProcessMessages;
      isFound := FindNext( sRec ) = 0;
   end;
   FindClose( sRec );
end;

procedure TFormMain.FormDestroy(Sender: TObject);
var
   i:integer;
begin
   for i:=0 to LitUserEvents.Count-1 do
      Dispose(LitUserEvents.Items[i]);
   Shell_NotifyIcon(NIM_DELETE, @TrayIconData);
   Ini.Destroy;
   UserEvents.Destroy;
end;

procedure TFormMain.Settings1Click(Sender: TObject);
begin
   if FormSettings.Showing then
   begin
      FormSettings.Close;
   end
   else
   begin
      FormSettings.Show;
   end;
end;

procedure TFormMain.Exit2Click(Sender: TObject);
begin
   CLose;
end;

procedure TFormMain.Makeabreak1Click(Sender: TObject);
begin
  if FormSettings.Showing then FormSettings.Close;
  if RestState then exit;
  CurrentMessage:='Time to take a break';
  OnRest;
end;

procedure TFormMain.AboutClick(Sender: TObject);
begin
   //!!!OnWork;
   FormSettings.Show;
   FormSettings.PCMenu.ActivePage:=FormSettings.About;
end;

procedure TFormMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   Ini.WriteInteger('Options','TrainL',FormControlPanel.PanelTrain.Left);
   Ini.WriteInteger('Options','TrainT',FormControlPanel.PanelTrain.Top);
   Ini.WriteInteger('Options','QuoteL',FormControlPanel.PanelQuote.Left);
   Ini.WriteInteger('Options','QuoteT',FormControlPanel.PanelQuote.Top);
   Ini.WriteInteger('Options','RemainL',FormControlPanel.PanelRemain.Left);
   Ini.WriteInteger('Options','RemainT',FormControlPanel.PanelRemain.Top);
   Ini.WriteInteger('Options','EventT',FormEvent.Top);
   Ini.WriteInteger('Options','EventL',FormEvent.Left);
end;

procedure TFormMain.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  P: TPoint;
begin
   if (Button=mbRight) then
   begin
      GetCursorPos(p);
      PopupMenu2.Popup(P.X, P.Y);
      
   end;
end;

procedure TFormMain.ShQuoteClick(Sender: TObject);
begin
   if not Options.ShowQuote then FormSettings.CBQuote.Checked:=true
   else FormSettings.CBQuote.Checked:=false;
end;

procedure TFormMain.ShRemainTimeClick(Sender: TObject);
begin
   if not Options.ShowRemain then FormSettings.CBRemain.Checked:=true
   else FormSettings.CBRemain.Checked:=false;
end;

procedure TFormMain.ShTrainClick(Sender: TObject);
begin

   if not Options.ShowTrain then FormSettings.CBTrain.Checked:=true
   else
   begin
      tmpRectT.Top:=FormControlPanel.PanelTrain.Top;
      tmpRectT.Left:=FormControlPanel.PanelTrain.Left;
      tmpRectT.Bottom:=FormControlPanel.PanelTrain.Height;
      FormSettings.CBTrain.Checked:=false;
   end;
end;

procedure TFormMain.ShMenuPanelClick(Sender: TObject);
begin
   if not Options.ShowMenu then FormSettings.CBMenu.Checked:=true
   else FormSettings.CBMenu.Checked:=false;
end;

procedure TFormMain.plSoundClick(Sender: TObject);
begin
   if not Options.Sound then
   begin
      FormSettings.CBSound.Checked:=true;
      {if FileExists(CurrentSound) and (Options.Sound) then
      begin
         MP.FileName:=CurrentSound;
         MP.Open;
         MP.Play;
      end;}
      PlayS;
   end
   else
   begin
      FormSettings.CBSound.Checked:=false;
      {if MP.FileName<>'' then MP.Stop;
      MP.Close;
      MP.FileName:='';}
      StopS;
   end;
end;

procedure TFormMain.Settings2Click(Sender: TObject);
begin
   FormMain.OnWork(false);
   FormSettings.Show;
end;

procedure TFormMain.ExitEyeSaver1Click(Sender: TObject);
begin
   FormConfirm.LabelAsk.Caption:='Are you shure you want to exit Eye Saver?';
   UpdateLanguage(Options.LangPath, FormConfirm);
   FormConfirm.ShowModal;
   if FormConfirm.ModalResult=mrOk then Close;
end;

procedure TFormMain.BacktoWindows3Click(Sender: TObject);
begin
   OnWork(true);
end;

procedure TFormMain.Action1Execute(Sender: TObject);
begin
   ExitEyeSaver1Click(Sender);
end;

procedure TFormMain.ApplicationEvents1Idle(Sender: TObject;
  var Done: Boolean);
begin
  if FirstIdle then
  begin
    FormEvent.Init(FormControlPanel);
    FormEvent.Transp:=180;
    FirstIdle:=false;
    //MP.FileName:='C:\Work\Temp\delphi\transparent\Sounds\Blackwood.mp3';
    UpdateLanguage(Options.LangPath, Application,dpm_update);
  end;
end;

end.
