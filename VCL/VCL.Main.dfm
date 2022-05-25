object FormVCL: TFormVCL
  Left = 0
  Top = 0
  Caption = 'FormVCL'
  ClientHeight = 822
  ClientWidth = 1037
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1037
    Height = 377
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 810
  end
  object Panel2: TPanel
    Left = 0
    Top = 377
    Width = 1037
    Height = 377
    Align = alTop
    TabOrder = 1
    ExplicitTop = 8
    ExplicitWidth = 810
    object Panel3: TPanel
      Left = 16
      Top = 6
      Width = 185
      Height = 331
      Caption = 'Panel3'
      TabOrder = 0
      object Memo1: TMemo
        Left = 0
        Top = 6
        Width = 185
        Height = 89
        Lines.Strings = (
          'Memo1')
        TabOrder = 0
      end
    end
    object Panel4: TPanel
      Left = 216
      Top = 6
      Width = 185
      Height = 331
      Caption = 'Panel3'
      TabOrder = 1
      object Memo2: TMemo
        Left = 0
        Top = 6
        Width = 185
        Height = 89
        Lines.Strings = (
          'Memo1')
        TabOrder = 0
      end
    end
  end
end
