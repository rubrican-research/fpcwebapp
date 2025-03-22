program testwebapp;

{$mode objfpc}{$H+}

uses
  Interfaces, Forms, GuiTestRunner, test.gui, server.web, route.base,
  route.filesrv, route.home, page.home, pages;

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TGuiTestRunner, TestRunner);
  Application.CreateForm(TWebserver, Webserver);
  Application.CreateForm(TRouterBase, RouterBase);
  Application.CreateForm(TFilesrvRouter, FilesrvRouter);
  Application.CreateForm(THomeRouter, HomeRouter);
  Application.Run;
end.

