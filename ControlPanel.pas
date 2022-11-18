unit ControlPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, LightButton, ImgList, Buttons, StdCtrls, ComCtrls,
  ActnList, Menus;

type
  TFormControlPanel = class(TForm)
    PanelSystem: TPanel;
    Shape1: TShape;
    LBSettings: TLightButton;
    jh: TImageList;
    LBWindows: TLightButton;
    Shape2: TShape;
    LBSound: TLightButton;
    Shape3: TShape;
    ImageList1: TImageList;
    TimerPanelAnimation: TTimer;
    ImageNoSound: TImageList;
    LabelDate_untr: TLabel;
    LabelTime_untr: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LabelSound: TLabel;
    TimerUpdate: TTimer;
    ImageSound: TImageList;
    ImageClBtn: TImageList;
    TimerQAnim: TTimer;
    ImageDwnBtn: TImageList;
    PanelUser: TPanel;
    LabelUser_untr: TLabel;
    ShapeHT: TShape;
    ImageTrain: TImage;
    LabelTraining: TLabel;
    PanelTrain: TPanel;
    PanelHT: TPanel;
    LBClTrain: TLightButton;
    ImageClSq: TImageList;
    TimerTAnim: TTimer;
    PanelQuote: TPanel;
    ShapeHQ: TShape;
    LabelQuote1_untr: TLabel;
    PanelHQ: TPanel;
    LBClQuote: TLightButton;
    PanelRemain: TPanel;
    ShapeHR: TShape;
    PanelHR: TPanel;
    LBClRemain: TLightButton;
    LabelLabelRemain1_untr: TLabel;
    TimerQuAnim: TTimer;
    TimerRAnim: TTimer;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    PMQuote: TPopupMenu;
    NextQuote1: TMenuItem;
    EditQuote1: TMenuItem;
    DeleteQuote1: TMenuItem;
    HideQuotes1: TMenuItem;
    PanelQFont: TMenuItem;
    PanelQFC: TMenuItem;
    PMTrain: TPopupMenu;
    PanelTFont: TMenuItem;
    PanelTFC: TMenuItem;
    procedure TimerPanelAnimationTimer(Sender: TObject);
    procedure LBWindowsClick(Sender: TObject);
    procedure TimerUpdateTimer(Sender: TObject);
    procedure LBSettingsClick(Sender: TObject);
    procedure LBSoundClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LBCloseQuoteClick(Sender: TObject);
    procedure TimerQAnimTimer(Sender: TObject);
    procedure PanelTrainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PanelHTMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LBClTrainClick(Sender: TObject);
    procedure TimerTAnimTimer(Sender: TObject);
    procedure PanelHQMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PanelHRMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TimerQuAnimTimer(Sender: TObject);
    procedure LBClQuoteClick(Sender: TObject);
    procedure LBClRemainClick(Sender: TObject);
    procedure TimerRAnimTimer(Sender: TObject);
    procedure LabelLabelRemain1_untrMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure LabelQuote1_untrMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageTrainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageTrainDblClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure NextQuote1Click(Sender: TObject);
    procedure EditQuote1Click(Sender: TObject);
    procedure DeleteQuote1Click(Sender: TObject);
    procedure HideQuotes1Click(Sender: TObject);
    procedure PanelQFontClick(Sender: TObject);
    procedure PanelQFCClick(Sender: TObject);
    procedure PanelTFontClick(Sender: TObject);
    procedure PanelTFCClick(Sender: TObject);
  private
    { Private declarations }
    procedure WrapPanel(APanel:TPanel);
    procedure ResetTrain;
    procedure ResetQuote;
    procedure ResetRemain;
  public
    { Public declarations }
  end;

var
  FormControlPanel: TFormControlPanel;
  tmpRectT,tmpRectR,tmpRectQ:TRect;

const
   SpeedAnim:integer=5;

   

implementation

uses Main, Settings, mmsystem, Confirm, Event1, MultiLanguage;
{$R *.dfm}

