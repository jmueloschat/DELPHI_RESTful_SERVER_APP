object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 189
  ClientWidth = 366
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 345
    Height = 169
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object HTTPServer: TIdHTTPServer
    Active = True
    Bindings = <>
    DefaultPort = 8050
    ListenQueue = 100
    OnCommandGet = HTTPServerCommandGet
    Left = 304
    Top = 24
  end
end
