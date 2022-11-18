unit Event1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ImgList, LightButton,MMSystem;

const
  GapLeft:integer=30;
  GapBottom:integer=50;

  FadeDelay:integer=800;
  DefaultFormHeight:integer=90;
  DefaultFormWidht:integer=360;
  ShowFormHeight:integer=500;
  ShowFormWidht:integer=360;
  ShowMemoHeight:integer=400;
  DefaultMemHeight:integer=50;
  DefaultMemoTop:integer=22;
  ShowMemoTop:integer=40;
  MaxStrings:integer=30;
type
  TFormEvent = class(TForm)
    Shape1: TShape;
    TimerFade: TTimer;
    Image1: TImage;
    LabelText: TLabel;
    LabelRTime_untr: TLabel;
    Panel1: TPanel;
    Shape2: TShape;
    LBClRemain: TLightButton;
    ImageClSq: TImageList;
    TimerShow: TTimer;
    TimerTest: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure TimerFadeTimer(Sender: TObject);
    procedure LBClRemainClick(Sender: TObject);
    procedure TimerShowTimer(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TimerTestTimer(Sender: TObject);
  private
    { Private declarations }
    FFade:byte;
    FWidht:integer;
    FShowState:boolean;
    FOwner:TForm;
    FDecrise:integer;
    FEnable:boolean;
    FNewEventAdded:boolean;
    FTransp:byte;

    procedure Reset;


  public
    { Public declarations }
    procedure AddEvent(AEvent:string);

    procedure Init(AOwner:TForm);
    property Enable:boolean read FEnable write FEnable;
    property NewEventAdded:boolean read FNewEventAdded;
    property Transp:byte read FTransp write FTransp;
  end;

var
  FormEvent: TFormEvent;

implementation

{$R *.dfm}

uses Main;

procedure TFormEvent.FormCreate(Sender: TObject);
begin
   FormEvent.Height:=0;
   AlphaBlend:=true;
   //AlphaBlendValue:=0;
   FFade:=0;
   FWidht:=250;
   FormEvent.Position:=poDesigned;
   FShowState:=false;
   FDecrise:=0;
   FEnable:=true;
   FNewEventAdded:=false;
   Shape1.Pen.Color:=clSilver;

end;

procedure TFormEvent.FormDeactivate(Sender: TObject);
begin
   Reset;
   Close;
end;

procedure TFormEvent.TimerFadeTimer(Sender: TObject);
begin
   Height:=92;
   if not FormEvent.Showing then show;
   FFade:=Round((255*FDecrise)/(FadeDelay/TimerFade.Interval));
   AlphaBlendValue:=FFade;

   inc(FDecrise);
   if FFade>=Transp then
   begin
      AlphaBlendValue:=Transp;
      Reset;
   end;
   //AlphaBlendValue:=FTransp;
   {Height:=Height+5;
   if Height>=92 then
   begin
      Height:=92;
      Reset;
   end;}
end;


procedure TFormEvent.AddEvent(AEvent:string);
var
  tmpCount:integer;
  MemoTextSTep:integer;
  p2:TPoint;
begin
  PlaySound(PansiChar(ExtractFilePath(Application.ExeName)+'Sounds\Service\Notify.wav'),0, SND_ASYNC);

  TimerFade.Enabled:=False;
  LabelText.Caption:=AEvent;

  TimerFade.Enabled:=true;
  //AlphaBlendValue:=transp;
  AlphaBlendValue:=0;
  FFade:=0;
  FDecrise:=0;
  p2.X:=0;
  p2.Y:=0;
  p2:=FOwner.ClientToScreen(p2);

  {FormEvent.Left:= p2.X+ FOwner.Width-FormEvent.Width-GapLeft;
  FormEvent.Top:=p2.Y+ FOwner.Height- FormEvent.Height-GapBottom;}
  //AlphaBlendValue:=0;
  SetWindowPos(Self.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);
  Show;
end;



procedure TFormEvent.Init(AOwner:TForm);
var
  p2:TPoint;
begin
  FOwner:=AOwner;
  p2.X:=0;
  p2.Y:=0;
  p2:=FOwner.ClientToScreen(p2);
  {FormEvent.Left:= p2.X+ FOwner.Width-FormEvent.Width-GapLeft;
  FormEvent.Top:=p2.Y+ FOwner.Height- FormEvent.Height-GapBottom;}
  FormEvent.Left:=Options.RectEvent.Left;
  FormEvent.top:=Options.RectEvent.Top;

  if (Top>Screen.Height-5) or (Left>Screen.Width-5) or
      (Top<-20) or (Left<-20) then
   begin
      Top:=10;
      Left:=10;
   end;
end;

procedure TFormEvent.Reset;
begin
    TimerFade.Enabled:=False;
    FDecrise:=0;
end;

procedure TFormEvent.LBClRemainClick(Sender: TObject);
begin
   //TimerShow.Enabled:=true;
   TimerTest.Enabled:=true;  FDecrise:=0;
end;

procedure TFormEvent.TimerShowTimer(Sender: TObject);
begin
   Height:=Height-5;
   if height<=5 then
   begin
      Height:=0;
      TimerShow.Enabled:=false;
      FormMain.OnWork(true);
   end;

end;

procedure TFormEvent.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  SC_DragMove = $F012;
begin
  ReleaseCapture;
  FormEvent.Perform(WM_SysCommand, SC_DragMove, 0);
end;

procedure TFormEvent.TimerTestTimer(Sender: TObject);
begin
   FFade:=Round(FTransp-(255*FDecrise)/(FadeDelay/TimerTest.Interval));
   AlphaBlendValue:=FFade;
   inc(FDecrise);
   if FFade<=10 then
   begin
    AlphaBlendValue:=0;
    Reset;
    TimerTest.Enabled:=false;
    FormMain.OnWork(true);
   end;
end;

end.


