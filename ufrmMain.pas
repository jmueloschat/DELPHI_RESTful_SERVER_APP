unit ufrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdCustomTCPServer, IdCustomHTTPServer,
  IdHTTPServer, IdContext, uRoutes, StdCtrls;

type
  TForm1 = class(TForm)
    HTTPServer: TIdHTTPServer;
    Memo1: TMemo;
    procedure HTTPServerCommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
  private
    { Private declarations }
    FRoutes: TRoutes;
  public
    { Public declarations }

    constructor Create( aOwner: TComponent ); override;
    destructor Destroy; override;
  end;

var
  Form1: TForm1;
  Critical: TRTLCriticalSection;

implementation

{$R *.dfm}

constructor TForm1.Create(aOwner: TComponent);
begin
  inherited;
  FRoutes := TRoutes.Create(Self);
end;

destructor TForm1.Destroy;
begin

  inherited;
end;

procedure TForm1.HTTPServerCommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
begin
  EnterCriticalSection( Critical );
  try
    FRoutes.Path(aRequestInfo, AResponseInfo);
    Memo1.Lines.Add(aResponseInfo.ContentText);
    aResponseInfo.WriteContent
  finally
    LeaveCriticalSection( Critical );
  end;

end;

initialization
  InitializeCriticalSection( Critical );

finalization
  DeleteCriticalSection( Critical );

end.
