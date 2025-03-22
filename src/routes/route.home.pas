unit route.home;

{$mode ObjFPC}{$H+}

interface

uses
     Classes, SysUtils, Forms, Controls, Graphics, Dialogs,
     route.base, BrookURLRouter, BrookHTTPResponse, BrookHTTPRequest;

type

	 { THomeRouter }

     THomeRouter = class(TDataModule)
          router: TBrookURLRouter;
		  api1router: TBrookURLRouter;
	procedure api1routerRoutes1Request(ASender: TObject;
		ARoute: TBrookURLRoute; ARequest: TBrookHTTPRequest;
		AResponse: TBrookHTTPResponse);
	procedure api1routerRoutes2Request(ASender: TObject;
		ARoute: TBrookURLRoute; ARequest: TBrookHTTPRequest;
		AResponse: TBrookHTTPResponse);
 procedure onAbout(ASender: TObject; ARoute: TBrookURLRoute;
		ARequest: TBrookHTTPRequest; AResponse: TBrookHTTPResponse);
    procedure onDefault(ASender: TObject;
			   ARoute: TBrookURLRoute; ARequest: TBrookHTTPRequest;
			   AResponse: TBrookHTTPResponse);
     private

     public

     end;

var
     HomeRouter: THomeRouter;

implementation

{$R *.lfm}
uses
     server.stub;

{ THomeRouter }

procedure THomeRouter.onDefault(ASender: TObject;
	 ARoute: TBrookURLRoute; ARequest: TBrookHTTPRequest;
	 AResponse: TBrookHTTPResponse);
var
     _endPoints: pChar;
     _html: string;
begin
     _endPoints := server.stub.serverEndPoints;
     _html := 'Welcome Home! <br><br>' + _endPoints;
     StrDispose(_endPoints);
     sendHTML(AResponse, _html);
end;

procedure THomeRouter.onAbout(ASender: TObject; ARoute: TBrookURLRoute;
	ARequest: TBrookHTTPRequest; AResponse: TBrookHTTPResponse);
begin
    sendHTML(AResponse, aboutRouter(router)) ;
end;

procedure THomeRouter.api1routerRoutes1Request(ASender: TObject;
	ARoute: TBrookURLRoute; ARequest: TBrookHTTPRequest;
	AResponse: TBrookHTTPResponse);
begin
    SendHtml(AResponse, 'One');
end;

procedure THomeRouter.api1routerRoutes2Request(ASender: TObject;
	ARoute: TBrookURLRoute; ARequest: TBrookHTTPRequest;
	AResponse: TBrookHTTPResponse);
begin
    SendHtml(AResponse, 'Two');
end;

end.

