unit FMX.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.FormIntf,
  System.Math.Vectors, FMX.Types3D, FMX.MaterialSources, FMX.Controls3D,
  FMX.Objects3D, FMX.Viewport3D, FMX.Ani, FMX.Layouts, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Memo.Types, FMX.ListBox,
  FMX.ScrollBox, FMX.Memo, Winapi.Windows, Winapi.Messages;

type
  TFormFMX = class(TForm, IFMXForm)
    Viewport3D1: TViewport3D;
    Rectangle3D1: TRectangle3D;
    Light1: TLight;
    LightMaterialSource1: TLightMaterialSource;
    FloatAnimation1: TFloatAnimation;
    Layout1: TLayout;
    Edit1: TEdit;
    Label1: TLabel;
    Memo1: TMemo;
    Button1: TButton;
    ComboBox1: TComboBox;
  private
    FOldFMXWndProc: Winapi.Windows.TFNWndProc;
    FNewFMXWndProc: Pointer;
    FParentWindow: THandle;
    procedure WndProcHook;
    procedure CustomWndProc(var Msg: TMessage);
  protected
    procedure CreateHandle; override;
  public
    function GetHandle: THandle;
    procedure SetParentWindow(AHandle: THandle);
  end;

var
  FormFMX: TFormFMX;

implementation

uses
  FMX.Platform.Win;

{$R *.fmx}

{ TFormFMX }

procedure TFormFMX.WndProcHook;
var
  FMXHandle: HWND;
begin
  FMXHandle := GetHandle;

  FOldFMXWndProc := TFNWndProc(Winapi.Windows.GetWindowLong(FMXHandle, GWL_WNDPROC));
  FNewFMXWndProc := MakeObjectInstance(CustomWndProc);
  Winapi.Windows.SetWindowLong(FMXHandle, GWL_WNDPROC, NativeInt(FNewFMXWndProc));
end;

procedure TFormFMX.CreateHandle;
begin
  inherited;
  WndProcHook;
end;

procedure TFormFMX.CustomWndProc(var Msg: TMessage);
begin
  case Msg.Msg of
    WM_ACTIVATE, WM_MOUSEACTIVATE, WM_SETFOCUS:
      begin
        SendMessageW(FParentWindow, WM_NCACTIVATE, 1, 0);
        Active := True;
      end;
    WM_KILLFOCUS:
      begin
        if FParentWindow <> Winapi.Windows.GetActiveWindow then
          SendMessageW(FParentWindow, WM_NCACTIVATE, 0, 0);
      end;
  end;
  Msg.Result := CallWindowProc(FOldFMXWndProc, GetHandle, Msg.Msg, Msg.WParam, Msg.LParam);
end;

procedure TFormFMX.SetParentWindow(AHandle: THandle);
begin
  FParentWindow := AHandle;
end;

function TFormFMX.GetHandle: THandle;
begin
  Result := FormToHWND(Self);
end;

end.

