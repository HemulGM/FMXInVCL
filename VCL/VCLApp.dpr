program VCLApp;

uses
  Vcl.Forms,
  VCL.Main in 'VCL.Main.pas' {FormVCL},
  FMX.FormIntf in '..\FMX\FMX.FormIntf.pas',
  VCL.Test in 'VCL.Test.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormVCL, FormVCL);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