procedure TFormControlPanel.ResetTrain;
begin
   PanelTrain.Top:=10;
   PanelTrain.Left:=250;
end;

procedure TFormControlPanel.ResetQuote;
begin
   PanelQuote.Top:=150;
   PanelQuote.Left:=10;
end;

procedure TFormControlPanel.ResetRemain;
begin
   PanelRemain.Top:=10;
   PanelRemain.Left:=10;
end;

procedure TFormControlPanel.TimerPanelAnimationTimer(Sender: TObject);
begin
   if AlphaBlendValue+10>=255 then AlphaBlendValue:=255
   else AlphaBlendValue:=AlphaBlendValue+10;

   if AlphaBlendValue>=Options.Transp then
   begin
      AlphaBlendValue:=Options.Transp;
      TimerPanelAnimation.Enabled:=false;
      if Options.DimmScreen and not FUserRest then
         SendMessage(Handle, WM_SYSCOMMAND, SC_MONITORPOWER, 2);
      //FormEvent.AddEvent('Time to Break');
   end;
end;

procedure TFormControlPanel.LBWindowsClick(Sender: TObject);
begin
   PlaySound(PansiChar(ExtractFilePath(Application.ExeName)+'Sounds\Service\CtrPanelBtnSound.wav'),0, SND_ASYNC);
   FormMain.OnWork(true);
end;

procedure TFormControlPanel.TimerUpdateTimer(Sender: TObject);
begin
   if Visible then
   begin
      //LabelDate_untr.Caption:=FormatDateTime('dd mmmm yyyy',Now);
      LabelDate_untr.Caption:=FormatDateTime('dd',Now)+' '+
         TranslateString(Options.LangPath,FormatDateTime('mmmm',Now))+' '+
         FormatDateTime('yyyy',Now);
      LabelTime_untr.Caption:=FormatDateTime('hh:mm',Now);
   end;
end;

procedure TFormControlPanel.LBSettingsClick(Sender: TObject);
begin
   PlaySound(PansiChar(ExtractFilePath(Application.ExeName)+'Sounds\Service\CtrPanelBtnSound.wav'),0, SND_ASYNC);
   FormMain.OnWork(true);
   FormSettings.Show;
end;

procedure TFormControlPanel.LBSoundClick(Sender: TObject);
begin
   If Options.Sound then
   begin
      PlaySound(PansiChar(ExtractFilePath(Application.ExeName)+'Sounds\Service\SoundOff.wav'),0, SND_ASYNC);
      Options.Sound:=false;
      LabelSound.Caption:='Sound';

      {PlaySound(0, 0, 0);}
      {if FormMain.MP.FileName<>'' then FormMain.MP.Stop;
      FormMain.MP.Close;
      FormMain.MP.FileName:=''; }
      FormMain.StopS;


      Ini.WriteBool('Options','Sound',false);
      LBSound.Glyphs:=ImageNoSound;
      FormSettings.CBSound.Checked:=false;
   end
   else
   begin
      PlaySound(PansiChar(ExtractFilePath(Application.ExeName)+'Sounds\Service\SoundOn.wav'),0, SND_ASYNC);
      Options.Sound:=true;
      LabelSound.Caption:='Mute';

      {if FileExists(CurrentSound) then
         PlaySound(PAnsiChar(CurrentSound),0, SND_ASYNC or SND_LOOP);}
      {if FileExists(CurrentSound) and (Options.Sound) then
      begin
         FormMain.MP.FileName:=CurrentSound;
         FormMain.MP.Open;
         FormMain.MP.Play;
      end;}
      FormMain.PlayS;
      Ini.WriteBool('Options','Sound',true);
      LBSound.Glyphs:=ImageSound;
      FormSettings.CBSound.Checked:=true;
   end;
   UpdateLanguage(Options.LangPath,LabelSound);
end;

procedure TFormControlPanel.FormCreate(Sender: TObject);
var
   tmpFont:TFont;
