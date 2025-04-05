unit uCalculate;

interface

uses
   Generics.Collections
  ,Classes
  ;

type
  TCaculatePlus = class
  public
    class function getParams(const csParams: String): TDictionary<String, String>;
    class function execute(const csParams: String): String;
  end;

implementation

uses
  SysUtils;

{ TCaculatePlus }

class function TCaculatePlus.getParams(const csParams: String): TDictionary<String, String>;
var
  loArgsList: TStringList;
  i: Integer;
begin
  Result := TDictionary<String, String>.Create;
  loArgsList := TStringList.Create;
  try
    loArgsList.QuoteChar := #0;
    loArgsList.Delimiter := '&';
    loArgsList.StrictDelimiter := True;
    loArgsList.DelimitedText := csParams;
    for i := 0 to loArgsList.Count - 1 do
      Result.Add(loArgsList.Names[i], loArgsList.Values[loArgsList.Names[i]]);
  finally
    FreeAndNIL(loArgsList);
  end;
end;

class function TCaculatePlus.execute(const csParams: String): String;
var
  loParams: TDictionary<String, String>;
begin
  loParams := TCaculatePlus.getParams(csParams);
  try
    Result := IntToStr(StrToInt(loParams.Items['field1']) + StrToInt(loParams.Items['field2']));
  finally
    FreeAndNil(loParams);
  end;
end;

end.
