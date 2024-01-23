unit route.base;

{$mode ObjFPC}{$H+}

interface

uses
	 Classes, SysUtils, BrookURLRouter, BrookHTTPResponse, BrookHTTPRequest;

type

	 { TRouterBase }

  TRouterBase = class(TDataModule)
		  router: TBrookURLRouter;
	 private
		  function getActive: boolean;
		  procedure Setactive(const _value: boolean);
	 public
		property active: boolean read getActive write Setactive;
        procedure sendHTML (var AResponse: TBrookHTTPResponse; const _html: string); // send successful content
	 end;

var
	 RouterBase: TRouterBase;

implementation

{$R *.lfm}

{ TRouterBase }

function TRouterBase.getActive: boolean;
begin
	Result:= router.Active;
end;

procedure TRouterBase.Setactive(const _value: boolean);
begin
	 if router.Active = _value then exit;
     router.Active:= true;
end;

procedure TRouterBase.sendHTML(var AResponse: TBrookHTTPResponse;
	 const _html: string);
begin
     AResponse.Send(_html, 'text/html', 200);
end;

end.