begin
   Width:=Screen.Width;
   Height:=Screen.Height;

   if Options.Sound then
   begin
      LabelSound.Caption:='Mute';
      LBSound.Glyphs:=ImageSound;
   end
   else
   begin
      LabelSound.Caption:='Sound';
      LBSound.Glyphs:=ImageNoSound;
   end;

    PanelTrain.Left:= Options.RectTrain.Left;
    PanelTrain.Top:= Options.RectTrain.Top;
    PanelQuote.Left:= Options.RectQuote.Left;
    PanelQuote.Top:= Options.RectQuote.Top;
    PanelRemain.Left:= Options.RectRemain.Left;
    PanelRemain.Top:= Options.RectRemain.Top;

    PanelTrain.Visible:=Options.ShowTrain;
    PanelQuote.Visible:=Options.ShowQuote;
    PanelRemain.Visible:=Options.ShowRemain;
    PanelSystem.Visible:=Options.ShowMenu;

    PanelHT.Color:=Options.TCol;
    PanelHR.Color:=Options.RCol;
    PanelHQ.Color:=Options.QCol;

    ShapeHT.Pen.Color:=Options.TCol;
    ShapeHQ.Pen.Color:=Options.QCol;
    ShapeHR.Pen.Color:=Options.RCol;

    PanelHT.Font.Color:=Options.TLCol;
    PanelHR.Font.Color:=Options.RLCol;
    PanelHQ.Font.Color:=Options.QLCol;
    FormMain.LoadFont('QuoteFont',LabelQuote1_untr.Font);
    FormMain.LoadFont('TrainFont',LabelTraining.Font);
    {FormMain.LoadFont('RemainFont',LabelLabelRemain1.Font);}

    if (PanelTrain.Top>Height-5) or (PanelTrain.Left>Width-5) or
      (PanelTrain.Top<-20) or (PanelTrain.Left<-20) then
      ResetTrain;
    if (PanelQuote.Top>Height-5) or (PanelQuote.Left>Width-5) or
    (PanelQuote.Top<-20) or (PanelQuote.Left<-20) then
      ResetQuote;
    if (PanelRemain.Top>Height-5) or (PanelRemain.Left>Width-5) or
    (PanelRemain.Top<-20) or (PanelRemain.Left<-20) then
      ResetRemain;
end;

procedure TFormControlPanel.LBCloseQuoteClick(Sender: TObject);
begin
   TimerQAnim.Enabled:=true;
end;

procedure TFormControlPanel.TimerQAnimTimer(Sender: TObject);
begin
   {if Options.ShowQuote then
   begin
      //LabelQuote.Visible:=false;
      ShapeQuote.Height:=ShapeQuote.Height-25;
      PCloseQ.Top:=PCloseQ.Top-25;
      if ShapeQuote.Height<=130 then
      begin
         TimerQAnim.Enabled:=false;
         ShapeQuote.Height:=130;
         PCloseQ.Top:=125;
         PCloseQ.Left:=190;
         LBCloseQuote.Glyphs:=ImageDwnBtn;
         Options.ShowQuote:=false;
         Ini.WriteBool('Options','ShowQuote',false);
      end;
   end
   else
   begin
      ShapeQuote.Height:=ShapeQuote.Height+25;
      PCloseQ.Top:=PCloseQ.Top+25;
      if ShapeQuote.Height>=385 then
      begin
         TimerQAnim.Enabled:=false;
         ShapeQuote.Height:=385;
         PCloseQ.Top:=378;
         PCloseQ.Left:=186;
         LBCloseQuote.Glyphs:=ImageClBtn;
         Options.ShowQuote:=true;
         LabelQuote.Visible:=true;
         Ini.WriteBool('Options','ShowQuote',true);
      end;
   end;}

end;

procedure TFormControlPanel.PanelTrainMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  SC_DragMove = $F012;
begin
  {ReleaseCapture;
  PanelTrain.Perform(WM_SysCommand, SC_DragMove, 0);}
