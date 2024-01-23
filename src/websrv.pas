unit websrv;

{$mode ObjFPC}{$H+}

interface

uses
	 Classes, SysUtils, ExtCtrls, BrookLibraryLoader, BrookMediaTypes,
	 BrookURLEntryPoints, BrookURLRouter, BrookHTTPServer, BrookLogger,
	 BrookUtility, BrookHTTPResponse, BrookHTTPRequest, route.base, route.home,
	 route.filesrv;

const
	 BROOKLIB     = 'libsagui-3.dll';
     DEFAULT_PORT = 999;
type

	 { TWebserver }

	 TWebserver = class(TDataModule)
			 BrookHTTPServer: TBrookHTTPServer;
			 BrookLibraryLoader: TBrookLibraryLoader;
			 BrookLogger: TBrookLogger;
			 BrookURLEntryPoints: TBrookURLEntryPoints;
			 fileRouter: TBrookURLRouter;
			 TrayIcon1: TTrayIcon;
			 procedure BrookHTTPServerRequest(ASender: TObject; ARequest: TBrookHTTPRequest;
			AResponse: TBrookHTTPResponse);
			procedure BrookHTTPServerRequestError(ASender: TObject;
					ARequest: TBrookHTTPRequest; AResponse: TBrookHTTPResponse;
					AException: Exception);
			procedure DataModuleCreate(Sender: TObject);
	 private
			 function getPort: uint16;
			 function getServerRunning: boolean;
			 procedure setPort(const _value: uint16);
			 procedure setServerRunning(const _value: boolean);
	 public
			procedure startServer;
			procedure stopServer;
			procedure EntryPointsActive(_val: boolean);

	 public
		property serverRunning: boolean read getServerRunning write setServerRunning;
		property port: uint16 read getPort write setPort;
	 end;

var
	 Webserver: TWebserver;

implementation

{$R *.lfm}

var
	 BrookLibPath: string = BROOKLIB;

{ TWebserver }

procedure TWebserver.BrookHTTPServerRequestError(ASender: TObject;
	 ARequest: TBrookHTTPRequest; AResponse: TBrookHTTPResponse; AException: Exception);
begin
	 AResponse.Send(
		'ERROR - replace this',
			'text/html',
			404
		);

end;

procedure TWebserver.DataModuleCreate(Sender: TObject);
begin
    setPort(DEFAULT_PORT);
end;

function TWebserver.getPort: uint16;
begin
	 Result := BrookHTTPServer.Port;
end;

procedure TWebserver.BrookHTTPServerRequest(ASender: TObject;
	 ARequest: TBrookHTTPRequest; AResponse: TBrookHTTPResponse);
begin
	 BrookURLEntryPoints.Enter(ASender, ARequest, AResponse);
end;

function TWebserver.getServerRunning: boolean;
begin
	 Result := BrookHTTPServer.Active;
end;

procedure TWebserver.setPort(const _value: uint16);
begin
	 BrookHTTPServer.Port := _value;
end;

procedure TWebserver.setServerRunning(const _value: boolean);
begin
	 if BrookHTTPServer.Active = _value then exit;
	 case _value of
			 True: startServer;
			 False: stopServer;
	 end;
end;

procedure TWebserver.startServer;
begin
     if BrookHTTPServer.Active then exit;

	 if BrookLibraryLoader.LibraryName <> BrookLibPath then
	 begin
			BrookLibraryLoader.Active			:= False;
			BrookLibraryLoader.LibraryName := BrookLibPath;
	 end;
	 BrookLibraryLoader.Active  := True;
	 BrookHTTPServer.Active		:= True;
	 EntryPointsActive(True);
end;

procedure TWebserver.stopServer;
begin
    BrookHTTPServer.Active := False;
  //BrookLibraryLoader.Active := False;
end;

procedure TWebserver.EntryPointsActive(_val: boolean);
var
	 i: integer;
	 _ep: TBrookURLEntryPoint;
begin
    BrookURLEntryPoints.Active := _val;
	for i := 0 to pred(BrookURLEntryPoints.List.Count) do
	begin
        _ep := BrookURLEntryPoints.Items[i];
        if assigned(_ep.Router) then _ep.Router.Active := _val;
    end;
end;

end.
