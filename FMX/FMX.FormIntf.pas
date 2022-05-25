unit FMX.FormIntf;

interface

uses
  System.Types;

type
  IFMXForm = interface
    ['{F6C46C4A-7FDF-4F1C-9B96-9E1A3B6F2DDA}']
    function GetHandle: THandle;
    procedure SetParentWindow(AHandle: THandle);
  end;

implementation

end.