end;

procedure TFormControlPanel.PanelHTMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  SC_DragMove = $F012;
begin
  ReleaseCapture;
  PanelTrain.Perform(WM_SysCommand, SC_DragMove, 0);
end;

procedure TFormControlPanel.LBClTrainClick(Sender: TObject);
begin
   tmpRectT.Top:=PanelTrain.Top;
   tmpRectT.Left:=PanelTrain.Left;
   tmpRectT.Bottom:=PanelTrain.Height;

   //FormSettings.CBTrain.Checked:=false;
   TimerTAnim.Enabled:=true;
end;

procedure TFormControlPanel.WrapPanel;
begin
   //
end;

procedure TFormControlPanel.TimerTAnimTimer(Sender: TObject);
begin
      //LabelTraining.Visible:=false;
      //ImageTrain.Visible:=false;
      //PanelTrain.Top:=PanelTrain.Top+SpeedAnim;
      PanelTrain.height:=PanelTrain.height-SpeedAnim*2;
      if PanelTrain.height<=10 then
      begin
         PanelTrain.Height:=60;
         PanelTrain.Visible:=false;
         PanelTrain.Top:=tmpRectT.Top;
         PanelTrain.Left:=tmpRectT.Left;
         PanelTrain.Height:=tmpRectT.Bottom;
         LabelTraining.Visible:=true;
         ImageTrain.Visible:=true;
         TimerTAnim.Enabled:=false;
         FormSettings.CBTrain.Checked:=false;
         {PanelTrain.Visible:=false;
         TimerTAnim.Enabled:=false;
         FormSettings.CBTrain.Checked:=false;}
      end;
end;

procedure TFormControlPanel.PanelHQMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  SC_DragMove = $F012;
begin
  ReleaseCapture;
  PanelQuote.Perform(WM_SysCommand, SC_DragMove, 0);
end;

procedure TFormControlPanel.PanelHRMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  SC_DragMove = $F012;
begin
  ReleaseCapture;
  PanelRemain.Perform(WM_SysCommand, SC_DragMove, 0);
end;

procedure TFormControlPanel.TimerQuAnimTimer(Sender: TObject);
begin
   //LabelQuote1.Visible:=false;
   //PanelQuote.Top:=PanelQuote.Top+SpeedAnim;
   PanelQuote.height:=PanelQuote.height-2*SpeedAnim;
   if PanelQuote.height<=10 then
   begin
      PanelQuote.Height:=10;
      PanelQuote.Visible:=false;
      PanelQuote.Top:=tmpRectQ.Top;
      PanelQuote.Left:=tmpRectQ.Left;
      PanelQuote.Height:=tmpRectQ.Bottom;
      //LabelQuote1.Visible:=true;
      TimerQuAnim.Enabled:=false;
      FormSettings.CBQuote.Checked:=false;
      //Ini.WriteBool('Options','ShowQuote',false);
   end;
end;

procedure TFormControlPanel.LBClQuoteClick(Sender: TObject);
begin
   tmpRectQ.Top:=PanelQuote.Top;
   tmpRectQ.Left:=PanelQuote.Left;
   tmpRectQ.Bottom:=PanelQuote.Height;
   
   TimerQuAnim.Enabled:=true;
end;

procedure TFormControlPanel.LBClRemainClick(Sender: TObject);
begin
   tmpRectR.Top:=PanelRemain.Top;
   tmpRectR.Left:=PanelRemain.Left;
   tmpRectR.Bottom:=PanelRemain.Height;
   ;
   TimerRAnim.Enabled:=true;
end;

