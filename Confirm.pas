unit Confirm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ExtCtrls, LightButton, StdCtrls, MMSystem;

type
  TFormConfirm = class(TForm)
    LabelAsk: TLabel;
    LBConfirm: TLightButton;
    Shape1: TShape;
    ImageChancel: TImageList;
    ImageConfirm: TImageList;
    LBChancel: TLightButton;
    Shape2: TShape;
    Shape3: TShape;
    LabelTime: TLabel;
    TimerPowerOff: TTimer;
    Panel1: TPanel;
    TimerFade: TTimer;
    procedure LBConfirmClick(Sender: TObject);
    procedure LBChancelClick(Sender: TObject);
    procedure TimerPowerOffTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure TimerFadeTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FFade:byte;
    FDecrise:integer;
    { Private declarations }
  public
    { Public declarations }
  end;


var
  FormConfirm: TFormConfirm;

implementation

uses DateUtils, Main;

{$R *.dfm}
const
   FadeDelay:integer=300;
   ConfirmTr:integer=200;

procedure TFormConfirm.LBConfirmClick(Sender: TObject);
begin
  FormConfirm.ModalResult:=mrOk;
end;

procedure TFormConfirm.LBChancelClick(Sender: TObject);
begin
  FormConfirm.ModalResult:=mrCancel;
end;

procedure TFormConfirm.TimerPowerOffTimer(Sender: TObject);
var
   i:integer;
begin
   i:=round(SecondSpan(Now,TmpDateTime));
   LabelTime.Caption:='00:'+Format('%.2d',[60-i]);
   if SecondSpan(Now,TmpDateTime)>=60 then
   begin

      TimerPowerOff.Enabled:=false;
      FormConfirm.ModalResult:=mrNone;
      FormConfirm.Close;
      FormMain.PowerOff;
   end;
end;

procedure TFormConfirm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   AlphaBlendValue:=0;
   FDecrise:=0;
   FFade:=0;
end;

procedure TFormConfirm.FormShow(Sender: TObject);
begin
   TimerFade.Enabled:=true;
   PlaySound(PansiChar(ExtractFilePath(Application.ExeName)+'Sounds\Service\Confirm.wav'),0, SND_ASYNC);
end;

procedure TFormConfirm.TimerFadeTimer(Sender: TObject);
begin
   FFade:=Round((255*FDecrise)/(FadeDelay/TimerFade.Interval));
   AlphaBlendValue:=FFade;

   inc(FDecrise);
   if FFade>=ConfirmTr then
   begin
      AlphaBlendValue:=ConfirmTr;
      TimerFade.Enabled:=false;
   end;
end;

procedure TFormConfirm.FormCreate(Sender: TObject);
begin
   AlphaBlendValue:=0;
end;

end.
