unit route.home;

{$mode ObjFPC}{$H+}

interface

uses
     Classes, SysUtils, Forms, Controls, Graphics, Dialogs, route.base, BrookURLRouter, BrookHTTPResponse, BrookHTTPRequest;

type

	 { THomeRouter }

     THomeRouter = class(TRouterBase)
		  procedure routerRoutes0Request(ASender: TObject;
			   ARoute: TBrookURLRoute; ARequest: TBrookHTTPRequest;
			   AResponse: TBrookHTTPResponse);
     private

     public

     end;

var
     HomeRouter: THomeRouter;

implementation

{$R *.lfm}

{ THomeRouter }

procedure THomeRouter.routerRoutes0Request(ASender: TObject;
	 ARoute: TBrookURLRoute; ARequest: TBrookHTTPRequest;
	 AResponse: TBrookHTTPResponse);
begin
     sendHTML(AResponse, 'Welcome Home!');
end;

end.

