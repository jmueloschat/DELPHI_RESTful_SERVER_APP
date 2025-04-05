unit uRoutes;

interface

uses
   SysUtils
  ,Classes
  ,IdCustomHTTPServer
  ,uCalculate
  ;

type
  {$METHODINFO ON}
  TRoutes = class(TComponent)
  public
    constructor Create( aOwner: TComponent ); override;
    destructor Destroy; override;

    procedure Path(aRequestInfo: TIdHTTPRequestInfo; aResponseInfo: TIdHTTPResponseInfo);
  end;
  {$METHODINFO OFF}

implementation

{ TRoutes }

constructor TRoutes.Create(aOwner: TComponent);
begin
  inherited Create( aOwner );

end;

destructor TRoutes.Destroy;
begin

  inherited;
end;

procedure TRoutes.Path(aRequestInfo: TIdHTTPRequestInfo; aResponseInfo: TIdHTTPResponseInfo);
begin
  aResponseInfo.ContentText := '{"return":[{"codret":9999,"msgret":"default return"}]}';
  aResponseInfo.ResponseNo := 404;

  //http://localhost:8050/hello_world
  if   aRequestInfo.Document = '/hello_world' then
       begin
         aResponseInfo.ContentText := '{"return":"hello_world"}';
         aResponseInfo.ResponseNo := 200;
       end;

  //http://localhost:8050/api0001?field1=2&field2=5
  if   aRequestInfo.Document = '/api0001' then
       begin
         aResponseInfo.ContentText := TCaculatePlus.execute(aRequestInfo.QueryParams);
         aResponseInfo.ResponseNo := 200;
       end;
end;

end.
