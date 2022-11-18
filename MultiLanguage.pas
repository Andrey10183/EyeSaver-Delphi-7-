//http://www.delphisources.ru/pages/faq/base/support_of_multilingual_interface.html
//Внимание используйте '_untr' для названия компонентов чтобы они не переводились
unit MultiLanguage;

interface

uses Classes,Forms;

type
   TDictonaryProcessMode = (dpm_none, dpm_rewrite, dpm_update);
procedure UpdateLanguage(APath:string; AComponent: TComponent; ADictonaryProcessMode:TDictonaryProcessMode=dpm_none);
function TranslateString(APath:string;sString: string): string;

implementation

uses TypInfo, SysUtils, ComCtrls, Grids, ADODB, DBGrids, DB, Controls, StdCtrls, ExtCtrls, Menus{, FramePWRUnit,main};

type
   TTmpControl = class (TControl)
   published
      property Caption;
   end;

procedure UpdateLanguage;
var
   tmpStrings:TStringList;

{ Проход по всем свойствам компонента }
{ Для всех строковых свойств - загрузка перевода из словаря }
procedure UpdateComponent(Component: TPersistent);
{ Поиск перевода для заданной строки в словаре }
   function TranslateString(sString: string): string;
   begin
      sString := trim(sString);
      if sString = '' then
      begin
         Result := '';
         exit;
      end;
      if tmpStrings.IndexOfName(sString) <> -1 then
         Result := tmpStrings.Values[sString]
      else
      begin
         tmpStrings.Add(sString + '=' + sString);
         Result := sString;
      end;
   end;
var
   tmpString : string;
   i,j : integer;
begin
   Component.ClassType;
   if Component is TComponent then
   begin
      tmpString := (Component as TComponent).Name;
      if length(tmpString) > 5 then
         if (copy(tmpString,length(tmpString)-4,5)='_untr') then exit;
   end;

   if (Component is TControl) then
      (Component as TControl).Hint := TranslateString((Component as TControl).Hint);

   {if (Component is TLabel) then
      (Component as TLabel).Caption := TranslateString((Component as TLabel).Caption);
   if (Component is TPanel) then
      (Component as TPanel).Caption := TranslateString((Component as TPanel).Caption); }

   if (Component is TControl) then
   begin
      TTmpControl(Component).Caption := TranslateString(TTmpControl(Component).Caption);
   end;



   {if (Component is TFramePWR) then
   begin
      TFramePWR(Component).OnText := TranslateString(TFramePWR(Component).OnText);
      TFramePWR(Component).OffText := TranslateString(TFramePWR(Component).OffText);
   end;}
   {
   if (Component is TSwitchText) then
   begin
      TSwitchText(Component).OnText := TranslateString(TSwitchText(Component).OnText);
      TSwitchText(Component).OffText := TranslateString(TSwitchText(Component).OffText);
   end;  }

   if (Component is TStringGrid) then
   begin
      for i := 0 to (Component as TStringGrid).ColCount - 1 do
         (Component as TStringGrid).Cells[i,0]:=
            TranslateString((Component as TStringGrid).Cells[i,0]);
      for i := 0 to (Component as TStringGrid).RowCount - 1 do
         (Component as TStringGrid).Cells[4,i]:=
            TranslateString((Component as TStringGrid).Cells[4,i]);
      exit;
   end;

   if (Component is TComboBox) then
   begin
      for i := 0 to (Component as TComboBox).Items.Count - 1 do
         (Component as TComboBox).Items[i]:=
            TranslateString((Component as TComboBox).Items[i]);
      exit;
   end;

   {if Component is TStringGrid then
   begin
      for i:=0 to (Component as TStringGrid).ColCount-1 do
         for j:=0 to (Component as TStringGrid).RowCount-1 do
            (Component as TStringGrid).Cells[i,j] :=
               TranslateString((Component as TStringGrid).Cells[i,j]);
   end;}

   if Component is TPopupMenu then
   begin
      for i:=0 to (Component as TPopupMenu).Items.Count-1 do
         (Component as TPopupMenu).Items[i].Caption:=
            TranslateString((Component as TPopupMenu).Items[i].Caption);
   end;
   {if (Component is TADOTable) or (Component is TDataSource) then
   begin
      exit;
   end;

   if (Component is TDBGrid) then
   begin
      exit;
   end; }

   { Playing with RTTI }

