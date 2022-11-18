program EyeSaver;

{%ToDo 'EyeSaver.todo'}

uses
  Forms,
  Windows,
  SysUtils,
  Dialogs,
  Main in 'Main.pas' {FormMain},
  ControlPanel in 'ControlPanel.pas' {FormControlPanel},
  Settings in 'Settings.pas' {FormSettings},
  Confirm in 'Confirm.pas' {FormConfirm},
  Event1 in 'Event1.pas' {FormEvent},
  MultiLanguage in 'MultiLanguage.pas';

var
 hMutex: THandle;

{$R *.res}

begin
   hMutex := CreateMutex(nil, True, PChar(ExtractFileName(ParamStr(0))));

   if GetlastError <> ERROR_ALREADY_EXISTS then // прерываем процесс при попытке повторного запуска
   //  if WaitForSingleObject(hMutex, 0) = 0 then
   begin
      Application.Initialize;
      Application.CreateForm(TFormMain, FormMain);
      Application.CreateForm(TFormControlPanel, FormControlPanel);
      Application.CreateForm(TFormSettings, FormSettings);
      Application.CreateForm(TFormConfirm, FormConfirm);
      Application.CreateForm(TFormEvent, FormEvent);
      Application.ShowMainForm:=false;
      Application.Run;

      ReleaseMutex(hMutex);
   end
   else
   begin
      ShowMessage('Program is already running!');
      CloseHandle(hMutex);
   end;
end.
