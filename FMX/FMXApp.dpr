program FMXApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Main in 'FMX.Main.pas' {FormFMX},
  FMX.FormIntf in 'FMX.FormIntf.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormFMX, FormFMX);
  Application.Run;
end.
