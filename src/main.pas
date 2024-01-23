unit main;

{$mode objfpc}{$H+}

interface

uses
	 Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, websrv;

type

	 { TWebServerGui }

  TWebServerGui = class(TForm)
		  Button1: TButton;
		  Label1: TLabel;
		  lblBackground: TLabel;
		  lblUrl: TLabel;
		  procedure Button1Click(Sender: TObject);
		  procedure FormCreate(Sender: TObject);
		  procedure lblUrlClick(Sender: TObject);
	 private
          myWebServer: TWebserver;
	 public
          	function isServerRunning: boolean;
	 		procedure startServer;
            procedure stopServer;

	 end;

var
	 WebServerGui: TWebServerGui;

implementation

uses
     LCLIntf, sugar.uiHelper;
{$R *.lfm}

{ TWebServerGui }

procedure TWebServerGui.Button1Click(Sender: TObject);
begin
	case isServerRunning of
 	 	True:  StopServer;
	  	False: StartServer;
 	end;
end;

procedure TWebServerGui.FormCreate(Sender: TObject);
begin
     myWebServer:= TWebServer.Create(Self);
     setHover(lblUrl);
     lblUrl.Visible:=false;
end;

procedure TWebServerGui.lblUrlClick(Sender: TObject);
begin
     OpenDocument(lblUrl.Caption);
end;

function TWebServerGui.isServerRunning: boolean;
begin
	Result:= myWebServer.serverRunning;
end;

procedure TWebServerGui.startServer;
begin
	myWebServer.StartServer;
	label1.Visible:=True;
	lblUrl.Visible:=True;

    lblUrl.Caption:= Format('%s:%d',['http://localhost', myWebServer.Port]);
    Button1.Caption:='Stop';
end;

procedure TWebServerGui.stopServer;
begin
	myWebServer.StopServer;
    Button1.Caption:='Start';
    label1.Visible:=false;
    lblUrl.Visible:=false;
end;

end.