procedure TFormControlPanel.TimerRAnimTimer(Sender: TObject);
begin
   //LabelLabelRemain1.Visible:=false;
   //PanelRemain.Top:=PanelRemain.Top+SpeedAnim;
   PanelRemain.height:=PanelRemain.height-2*SpeedAnim;
   if PanelRemain.height<=10 then
   begin
      PanelRemain.Height:=10;
      PanelRemain.Visible:=false;
      PanelRemain.Top:=tmpRectR.Top;
      PanelRemain.Left:=tmpRectR.Left;
      PanelRemain.Height:=tmpRectR.Bottom;
      //LabelLabelRemain1.Visible:=true;
      TimerRAnim.Enabled:=false;
      //Ini.WriteBool('Options','ShowRemain',false);
      FormSettings.CBRemain.Checked:=false;
   end;
end;

procedure TFormControlPanel.LabelLabelRemain1_untrMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  SC_DragMove = $F012;
begin
  ReleaseCapture;
  PanelRemain.Perform(WM_SysCommand, SC_DragMove, 0);

end;

procedure TFormControlPanel.LabelQuote1_untrMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
   SC_DragMove = $F012;
var
  P: TPoint;
begin
   if Button=mbRight then
   begin
      GetCursorPos(p);
      PMQuote.Popup(P.X, P.Y);
      exit;
   end;
   ReleaseCapture;
   PanelQuote.Perform(WM_SysCommand, SC_DragMove, 0);
end;

procedure TFormControlPanel.ImageTrainMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
   SC_DragMove = $F012;
var
  P: TPoint;
begin
  if Button=mbRight then
   begin
      GetCursorPos(p);
      PMTrain.Popup(P.X, P.Y);
      exit;
   end;
  ReleaseCapture;
  PanelTrain.Perform(WM_SysCommand, SC_DragMove, 0);
end;

procedure TFormControlPanel.ImageTrainDblClick(Sender: TObject);
var
   i:integer;
begin
   i:=0;
end;

procedure TFormControlPanel.Action1Execute(Sender: TObject);
begin
  {FormConfirm.LabelAsk.Caption:='Are you shure you want to exit'+#13+'Eye Saver?';
  FormConfirm.ShowModal;
  if FormConfirm.ModalResult=mrOk then  FormMain.Close;}
  FormMain.ExitEyeSaver1Click(Sender);
end;

procedure TFormControlPanel.Action2Execute(Sender: TObject);
begin
   {FormConfirm.LabelAsk.Caption:='Cant exit';
   FormConfirm.ShowModal; }
   //exit;
end;

procedure TFormControlPanel.NextQuote1Click(Sender: TObject);
begin
   FormMain.NextQuote;
end;

procedure TFormControlPanel.EditQuote1Click(Sender: TObject);
var
   i:integer;
begin
   FormMain.OnWork(false);
   FormSettings.Show;
   FormSettings.PCMenu.TabIndex:=1;
   FormSettings.CBQuotes_untr.ItemIndex:=FormSettings.CBQuotes_untr.Items.IndexOf(inttostr(LabelQuote1_untr.Tag));
   //FormSettings.CBQuotes.Items.
   FormSettings.LBSaveClick(Sender);
end;

procedure TFormControlPanel.DeleteQuote1Click(Sender: TObject);
begin
   FormSettings.CBQuotes_untr.ItemIndex:=FormSettings.CBQuotes_untr.Items.IndexOf(inttostr(LabelQuote1_untr.Tag));
   FormSettings.LBDelClick(Sender);
   //FormMain.NextQuote;
end;

procedure TFormControlPanel.HideQuotes1Click(Sender: TObject);
begin
   LBClQuoteClick(Sender);
end;

procedure TFormControlPanel.PanelQFontClick(Sender: TObject);
begin
   FormSettings.PanelQFontClick(Sender);
end;

procedure TFormControlPanel.PanelQFCClick(Sender: TObject);
begin
   FormSettings.PanelQFCClick(Sender);
end;

procedure TFormControlPanel.PanelTFontClick(Sender: TObject);
begin
   FormSettings.PanelQFontClick(Sender);
end;

procedure TFormControlPanel.PanelTFCClick(Sender: TObject);
begin
   FormSettings.PanelQFCClick(Sender);
end;

end.
