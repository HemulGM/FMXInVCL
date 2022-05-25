library FMXDLL;

uses
  System.SysUtils,
  System.Classes,
  Winapi.Windows,
  FMX.Platform.Win,
  FMX.Forms,
  FMX.FormIntf in 'FMX.FormIntf.pas',
  FMX.Main in 'FMX.Main.pas' {FormFMX};

{$R *.res}

function CustomStateQuery: TApplicationState;
begin
  Result := TApplicationState.Running;
end;

function CreateFMXForm(ParentWindow: THandle): IFMXForm;
var
  Form: TFormFMX;
begin
  Application.ApplicationStateQuery := CustomStateQuery;
  Application.Initialize;
  Form := TFormFMX.Create(nil);
  Form.SetParentWindow(ParentWindow);
  Application.MainForm := Form;
  ShowWindow(ApplicationHWND, SW_HIDE);
  Form.BorderStyle := TFmxFormBorderStyle.None;

  Form.Show;
  Result := Form;
end;

exports
  CreateFMXForm;

begin
end.

