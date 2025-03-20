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
	 Forms, main, page.home, route.base, websrv,
     route.home, route.filesrv, pages;

{$R *.res}

begin
	 RequireDerivedFormResource:=True;
	Application.Scaled:=True;
	 Application.Initialize;
	 Application.CreateForm(TWebServerGui, WebServerGui);
	 Application.CreateForm(TRouterBase, RouterBase);
	 Application.CreateForm(THomeRouter, HomeRouter);
	 Application.CreateForm(TFilesrvRouter, FilesrvRouter);
	 Application.Run;
end.

