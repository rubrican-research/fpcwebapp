program webappcon;

{$mode objfpc}{$H+}

uses
    {$IFDEF UNIX}
    cthreads,
    {$ENDIF}
    Classes, SysUtils, CustApp
    { you can add units after this };

type

    { TLazBrookConsole }

    TLazBrookConsole = class(TCustomApplication)
    protected
        procedure DoRun; override;
    public
        constructor Create(TheOwner: TComponent); override;
        destructor Destroy; override;
        procedure WriteHelp; virtual;
    end;

{ TLazBrookConsole }

procedure TLazBrookConsole.DoRun;
var
    ErrorMsg: String;
begin
    // quick check parameters
    ErrorMsg:=CheckOptions('h', 'help');
    if ErrorMsg<>'' then begin
        ShowException(Exception.Create(ErrorMsg));
        Terminate;
        Exit;
    end;

    // parse parameters
    if HasOption('h', 'help') then begin
        WriteHelp;
        Terminate;
        Exit;
    end;

    { add your program here }

    // stop program loop
    Terminate;
end;

constructor TLazBrookConsole.Create(TheOwner: TComponent);
begin
    inherited Create(TheOwner);
    StopOnException:=True;
end;

destructor TLazBrookConsole.Destroy;
begin
    inherited Destroy;
end;

procedure TLazBrookConsole.WriteHelp;
begin
    { add your help code here }
    writeln('Usage: ', ExeName, ' -h');
end;

var
    Application: TLazBrookConsole;

{$R *.res}

begin
    Application:=TLazBrookConsole.Create(nil);
    Application.Title:='LazBrook Console';
    Application.Run;
    Application.Free;
end.

