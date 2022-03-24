program ClienteTCP;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;

  ReportMemoryLeaksOnShutdown := True;

  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
