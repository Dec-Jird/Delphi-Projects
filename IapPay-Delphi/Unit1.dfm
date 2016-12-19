object Form1: TForm1
  Left = 175
  Top = 122
  Width = 795
  Height = 390
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 336
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Get'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 17
    Top = 8
    Width = 304
    Height = 248
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Memo2: TMemo
    Left = 17
    Top = 265
    Width = 304
    Height = 72
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    Lines.Strings = (
      'Memo2')
    TabOrder = 2
  end
  object Button2: TButton
    Left = 336
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Post'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Memo4: TMemo
    Left = 425
    Top = 9
    Width = 351
    Height = 333
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    Lines.Strings = (
      'Memo4')
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object Button3: TButton
    Left = 331
    Top = 66
    Width = 89
    Height = 30
    Caption = #25903#20184
    TabOrder = 5
    OnClick = Button3Click
  end
end
