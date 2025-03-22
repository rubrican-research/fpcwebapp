program webapp;

{$mode objfpc}{$H+}

uses
	 {$IFDEF UNIX}
	 cthreads,
	 {$ENDIF}
	 {$IFDEF HASAMIGA}
	 athreads,
	 {$ENDIF}
	 Interfaces, // this includes the LCL widgetset
	 Forms, form.main, page.home, route.base, server.web, server.stub,
     route.home, route.filesrv, pages;

{$R *.res}

begin
    server.web.serverName  := 'QATree User Module';
    server.web.serverID    := 'V1.0';
    server.web.serverAbout := 'This microserver handles user authentication, user management';

	RequireDerivedFormResource:=True;
	Application.Scaled:=True;
	Application.Initialize;
    {$IFNDEF CONSOLEAPP}
	Application.CreateForm(TWebServerGui, WebServerGui);
    {$ENDIF}

	Application.CreateForm(THomeRouter, HomeRouter);
	Application.CreateForm(TFilesrvRouter, FilesrvRouter);

    {$IFDEF CONSOLEAPP}
    server.web.startServer();
    writeln(Application.Title + ' started.' );
    writeln('Serving ' + server.web.serverURL);
    {$ENDIF}
	 Application.Run;
end.

