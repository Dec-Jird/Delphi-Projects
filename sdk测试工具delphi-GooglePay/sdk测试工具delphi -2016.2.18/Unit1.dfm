object Form1: TForm1
  Left = 216
  Top = 131
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'SDK develop kit'
  ClientHeight = 471
  ClientWidth = 747
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
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 385
    Height = 417
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 440
    Width = 105
    Height = 25
    Caption = #33150#35759#25903#20184#19979#21333
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 120
    Top = 440
    Width = 75
    Height = 25
    Caption = 'unix'#26102#38388#25139
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 200
    Top = 440
    Width = 75
    Height = 25
    Caption = 'UC'#30331#24405
    TabOrder = 3
    OnClick = Button3Click
  end
  object PageControl1: TPageControl
    Left = 400
    Top = 16
    Width = 289
    Height = 417
    ActivePage = TabSheet11
    TabOrder = 4
    object TabSheet1: TTabSheet
      Caption = #33150#35759
      object LabeledEdit7: TLabeledEdit
        Left = 8
        Top = 252
        Width = 265
        Height = 21
        EditLabel.Width = 35
        EditLabel.Height = 13
        EditLabel.Caption = 'appkey'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 0
        Text = '4578e54fb3a1bd18e0681bc1c734514e'
      end
      object LabeledEdit6: TLabeledEdit
        Left = 8
        Top = 216
        Width = 265
        Height = 21
        EditLabel.Width = 26
        EditLabel.Height = 13
        EditLabel.Caption = 'appid'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 1
        Text = '100703379'
      end
      object LabeledEdit5: TLabeledEdit
        Left = 8
        Top = 176
        Width = 265
        Height = 21
        EditLabel.Width = 44
        EditLabel.Height = 13
        EditLabel.Caption = 'paytoken'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 2
        Text = 'FC2571CA0321358A2A41EA96E842AD31'
      end
      object LabeledEdit4: TLabeledEdit
        Left = 8
        Top = 136
        Width = 265
        Height = 21
        EditLabel.Width = 41
        EditLabel.Height = 13
        EditLabel.Caption = 'openkey'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 3
        Text = '22A7CA7E78ABC451702857D05FDF5A5E'
      end
      object LabeledEdit3: TLabeledEdit
        Left = 8
        Top = 96
        Width = 265
        Height = 21
        EditLabel.Width = 32
        EditLabel.Height = 13
        EditLabel.Caption = 'openid'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 4
        Text = '252CF68F1104677A67B0EC8024680983'
      end
      object LabeledEdit2: TLabeledEdit
        Left = 8
        Top = 56
        Width = 265
        Height = 21
        EditLabel.Width = 26
        EditLabel.Height = 13
        EditLabel.Caption = 'pfkey'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 5
        Text = '8f46f6338961fce95aac6bc425f00c57'
      end
      object LabeledEdit1: TLabeledEdit
        Left = 8
        Top = 16
        Width = 265
        Height = 21
        EditLabel.Width = 9
        EditLabel.Height = 13
        EditLabel.Caption = 'pf'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 6
        Text = 
          '_qq-73213123-android-73213123-qq-100703379-252CF68F1104677A67B0E' +
          'C8024680983'
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'UC'
      ImageIndex = 1
      object LabeledEdit8: TLabeledEdit
        Left = 8
        Top = 24
        Width = 265
        Height = 21
        EditLabel.Width = 13
        EditLabel.Height = 13
        EditLabel.Caption = 'sid'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 0
        Text = 'ssh1game041e4bca2cc24e81b5b3825e2de906b8159265'
      end
      object LabeledEdit9: TLabeledEdit
        Left = 8
        Top = 64
        Width = 265
        Height = 21
        EditLabel.Width = 40
        EditLabel.Height = 13
        EditLabel.Caption = 'payment'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 1
        Text = 
          '{"sign":"217bfc8631e84523ad24b21e85f2b2d5","data":{"failedDesc":' +
          '"","amount":"10.00","callbackInfo":"","accountId":"U193496147699' +
          '2057125225f1b6ce72d","gameId":"537935","payWay":"101","orderStat' +
          'us":"S","orderId":"201503161457018400426","creator":"JY"},"ver":' +
          '"2.0"}'
      end
    end
    object TabSheet3: TTabSheet
      Caption = #26865#38236
      ImageIndex = 2
      object LabeledEdit10: TLabeledEdit
        Left = 0
        Top = 16
        Width = 281
        Height = 21
        EditLabel.Width = 28
        EditLabel.Height = 13
        EditLabel.Caption = 'userid'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 0
      end
      object LabeledEdit11: TLabeledEdit
        Left = 0
        Top = 56
        Width = 281
        Height = 21
        EditLabel.Width = 38
        EditLabel.Height = 13
        EditLabel.Caption = 'channel'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 1
      end
      object LabeledEdit12: TLabeledEdit
        Left = 0
        Top = 96
        Width = 281
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'token'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 2
      end
      object LabeledEdit13: TLabeledEdit
        Left = 0
        Top = 136
        Width = 281
        Height = 21
        EditLabel.Width = 61
        EditLabel.Height = 13
        EditLabel.Caption = 'productCode'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 3
      end
      object Memo6: TMemo
        Left = 0
        Top = 192
        Width = 281
        Height = 161
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 4
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'urldecode'
      ImageIndex = 3
      object Memo2: TMemo
        Left = 0
        Top = 0
        Width = 281
        Height = 169
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 0
        OnKeyDown = Memo2KeyDown
      end
      object Memo3: TMemo
        Left = 0
        Top = 176
        Width = 281
        Height = 169
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 1
        OnKeyDown = Memo2KeyDown
      end
      object Button6: TButton
        Left = 200
        Top = 360
        Width = 75
        Height = 25
        Caption = 'decode'
        TabOrder = 2
        OnClick = Button6Click
      end
      object Button7: TButton
        Left = 120
        Top = 360
        Width = 75
        Height = 25
        Caption = 'encode'
        TabOrder = 3
        OnClick = Button7Click
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Base64'
      ImageIndex = 4
      object Memo4: TMemo
        Left = 0
        Top = 0
        Width = 281
        Height = 169
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 0
        OnKeyDown = Memo2KeyDown
      end
      object Memo5: TMemo
        Left = 0
        Top = 176
        Width = 281
        Height = 169
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 1
        OnKeyDown = Memo2KeyDown
      end
      object Button9: TButton
        Left = 120
        Top = 360
        Width = 75
        Height = 25
        Caption = 'encode'
        TabOrder = 2
        OnClick = Button9Click
      end
      object Button10: TButton
        Left = 200
        Top = 360
        Width = 75
        Height = 25
        Caption = 'decode'
        TabOrder = 3
        OnClick = Button10Click
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Playpark'
      ImageIndex = 5
      object LabeledEdit14: TLabeledEdit
        Left = 8
        Top = 16
        Width = 265
        Height = 21
        EditLabel.Width = 45
        EditLabel.Height = 13
        EditLabel.Caption = 'master_id'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 0
      end
      object LabeledEdit15: TLabeledEdit
        Left = 8
        Top = 56
        Width = 265
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'token'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 1
      end
      object LabeledEdit16: TLabeledEdit
        Left = 8
        Top = 96
        Width = 265
        Height = 21
        EditLabel.Width = 8
        EditLabel.Height = 13
        EditLabel.Caption = 'ip'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 2
        Text = '203.144.226.26'
      end
      object LabeledEdit17: TLabeledEdit
        Left = 8
        Top = 136
        Width = 265
        Height = 21
        EditLabel.Width = 12
        EditLabel.Height = 13
        EditLabel.Caption = 'ref'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 3
      end
      object Button11: TButton
        Left = 8
        Top = 360
        Width = 75
        Height = 25
        Caption = 'login'
        TabOrder = 4
        OnClick = Button11Click
      end
      object CheckBox1: TCheckBox
        Left = 8
        Top = 336
        Width = 97
        Height = 17
        Caption = 'IsTest'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
      object Button14: TButton
        Left = 88
        Top = 360
        Width = 75
        Height = 25
        Caption = 'pay'
        TabOrder = 6
        OnClick = Button14Click
      end
      object LabeledEdit18: TLabeledEdit
        Left = 8
        Top = 272
        Width = 265
        Height = 21
        EditLabel.Width = 116
        EditLabel.Height = 13
        EditLabel.Caption = 'merchant_transaction_id'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 7
        Text = 'TR201012310001'
      end
      object LabeledEdit19: TLabeledEdit
        Left = 8
        Top = 232
        Width = 265
        Height = 21
        EditLabel.Width = 67
        EditLabel.Height = 13
        EditLabel.Caption = 'merchant_key'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 8
        Text = '5615a9eefab48aa6952d82068088c064'
      end
      object LabeledEdit20: TLabeledEdit
        Left = 8
        Top = 192
        Width = 265
        Height = 21
        EditLabel.Width = 74
        EditLabel.Height = 13
        EditLabel.Caption = 'merchant_code'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 9
        Text = 'DestinyOfThrones'
      end
      object Button15: TButton
        Left = 168
        Top = 360
        Width = 75
        Height = 25
        Caption = 'Dir pay'
        TabOrder = 10
        OnClick = Button15Click
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'UTF8'
      ImageIndex = 6
      object Memo7: TMemo
        Left = 0
        Top = 0
        Width = 281
        Height = 169
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 0
        OnKeyDown = Memo2KeyDown
      end
      object Memo8: TMemo
        Left = 0
        Top = 176
        Width = 281
        Height = 169
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 1
        OnKeyDown = Memo2KeyDown
      end
      object Button12: TButton
        Left = 120
        Top = 360
        Width = 75
        Height = 25
        Caption = 'encode'
        TabOrder = 2
        OnClick = Button12Click
      end
      object Button13: TButton
        Left = 200
        Top = 360
        Width = 75
        Height = 25
        Caption = 'decode'
        TabOrder = 3
        OnClick = Button13Click
      end
    end
    object TabSheet8: TTabSheet
      Caption = #26497#20809
      ImageIndex = 7
      object Memo9: TMemo
        Left = 0
        Top = 0
        Width = 281
        Height = 177
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        Lines.Strings = (
          '{'
          '   "platform": "all",'
          '   "audience" : "all",'
          '   "notification" : {'
          '      "alert" : "Hi, JPush!",'
          '      "android" :{'
          '         "extras" : { "newsid" : 321}'
          '      }, '
          '      "ios" : {'
          '         "extras" : { "newsid" : 321}'
          '      }'
          '   }'
          '}')
        TabOrder = 0
      end
      object Button16: TButton
        Left = 200
        Top = 360
        Width = 75
        Height = 25
        Caption = 'push'
        TabOrder = 1
        OnClick = Button16Click
      end
    end
    object TabSheet9: TTabSheet
      Caption = 'google'
      ImageIndex = 8
      object LabeledEdit21: TLabeledEdit
        Left = 0
        Top = 16
        Width = 281
        Height = 21
        EditLabel.Width = 50
        EditLabel.Height = 13
        EditLabel.Caption = #29992#25142#31471' ID'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 0
        Text = 
          '566047918665-c7ci4bts2gdacdgofk7malp8buqb6fdr.apps.googleusercon' +
          'tent.com'
      end
      object LabeledEdit22: TLabeledEdit
        Left = 0
        Top = 56
        Width = 281
        Height = 21
        EditLabel.Width = 72
        EditLabel.Height = 13
        EditLabel.Caption = #38651#23376#37109#20214#22320#22336
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 1
        Text = 
          '566047918665-c7ci4bts2gdacdgofk7malp8buqb6fdr@developer.gservice' +
          'account.com'
      end
      object LabeledEdit23: TLabeledEdit
        Left = 0
        Top = 96
        Width = 281
        Height = 21
        EditLabel.Width = 60
        EditLabel.Height = 13
        EditLabel.Caption = #29992#25142#31471#23494#30908
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 2
        Text = 'KwfDpJcppXgMprlsXgnQSZyN'
      end
      object Button17: TButton
        Left = 0
        Top = 360
        Width = 75
        Height = 25
        Caption = 'http up'
        TabOrder = 3
        OnClick = Button17Click
      end
      object LabeledEdit24: TLabeledEdit
        Left = 0
        Top = 136
        Width = 281
        Height = 21
        EditLabel.Width = 63
        EditLabel.Height = 13
        EditLabel.Caption = 'redirection url'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 4
        Text = 'http://googleapi.tnyoo.com:23333/oauth2callback'
      end
      object Button18: TButton
        Left = 80
        Top = 360
        Width = 75
        Height = 25
        Caption = 'oauth step1'
        TabOrder = 5
        OnClick = Button18Click
      end
      object LabeledEdit25: TLabeledEdit
        Left = 0
        Top = 176
        Width = 281
        Height = 21
        EditLabel.Width = 24
        EditLabel.Height = 13
        EditLabel.Caption = 'code'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 6
      end
      object Button19: TButton
        Left = 160
        Top = 360
        Width = 75
        Height = 25
        Caption = 'oauth step2'
        TabOrder = 7
        OnClick = Button19Click
      end
      object Button22: TButton
        Left = 0
        Top = 328
        Width = 75
        Height = 25
        Caption = 'verify bill'
        TabOrder = 8
        OnClick = Button22Click
      end
      object LabeledEdit26: TLabeledEdit
        Left = 0
        Top = 216
        Width = 281
        Height = 21
        EditLabel.Width = 62
        EditLabel.Height = 13
        EditLabel.Caption = 'packedname'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 9
        Text = 'com.playpark.dot'
      end
      object LabeledEdit27: TLabeledEdit
        Left = 0
        Top = 256
        Width = 281
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'itemid'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 10
        Text = '60_medals_pack'
      end
      object LabeledEdit28: TLabeledEdit
        Left = 0
        Top = 296
        Width = 281
        Height = 21
        EditLabel.Width = 31
        EditLabel.Height = 13
        EditLabel.Caption = 'Tokne'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 11
        Text = 
          'llkfgihekchphgepmfckioai.AO-J1Oza2fBJpqbrWldsc9QQssr4z4S5TjOBFCQ' +
          'k0ZqERzmgXZsBR-TNRFK8VlWBBwm1hHbTj1aORci5X8ZdykOWgQojASAN6_oyiHv' +
          'zJp-7uRfFaYfOYM8IDyNpZDR6twZo609by2d1'
      end
    end
    object TabSheet10: TTabSheet
      Caption = 'http'
      ImageIndex = 9
      object Edit1: TEdit
        Left = 0
        Top = 0
        Width = 281
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 0
      end
      object Button20: TButton
        Left = 0
        Top = 24
        Width = 75
        Height = 25
        Caption = 'Get'
        TabOrder = 1
        OnClick = Button20Click
      end
      object Edit2: TEdit
        Left = 0
        Top = 56
        Width = 281
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 2
      end
      object Edit3: TEdit
        Left = 0
        Top = 80
        Width = 281
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 3
      end
      object Button21: TButton
        Left = 0
        Top = 104
        Width = 75
        Height = 25
        Caption = 'Post'
        TabOrder = 4
        OnClick = Button21Click
      end
      object Button23: TButton
        Left = 0
        Top = 360
        Width = 75
        Height = 25
        Caption = 'indy t'
        TabOrder = 5
        OnClick = Button23Click
      end
    end
    object TabSheet11: TTabSheet
      Caption = 'md5'
      ImageIndex = 10
      object Memo10: TMemo
        Left = 0
        Top = 0
        Width = 281
        Height = 169
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 0
        OnKeyDown = Memo2KeyDown
      end
      object Memo11: TMemo
        Left = 0
        Top = 176
        Width = 281
        Height = 169
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 1
        OnKeyDown = Memo2KeyDown
      end
      object Button24: TButton
        Left = 200
        Top = 360
        Width = 75
        Height = 25
        Caption = 'md5'
        TabOrder = 2
        OnClick = Button24Click
      end
    end
  end
  object Button4: TButton
    Left = 280
    Top = 440
    Width = 75
    Height = 25
    Caption = #26865#38236#30331#38470
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 360
    Top = 440
    Width = 75
    Height = 25
    Caption = #26865#38236'md5'
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button8: TButton
    Left = 616
    Top = 440
    Width = 75
    Height = 25
    Caption = 'test'
    TabOrder = 7
    OnClick = Button8Click
  end
  object IdHTTPServer1: TIdHTTPServer
    Bindings = <>
    OnCommandGet = IdHTTPServer1CommandGet
    Left = 652
    Top = 400
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 652
    Top = 368
  end
end
