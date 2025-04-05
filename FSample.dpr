program FSample;

uses
  Forms,
  ufrmMain in 'ufrmMain.pas' {Form1},
  uRoutes in 'uRoutes.pas',
  uCalculate in 'uCalculate.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