end;

   procedure UpdateAllComponents(Component: TComponent);
   var
      i : Integer;
   begin
   { обработка свойств компонента }
      UpdateComponent(Component);
      for i := 0 to Component.ComponentCount-1 do
         UpdateAllComponents(Component.Components[i]);
   end;

begin
   tmpStrings := TStringList.Create;
   try
      if (ADictonaryProcessMode<>dpm_rewrite) and
         (FileExists(APath)) then
            tmpStrings.LoadFromFile(APath);

      UpdateAllComponents(AComponent);

      if (ADictonaryProcessMode<>dpm_none) and (Length(APath) > 0) then
         tmpStrings.SaveToFile(APath);
   finally
      tmpStrings.Free;
   end;
end;

function TranslateString(APath:string;sString: string): string;
var
   tmpStrings:TStringList;
begin
   tmpStrings := TStringList.Create;
   try
      if (FileExists(APath)) then
            tmpStrings.LoadFromFile(APath);


      {if (ADictonaryProcessMode<>dpm_none) and (Length(APath) > 0) then
         tmpStrings.SaveToFile(APath);}


   sString := trim(sString);
   if sString = '' then
   begin
      Result := '';
      exit;
   end;
   if tmpStrings.IndexOfName(sString) <> -1 then
      Result := tmpStrings.Values[sString]
   else
   begin
      tmpStrings.Add(sString + '=' + sString);
      Result := sString;
   end;

   finally
      tmpStrings.Free;
   end;
end;
///////////////////////////////////////////////////////////////////////////////////////

procedure PlayWithRTTI(Component: TPersistent);
   function TranslateString(s:string):string;
   begin
   end;
var
   PropInfo: PPropInfo;
   TypeInf, PropTypeInf: PTypeInfo;
   TypeData: PTypeData;
   i, j: integer;
   AName, PropName, StringPropValue,tmpString: string;
   PropList: PPropList;
   NumProps: word;
   PropObject: TObject;
begin
   TypeInf := Component.ClassInfo;
   AName := TypeInf^.name;
   TypeData := GetTypeData(TypeInf);
   NumProps := TypeData^.PropCount;

   GetMem(PropList, NumProps*sizeof(pointer));

   try
      GetPropInfos(TypeInf, PropList);

      for i := 0 to NumProps-1 do
      begin
         PropName := PropList^[i]^.name;

         PropTypeInf := PropList^[i]^.PropType^;
         PropInfo := PropList^[i];

         case PropTypeInf^.Kind of
            tkString, tkLString:
               begin
                  if PropName <> 'Name' then { Переводить свойство Name не следует }
                  begin
                     { Получение значения свойства и поиск перевода в словаре }
                     StringPropValue := GetStrProp( Component, PropInfo );
                     SetStrProp( Component, PropInfo, TranslateString(StringPropValue) );
                  end;
               end;
            tkClass:
               begin
                  PropObject := GetObjectProp(Component, PropInfo{, TPersistent});
                  if Assigned(PropObject)then
                  begin
                     { Для дочерних свойств-классов вызов просмотра свойств }
           //          if (PropObject is TPersistent) then
           //             UpdateComponent(PropObject as TPersistent);

                     { Индивидуальный подход к некоторым классам }
                     if (PropObject is TStrings) then
                     begin
                        for j := 0 to (PropObject as TStrings).Count-1 do
                           TStrings(PropObject)[j] := TranslateString(TStrings(PropObject)[j]);
                     end;
                     if (PropObject is TTreeNodes) then
                     begin
                        for j := 0 to (PropObject as TTreeNodes).Count-1 do
                           TTreeNodes(PropObject).Item[j].Text :=
                              TranslateString(TTreeNodes(PropObject).Item[j].Text);
                     end;
                     if (PropObject is TListItems) then
                     begin
                        for j := 0 to (PropObject as TListItems).Count-1 do
                           TListItems(PropObject).Item[j].Caption :=
                              TranslateString(TListItems(PropObject).Item[j].Caption);
                     end;
                     { Здесь можно добавить обработку остальных классов }
                  end;
               end;
         end;
      end;
   finally
      FreeMem(PropList, NumProps*sizeof(pointer));
   end;
end;

end.
