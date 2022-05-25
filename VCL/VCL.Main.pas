unit VCL.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  FMX.FormIntf, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFormVCL = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Memo1: TMemo;
    Panel4: TPanel;
    Memo2: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    FFMXForm: IFMXForm;
  public    { Public declarations }
  end;

function CreateFMXForm(ParentWindow: THandle): IFMXForm; external '..\..\..\FMX\Win32\Debug\FMXDLL.dll';

var
  FormVCL: TFormVCL;


implementation

uses
  VCL.Test;

{$R *.dfm}

procedure TFormVCL.FormCreate(Sender: TObject);
begin
  FFMXForm := CreateFMXForm(Handle);
  Winapi.Windows.SetParent(FFMXForm.GetHandle, Panel1.Handle);

  var FM := TForm1.Create(nil);
  FM.Visible := True;

  Winapi.Windows.SetParent(FM.Handle, Panel2.Handle);
end;

procedure TFormVCL.FormResize(Sender: TObject);
begin
  if Assigned(FFMXForm) then
    SetWindowPos(FFMXForm.GetHandle, 0, 0, 0, Panel1.Width, Panel1.Height, 0);
end;

end.

