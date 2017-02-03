object Form1: TForm1
  Left = 190
  Top = 124
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Form1'
  ClientHeight = 482
  ClientWidth = 715
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
  object PageControl1: TPageControl
    Left = 392
    Top = 16
    Width = 289
    Height = 417
    ActivePage = TabSheet21
    TabOrder = 6
    object TabSheet2: TTabSheet
      Caption = #38463#37324
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
        Text = 'ssh1mobibd205ba8832b4ba1983b8c10a482fae6116318'
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
      object AliOrderBtn: TButton
        Left = 64
        Top = 208
        Width = 153
        Height = 25
        Caption = #38463#37324#26500#36896#19979#21333#35831#27714
        TabOrder = 2
        OnClick = AliOrderBtnClick
      end
      object AliLoginVerifyBtn: TButton
        Left = 72
        Top = 144
        Width = 145
        Height = 25
        Caption = #38463#37324#30331#24405#39564#35777
        TabOrder = 3
        OnClick = AliLoginVerifyBtnClick
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
      end
      object Memo3: TMemo
        Left = 0
        Top = 176
        Width = 281
        Height = 169
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 1
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
      object Button34: TButton
        Left = 56
        Top = 364
        Width = 65
        Height = 25
        Caption = 'decodeStr'
        TabOrder = 4
        OnClick = Button34Click
      end
      object Button35: TButton
        Left = -2
        Top = 364
        Width = 59
        Height = 25
        Caption = 'encodeStr'
        TabOrder = 5
        OnClick = Button35Click
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
      end
      object Memo5: TMemo
        Left = 0
        Top = 176
        Width = 281
        Height = 169
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 1
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
      object Button36: TButton
        Left = 24
        Top = 356
        Width = 75
        Height = 25
        Caption = 'MD5'
        TabOrder = 4
        OnClick = Button36Click
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
      end
      object Memo8: TMemo
        Left = 0
        Top = 176
        Width = 281
        Height = 169
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 1
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
      object Button39: TButton
        Left = 24
        Top = 356
        Width = 75
        Height = 25
        Caption = 'iapppayencode'
        TabOrder = 4
        OnClick = Button39Click
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
          '{   '
          ' "platform": "all",   '
          ' "audience" : "all",   '
          ' "notification" : {      '
          ' "alert" : "Hi, JPush111!",       '
          '"android" :{        '
          '  "extras" : { "newsid" : 321}     '
          '  },       '
          ' "ios" : {        '
          '  "extras" : { "newsid" : 321}      '
          ' }   '
          ' }, '
          ' "options" : {"apns_production":false} '
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
      object LabeledEdit26: TLabeledEdit
        Left = 8
        Top = 208
        Width = 89
        Height = 21
        EditLabel.Width = 23
        EditLabel.Height = 13
        EditLabel.Caption = 'key1'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 2
        Text = 'tnyoo'
      end
      object LabeledEdit27: TLabeledEdit
        Left = 136
        Top = 208
        Width = 89
        Height = 21
        EditLabel.Width = 32
        EditLabel.Height = 13
        EditLabel.Caption = 'value1'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 3
        Text = '1111'
      end
      object LabeledEdit28: TLabeledEdit
        Left = 8
        Top = 264
        Width = 89
        Height = 21
        EditLabel.Width = 23
        EditLabel.Height = 13
        EditLabel.Caption = 'key2'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 4
        Text = 'login'
      end
      object LabeledEdit29: TLabeledEdit
        Left = 136
        Top = 264
        Width = 97
        Height = 21
        EditLabel.Width = 32
        EditLabel.Height = 13
        EditLabel.Caption = 'value2'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 5
        Text = '12345'
      end
      object LabeledEdit30: TLabeledEdit
        Left = 8
        Top = 320
        Width = 113
        Height = 21
        EditLabel.Width = 42
        EditLabel.Height = 13
        EditLabel.Caption = 'message'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 6
        Text = 'Hi,JPush!'
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
        Top = 200
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
        Left = 96
        Top = 200
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
        Left = 192
        Top = 200
        Width = 75
        Height = 25
        Caption = 'oauth step2'
        TabOrder = 7
        OnClick = Button19Click
      end
      object Button3: TButton
        Left = 8
        Top = 360
        Width = 121
        Height = 25
        Caption = 'RefreshAccessToken'
        TabOrder = 8
        OnClick = Button3Click
      end
      object GooglePayBtn: TButton
        Left = 144
        Top = 360
        Width = 129
        Height = 25
        Caption = 'GetVerifyJson'
        TabOrder = 9
        OnClick = GooglePayBtnClick
      end
      object PkgNameEdit: TLabeledEdit
        Left = 0
        Top = 256
        Width = 265
        Height = 21
        EditLabel.Width = 74
        EditLabel.Height = 13
        EditLabel.Caption = 'package_name'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 10
        Text = 'com.playpark.dot'
      end
      object ProductIdEdit: TLabeledEdit
        Left = 0
        Top = 296
        Width = 265
        Height = 21
        EditLabel.Width = 50
        EditLabel.Height = 13
        EditLabel.Caption = 'product_id'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 11
        Text = 'vip_30days'
      end
      object PurchaseTokenEdit: TLabeledEdit
        Left = 0
        Top = 336
        Width = 273
        Height = 21
        EditLabel.Width = 77
        EditLabel.Height = 13
        EditLabel.Caption = 'purchase_token'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 12
        Text = 
          'giokddnecnchggmjgpepligd.AO-J1OwRhc7oykQkgnV8Y19FXavgdUMewxwl2KM' +
          'j2kFuC8AfrYpuqqU8GkKRikLaWJ3qClqGJdACCHPWqgc8s6w31KY3E69o-leRL91' +
          'aL12r2cX6L5J40hc'
      end
    end
    object TabSheet10: TTabSheet
      Caption = 'http'
      ImageIndex = 9
      object Edit1: TEdit
        Left = 8
        Top = 0
        Width = 281
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 0
        Text = 'http://www.baidu.com'
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
        Text = 'https://usrsys.vivo.com.cn/sdk/user/auth.do'
      end
      object Edit3: TEdit
        Left = 0
        Top = 80
        Width = 281
        Height = 21
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 3
        Text = 
          'authtoken=NzQ5MWFmYzE0OTc0Mzc3YWFhYjkuMTA2NDIzOTE3LjE0Njg0NjAwOT' +
          'AyMTg%3D'
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
    end
    object TabSheet11: TTabSheet
      Caption = 'SMS'
      ImageIndex = 10
      object LabeledEdit31: TLabeledEdit
        Left = 16
        Top = 136
        Width = 89
        Height = 21
        EditLabel.Width = 30
        EditLabel.Height = 13
        EditLabel.Caption = 'phone'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 0
        Text = '15987122670'
      end
      object LabeledEdit32: TLabeledEdit
        Left = 128
        Top = 136
        Width = 89
        Height = 21
        EditLabel.Width = 24
        EditLabel.Height = 13
        EditLabel.Caption = 'code'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 1
      end
      object LabeledEdit33: TLabeledEdit
        Left = 16
        Top = 184
        Width = 89
        Height = 21
        EditLabel.Width = 23
        EditLabel.Height = 13
        EditLabel.Caption = 'zone'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 2
        Text = '86'
      end
      object Button22: TButton
        Left = 72
        Top = 280
        Width = 73
        Height = 25
        Caption = 'verify'
        TabOrder = 3
        OnClick = Button22Click
      end
      object LabeledEdit34: TLabeledEdit
        Left = 128
        Top = 184
        Width = 89
        Height = 21
        EditLabel.Width = 87
        EditLabel.Height = 13
        EditLabel.Caption = 'appkey(IOS/AND)'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 4
        Text = 'AND'
      end
    end
    object TabSheet12: TTabSheet
      Caption = 'Mi'
      ImageIndex = 11
      object Button23: TButton
        Left = 16
        Top = 336
        Width = 81
        Height = 33
        Caption = 'LoginVerify'
        TabOrder = 0
        OnClick = Button23Click
      end
      object LabeledEdit35: TLabeledEdit
        Left = 16
        Top = 32
        Width = 89
        Height = 21
        EditLabel.Width = 26
        EditLabel.Height = 13
        EditLabel.Caption = 'appid'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 1
        Text = '2882303761517371108'
      end
      object LabeledEdit36: TLabeledEdit
        Left = 136
        Top = 32
        Width = 89
        Height = 21
        EditLabel.Width = 35
        EditLabel.Height = 13
        EditLabel.Caption = 'session'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 2
        Text = 'h7b9ABrK9lqhZGC9'
      end
      object LabeledEdit37: TLabeledEdit
        Left = 16
        Top = 72
        Width = 89
        Height = 21
        EditLabel.Width = 14
        EditLabel.Height = 13
        EditLabel.Caption = 'uid'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 3
        Text = '11867180'
      end
      object Button24: TButton
        Left = 144
        Top = 336
        Width = 81
        Height = 33
        Caption = 'PayVerify'
        TabOrder = 4
        OnClick = Button24Click
      end
      object LabeledEdit38: TLabeledEdit
        Left = 16
        Top = 112
        Width = 89
        Height = 21
        EditLabel.Width = 47
        EditLabel.Height = 13
        EditLabel.Caption = 'cpOrderId'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 5
        Text = '11867180'
      end
      object LabeledEdit39: TLabeledEdit
        Left = 136
        Top = 112
        Width = 89
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'orderId'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 6
        Text = '11867180'
      end
      object LabeledEdit40: TLabeledEdit
        Left = 16
        Top = 152
        Width = 89
        Height = 21
        EditLabel.Width = 54
        EditLabel.Height = 13
        EditLabel.Caption = 'orderStatus'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 7
        Text = '11867180'
      end
      object LabeledEdit41: TLabeledEdit
        Left = 136
        Top = 152
        Width = 89
        Height = 21
        EditLabel.Width = 38
        EditLabel.Height = 13
        EditLabel.Caption = 'payFree'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 8
        Text = '11867180'
      end
      object LabeledEdit42: TLabeledEdit
        Left = 16
        Top = 192
        Width = 89
        Height = 21
        EditLabel.Width = 61
        EditLabel.Height = 13
        EditLabel.Caption = 'productCode'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 9
        Text = '11867180'
      end
      object LabeledEdit43: TLabeledEdit
        Left = 136
        Top = 192
        Width = 89
        Height = 21
        EditLabel.Width = 64
        EditLabel.Height = 13
        EditLabel.Caption = 'productName'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 10
        Text = '11867180'
      end
      object LabeledEdit44: TLabeledEdit
        Left = 16
        Top = 232
        Width = 89
        Height = 21
        EditLabel.Width = 64
        EditLabel.Height = 13
        EditLabel.Caption = 'productCount'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 11
        Text = '11867180'
      end
      object LabeledEdit45: TLabeledEdit
        Left = 136
        Top = 232
        Width = 89
        Height = 21
        EditLabel.Width = 40
        EditLabel.Height = 13
        EditLabel.Caption = 'payTime'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 12
        Text = '11867180'
      end
    end
    object TabSheet13: TTabSheet
      Caption = '360'
      ImageIndex = 12
      object LabeledEdit46: TLabeledEdit
        Left = 16
        Top = 32
        Width = 233
        Height = 21
        EditLabel.Width = 67
        EditLabel.Height = 13
        EditLabel.Caption = 'access_token'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 0
        Text = '27588094228d9ce062bef22c0aa707d3c75e899c577b91bbcf'
      end
      object LabeledEdit47: TLabeledEdit
        Left = 16
        Top = 88
        Width = 233
        Height = 21
        EditLabel.Width = 26
        EditLabel.Height = 13
        EditLabel.Caption = 'appid'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 1
        Text = '2882303761517371108'
      end
      object Button25: TButton
        Left = 16
        Top = 336
        Width = 81
        Height = 33
        Caption = 'LoginVerify'
        TabOrder = 2
        OnClick = Button25Click
      end
      object Button26: TButton
        Left = 144
        Top = 336
        Width = 81
        Height = 33
        Caption = 'PayVerify'
        TabOrder = 3
        OnClick = Button26Click
      end
    end
    object TabSheet14: TTabSheet
      Caption = 'baidu'
      ImageIndex = 13
      object Button27: TButton
        Left = 48
        Top = 64
        Width = 81
        Height = 33
        Caption = 'LoginVerify'
        TabOrder = 0
        OnClick = Button27Click
      end
    end
    object TabSheet15: TTabSheet
      Caption = 'KF'
      ImageIndex = 14
      object Button28: TButton
        Left = 16
        Top = 336
        Width = 81
        Height = 33
        Caption = 'LoginVerify'
        TabOrder = 0
        OnClick = Button28Click
      end
    end
    object TabSheet16: TTabSheet
      Caption = 'HuaWei'
      ImageIndex = 15
      object LabeledEdit48: TLabeledEdit
        Left = 8
        Top = 56
        Width = 265
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'token'
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 0
        Text = 
          'B1dWISxB6+31UK6WYiU3ixU/f0mtXlxdQqeZLK9OhCB6j5L3UibXOMqnZJcO5UFe' +
          '+rsKT011i+pIFt/SywM='
      end
      object Button37: TButton
        Left = 32
        Top = 128
        Width = 75
        Height = 25
        Caption = 'loginVerify'
        TabOrder = 1
        OnClick = Button37Click
      end
      object Button38: TButton
        Left = 128
        Top = 128
        Width = 75
        Height = 25
        Caption = 'payVerify'
        TabOrder = 2
        OnClick = Button37Click
      end
    end
    object TabSheet17: TTabSheet
      Caption = 'Vivo'
      ImageIndex = 16
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 27
        Height = 13
        Caption = 'token'
      end
      object Label4: TLabel
        Left = 8
        Top = 80
        Width = 78
        Height = 13
        Caption = 'cpOrderNumber:'
      end
      object Label5: TLabel
        Left = 8
        Top = 120
        Width = 50
        Height = 13
        Caption = 'orderTime:'
      end
      object Label6: TLabel
        Left = 8
        Top = 160
        Width = 62
        Height = 13
        Caption = 'callBackInfo:'
      end
      object token: TEdit
        Left = 0
        Top = 16
        Width = 273
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 0
        Text = 'NzQ5MWFmYzE0OTc0Mzc3YWFhYjkuMTA2NDIzOTE3LjE0Njg0NjAwOTAyMTg%3D'
      end
      object VivoLoginVerifyBtn: TButton
        Left = -8
        Top = 40
        Width = 89
        Height = 25
        Caption = 'Login Verify'
        TabOrder = 1
        OnClick = VivoLoginVerifyBtnClick
      end
      object VivoPayOrder: TButton
        Left = 168
        Top = 216
        Width = 105
        Height = 25
        Caption = 'Get Order Number'
        TabOrder = 2
        OnClick = VivoPayOrderClick
      end
      object VivoPayVerify: TButton
        Left = 160
        Top = 288
        Width = 113
        Height = 25
        Caption = 'VivoPayVerify'
        TabOrder = 3
        OnClick = VivoPayVerifyClick
      end
      object vivoEdit: TEdit
        Left = 0
        Top = 264
        Width = 273
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 4
        Text = 
          'uid=a23dc38481ad3492&tradeType=01&respCode=200&tradeStatus=0000&' +
          'appId=4f00a8c18074b6ca58eae73f3f30f5b3&payTime=20160720173352&cp' +
          'OrderNumber=14690360080000&cpId=20150506165431733076&signMethod=' +
          'MD5&orderAmount=1&orderNumber=2016072017333326300014984789&extIn' +
          'fo=VT02XzY4QDE2NCZJPTEmQj0xNDY5MDM2MDA4MDAwMCZTPTE%3D&respMsg=%E' +
          '4%BA%A4%E6%98%93%E6%88%90%E5%8A%9F&signature=cbc7dd984a5fc079f63' +
          'a2c4c5ff2ff57'
      end
      object Button42: TButton
        Left = 128
        Top = 360
        Width = 145
        Height = 25
        Caption = 'callbackInfo'#32553#30701#21152#23494
        TabOrder = 5
        OnClick = Button42Click
      end
      object vivoNumEdit: TEdit
        Left = 8
        Top = 96
        Width = 121
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 6
        Text = '14690316930000'
      end
      object vivoTimeEdit: TEdit
        Left = 8
        Top = 136
        Width = 121
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 7
        Text = '20160720162132'
      end
      object vivoCallbackEdit: TEdit
        Left = 8
        Top = 184
        Width = 225
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 8
        Text = 'VT0xNV82MkAxNjQmST0xJkI9MTQ2OTAzMTY5MzAwMDAmUz0x'
      end
    end
    object TabSheet18: TTabSheet
      Caption = #34411#34411#28216#25103
      ImageIndex = 17
      object Label2: TLabel
        Left = 0
        Top = 56
        Width = 27
        Height = 13
        Caption = 'token'
      end
      object CCToken: TEdit
        Left = 0
        Top = 72
        Width = 273
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 0
        Text = '694a4997a1084bed9de4665fbe17b440'
      end
      object CCLoginVerifyBtn: TButton
        Left = 0
        Top = 120
        Width = 89
        Height = 25
        Caption = 'Login Verify'
        TabOrder = 1
        OnClick = CCLoginVerifyBtnClick
      end
      object ccpayEdit4: TEdit
        Left = 0
        Top = 184
        Width = 265
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 2
        Text = 'token=694a4997a1084bed9de4665fbe17b440'
      end
      object Button43: TButton
        Left = 184
        Top = 248
        Width = 75
        Height = 25
        Caption = #25130#21462'token'
        TabOrder = 3
        OnClick = Button43Click
      end
    end
    object TabSheet19: TTabSheet
      Caption = '23'#20840#27665#28216#25103
      ImageIndex = 18
      object Label3: TLabel
        Left = 0
        Top = 56
        Width = 27
        Height = 13
        Caption = 'token'
      end
      object SessionId: TEdit
        Left = 0
        Top = 72
        Width = 273
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 0
        Text = 'dbb8e7161671414a903fb91513dd494f'
      end
      object QMYXLoginBtn: TButton
        Left = 0
        Top = 136
        Width = 89
        Height = 25
        Caption = 'Login Verify'
        TabOrder = 1
        OnClick = QMYXLoginBtnClick
      end
      object QMYXPayBtn: TButton
        Left = 152
        Top = 136
        Width = 89
        Height = 25
        Caption = 'Pay Query'
        TabOrder = 2
        OnClick = QMYXPayBtnClick
      end
      object Button41: TButton
        Left = 24
        Top = 240
        Width = 161
        Height = 25
        Caption = #26080#25442#34892'callbackInfo'#26500#36896
        TabOrder = 3
        OnClick = Button41Click
      end
    end
    object TabSheet20: TTabSheet
      Caption = '6Kwan'
      ImageIndex = 19
      object Button40: TButton
        Left = 48
        Top = 328
        Width = 161
        Height = 25
        Caption = #35299#26512#25903#20184#22238#35843#25968#25454
        TabOrder = 0
        OnClick = Button40Click
      end
    end
    object TabSheet21: TTabSheet
      Caption = #33150#35759
      ImageIndex = 20
      object Label7: TLabel
        Left = 40
        Top = 200
        Width = 60
        Height = 13
        Caption = #25805#20316#35746#21333#21495
      end
      object QQLoginVerify: TButton
        Left = 136
        Top = 120
        Width = 137
        Height = 25
        Caption = 'LoginVerify'
        TabOrder = 0
        OnClick = QQLoginVerifyClick
      end
      object QQComboBox: TComboBox
        Left = 16
        Top = 120
        Width = 89
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 1
        Text = 'QQ'
        Items.Strings = (
          'QQ'
          #24494#20449)
      end
      object Button44: TButton
        Left = 40
        Top = 160
        Width = 185
        Height = 25
        Caption = #26597#35810#28216#25103#24065#20313#39069
        TabOrder = 2
        OnClick = Button44Click
      end
      object Button45: TButton
        Left = 40
        Top = 256
        Width = 185
        Height = 25
        Caption = #25187#38500#28216#25103#24065
        TabOrder = 3
        OnClick = Button45Click
      end
      object Button46: TButton
        Left = 40
        Top = 296
        Width = 185
        Height = 25
        Caption = #21462#28040#25903#20184#65288#36864#36824#28216#25103#24065#65289
        TabOrder = 4
        OnClick = Button46Click
      end
      object Button47: TButton
        Left = 40
        Top = 336
        Width = 185
        Height = 25
        Caption = #30452#25509#36192#36865#28216#25103#24065
        TabOrder = 5
        OnClick = Button47Click
      end
      object QQOrderNoEdit: TEdit
        Left = 40
        Top = 216
        Width = 177
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 6
        Text = '20170101-'
      end
      object QQLoginEdit: TLabeledEdit
        Left = 16
        Top = 24
        Width = 241
        Height = 21
        EditLabel.Width = 60
        EditLabel.Height = 13
        EditLabel.Caption = 'QQLoginEdit'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 7
        Text = 
          ' {"platform":1,"pf":"desktop_m_qq-73213123-android-00000000-8678' +
          '22025692483","flag":0,"token":"8D0EF628394ACC58CD7A9E4A6C3F7D21"' +
          ',"open_id":"E5D970D29D94EA518CB86E9D21D12A47","pf_key":"25aee5e6' +
          '29f211b06f488dc05e2127e0","PayToken":"A3C57F96C3791931FBAAB641EB' +
          '588B20"}'
      end
      object WXLoginEdit: TLabeledEdit
        Left = 16
        Top = 72
        Width = 241
        Height = 21
        EditLabel.Width = 62
        EditLabel.Height = 13
        EditLabel.Caption = 'WXLoginEdit'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 8
        Text = 
          '{"platform":2,"pf":"desktop_m_wx-2002-android-00000000-867822025' +
          '692483","flag":0,"token":"o1fEfHM2shPCMQhJrhDQgc-EjL3id5bYNLW3oT' +
          'hJOFPlIpAAMJvI5jF83rFSg0KGHnoiDnMEJVM6PBRTaIBQAruEl3q70DNCo8zP8E' +
          'AGkXA","open_id":"oYlgWt1F62jNdx7ic-yMlmrawYgg","pf_key":"7607e9' +
          'd5b541684f2236a0b863afeabb","RefreshToken":"o1fEfHM2shPCMQhJrhDQ' +
          'gXyNzcSB2oHHfakJRyVv6C1gl-k64csOgLWAM-41g-5MVjOqEJbZk26JpZYLvzOY' +
          'D5HD6_SzeRQG0_NVtoiu7Go"}'
      end
    end
    object TabSheet22: TTabSheet
      Caption = #29233#36125#25903#20184
      ImageIndex = 21
      object Button48: TButton
        Left = 40
        Top = 120
        Width = 139
        Height = 25
        Caption = #29233#36125#19979#21333#35831#27714#21450#39564#35777
        TabOrder = 0
        OnClick = Button48Click
      end
    end
    object TabSheet1: TTabSheet
      Caption = #30334#24230
      ImageIndex = 21
      object Label8: TLabel
        Left = 16
        Top = 32
        Width = 72
        Height = 13
        Caption = 'AccessToken: '
      end
      object Button49: TButton
        Left = 144
        Top = 88
        Width = 75
        Height = 25
        Caption = #30331#24405#39564#35777
        TabOrder = 0
        OnClick = Button49Click
      end
      object BaiduTokenEdit: TEdit
        Left = 16
        Top = 48
        Width = 249
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 1
        Text = 
          '{"ResultCode":1,"ResultMsg":"AccessToken'#37722#22559#30838#37832#22795#26213'","AppID":"6925292' +
          '","Sign":"af05762bea7454cad70b55c559fbd6e4","Content":"eyJVSUQiO' +
          'jEyNzcxNzQ0NzF9"} '
      end
    end
    object TabSheet23: TTabSheet
      Caption = 'OPPO'
      ImageIndex = 22
      object OppoLoginVerify: TButton
        Left = 184
        Top = 72
        Width = 75
        Height = 25
        Caption = 'LoginVerify'
        TabOrder = 0
        OnClick = OppoLoginVerifyClick
      end
      object oppoLoginData: TLabeledEdit
        Left = 16
        Top = 40
        Width = 249
        Height = 21
        EditLabel.Width = 49
        EditLabel.Height = 13
        EditLabel.Caption = 'LoginData'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 1
        Text = 
          '{"flag":0,"token":"TOKEN_nTPYwuyXxjWhvHq1Kua07LrhIerx1IwGhkRLwFW' +
          'VbhdQ+wWpf8W\/vg==","ssoid":"58733948"}'
      end
    end
    object TabSheet24: TTabSheet
      Caption = '4399'
      ImageIndex = 23
      object M4399LoginEdit: TLabeledEdit
        Left = 8
        Top = 24
        Width = 257
        Height = 21
        EditLabel.Width = 51
        EditLabel.Height = 13
        EditLabel.Caption = 'LoginJson:'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 0
        Text = 
          '{"State":"2141362029|9a64bde691e2f9e7fb247d094b6b623b|40651|8678' +
          '22025692483|a0edfe624be55e88cb6a8a8e7e00abeb|2fa5476ed3ce89ed6b4' +
          '323e4c178e651|1473905543|4399","Uid":"2141362029","flag":0}'
      end
      object M4399Login: TButton
        Left = 168
        Top = 80
        Width = 75
        Height = 25
        Caption = 'LoginVerify'
        TabOrder = 1
        OnClick = M4399LoginClick
      end
    end
    object TabSheet25: TTabSheet
      Caption = #25628#29399
      ImageIndex = 24
      object SougouLoginEdit: TLabeledEdit
        Left = 16
        Top = 32
        Width = 249
        Height = 21
        EditLabel.Width = 81
        EditLabel.Height = 13
        EditLabel.Caption = 'SougouLoginEdit'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 0
        Text = 
          '{"UserId":8450537,"flag":0,"SessionKey":"37133d2a2aa2307e8dce1bb' +
          '5adc3ff849c0db657e30f3475501d9c66b6080e6a"}'
      end
      object Button50: TButton
        Left = 168
        Top = 80
        Width = 75
        Height = 25
        Caption = 'LoginVerify'
        TabOrder = 1
        OnClick = Button50Click
      end
      object SougouAuthEdit: TLabeledEdit
        Left = 16
        Top = 120
        Width = 233
        Height = 21
        EditLabel.Width = 106
        EditLabel.Height = 13
        EditLabel.Caption = #29983#25104'Auth'#21442#25968#32452#21512#65306
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 2
        Text = 
          'amount1=10&amount2=100&appdata=123&date=131018&gid=100&oid=T1310' +
          '18_90&realAmount=10&role=&sid=1&time=20131018202859&uid=1&{ECCE1' +
          '1A4-2D0A-4DC0-B4B6-05F94BF0C8FC}'
      end
      object SougouAuthBtn: TButton
        Left = 176
        Top = 160
        Width = 75
        Height = 25
        Caption = #29983#25104'Auth'
        TabOrder = 3
        OnClick = SougouAuthBtnClick
      end
    end
    object TabSheet26: TTabSheet
      Caption = 'Lenovo'
      ImageIndex = 25
      object LenovoLoginEdit: TLabeledEdit
        Left = 8
        Top = 32
        Width = 257
        Height = 21
        EditLabel.Width = 96
        EditLabel.Height = 13
        EditLabel.Caption = 'LenovoLoginToken:'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 0
        Text = 
          '{"flag":0,"data":"ZAgAAAAAAAGE9MTAwMzM4ODk4ODAmYj0yJmM9MSZkPTE2M' +
          'DI4JmU9MkVDODBGODM0NzQ5N0I1OEIzRjg2N0VCQzYyMUUwQzExJmg9MTQ3NzEwM' +
          'zA4MjAxMSZpPTQzMjAwJmo9MCZvPTAwMDAwMDAwMDAwMDAwMCZwPWltZWkmcT0wJ' +
          'nVzZXJuYW1lPTI4NjIwOTAyNDIlNDBxcS5jb20maWw9Y26658zTvWOBpiENCmYsv' +
          'Ti8"}'
      end
      object LenovoLoginBtn: TButton
        Left = 192
        Top = 80
        Width = 75
        Height = 25
        Caption = 'LoginVerify'
        TabOrder = 1
        OnClick = LenovoLoginBtnClick
      end
      object LenovoPayVerifyBtn: TButton
        Left = 192
        Top = 240
        Width = 75
        Height = 25
        Caption = #31614#21517#39564#35777
        TabOrder = 2
        OnClick = LenovoPayVerifyBtnClick
      end
      object LenovoPayEdit: TLabeledEdit
        Left = 8
        Top = 208
        Width = 257
        Height = 21
        EditLabel.Width = 82
        EditLabel.Height = 13
        EditLabel.Caption = 'Pay Return Data:'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 3
        Text = 
          'transdata={"exorderno":"1","transid":"2","appid":"3","waresid":3' +
          '1,"feetype":4,"money":5,"count":6,"result":0,"transtype":0,"tran' +
          'stime":"2012-12-1212:11:10","cpprivate":"7","paytype":1}&sign=d9' +
          '1cbc584316b9d99919921a9'
      end
    end
    object TTabSheet
      Caption = #37329#31435
      ImageIndex = 26
      object JinLiLoginEdit: TLabeledEdit
        Left = 8
        Top = 40
        Width = 265
        Height = 21
        EditLabel.Width = 60
        EditLabel.Height = 13
        EditLabel.Caption = 'LoginToken:'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 0
        Text = 
          '{"h":"4BB0270330C9427DB7A7CDB9B1D55440","n":"6057D6F4","t":"1475' +
          '892724","v":"5397DF5A996F6F45BF1A2477F02A55D0995D8C74"}'
      end
      object JinLiLoginBtn: TButton
        Left = 192
        Top = 80
        Width = 75
        Height = 25
        Caption = 'LoginVerify'
        TabOrder = 1
        OnClick = JinLiLoginBtnClick
      end
      object JinLiGetOrdBtn: TButton
        Left = 160
        Top = 296
        Width = 121
        Height = 25
        Caption = #33719#21462#37329#31435#35746#21333#21495
        TabOrder = 2
        OnClick = JinLiGetOrdBtnClick
      end
      object JinLiOrderEdit: TLabeledEdit
        Left = 0
        Top = 256
        Width = 265
        Height = 21
        EditLabel.Width = 86
        EditLabel.Height = 13
        EditLabel.Caption = 'CP Order Number:'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 3
        Text = 'TN-201610209001'
      end
      object JinLiPlayerIDEdit: TLabeledEdit
        Left = 0
        Top = 208
        Width = 121
        Height = 21
        EditLabel.Width = 43
        EditLabel.Height = 13
        EditLabel.Caption = 'PlayerID:'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 4
        Text = '37A4736CA0D24FB8BC58451673896AE6'
      end
      object Button51: TButton
        Left = 144
        Top = 136
        Width = 123
        Height = 25
        Caption = #29983#25104#38543#26426#23383#31526#20018
        TabOrder = 5
        OnClick = Button51Click
      end
    end
    object TabSheet27: TTabSheet
      Caption = #28207#28595#21488'sdk'
      ImageIndex = 27
      object GOSdkEdit: TLabeledEdit
        Left = 8
        Top = 16
        Width = 241
        Height = 21
        EditLabel.Width = 82
        EditLabel.Height = 13
        EditLabel.Caption = #30331#24405#39564#35777'Token:'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 0
        Text = '7804b60fc089f8ca15251fa41be4094c'
      end
      object GoSdkLogin: TButton
        Left = 104
        Top = 40
        Width = 153
        Height = 25
        Caption = 'TokenVerify'
        TabOrder = 1
        OnClick = GoSdkLoginClick
      end
      object GoSdkSend1Btn: TButton
        Left = 104
        Top = 240
        Width = 177
        Height = 25
        Caption = #21457#36865#36947#20855#25110#31036#29289#21253
        TabOrder = 2
        OnClick = GoSdkSend1BtnClick
      end
      object GoSdkPayVerifyBtn: TButton
        Left = 56
        Top = 120
        Width = 217
        Height = 25
        Caption = #25163#27231#20805#20540#21450'WEB'#20805#20540' '#39564#35777' (callback)'
        TabOrder = 3
        OnClick = GoSdkPayVerifyBtnClick
      end
      object GoSdkSend2Btn: TButton
        Left = 64
        Top = 344
        Width = 217
        Height = 25
        Caption = #21457#36865#36947#20855#25110#31036#29289#21253#65288#30452#25509#21457#25918#65289
        TabOrder = 4
        OnClick = GoSdkSend2BtnClick
      end
      object GoSdkSend1Edit: TLabeledEdit
        Left = 13
        Top = 210
        Width = 265
        Height = 21
        EditLabel.Width = 60
        EditLabel.Height = 13
        EditLabel.Caption = #22238#35843#25968#25454#65306
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 5
        Text = 
          'interface=3&gameacc=testuser&billno=823258283512&serverid=0&conp' +
          'on_code=183716351251&ext=areaId=3;roleId=38;goodId=3;&sign=5e3a5' +
          'fdb7cce510a'
      end
      object GoSdkSend2Edit: TLabeledEdit
        Left = 16
        Top = 312
        Width = 257
        Height = 21
        EditLabel.Width = 60
        EditLabel.Height = 13
        EditLabel.Caption = #22238#35843#25968#25454#65306
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 6
        Text = 
          'interface=4&gameacc=testuser&billno=823258283512&serverid=0&item' +
          'id=14234&quantity=1&ext=areaId=3;roleId=38;goodId=3;&sign=5e3a5f' +
          'db7cce510a'
      end
      object GoSdkPayCallbackEdit: TLabeledEdit
        Left = 8
        Top = 96
        Width = 265
        Height = 21
        EditLabel.Width = 84
        EditLabel.Height = 13
        EditLabel.Caption = #25903#20184#22238#35843#25968#25454#65306
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 7
        Text = 
          'gameuid=123&billno=823258283512&referenceId=823258283512&product' +
          'Id=com.gameone.war.web&currency=HK&amount=38&channelId=3&serveri' +
          'd=0&ext=dkjbqk2j131j1823&timestamp=1237183&sign=875fc863162c638e'
      end
    end
    object TabSheet28: TTabSheet
      Caption = #35916#35910#33626
      ImageIndex = 28
      object WDJLoginEdit: TLabeledEdit
        Left = 16
        Top = 40
        Width = 249
        Height = 21
        EditLabel.Width = 55
        EditLabel.Height = 13
        EditLabel.Caption = 'Login Data:'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 0
        Text = 
          ' {"flag":0,"token":"4NHKC5BvW3xvOZCh33VhDSq9I54-uJd1I5bdF2hmrWQ"' +
          ',"uid":"108612495"}'
      end
      object WDJLoginBtn: TButton
        Left = 184
        Top = 88
        Width = 75
        Height = 25
        Caption = 'Login Verify'
        TabOrder = 1
        OnClick = WDJLoginBtnClick
      end
      object WDJPayVerifyBtn: TButton
        Left = 64
        Top = 272
        Width = 171
        Height = 25
        Caption = 'Pay Verify'
        TabOrder = 2
        OnClick = WDJPayVerifyBtnClick
      end
    end
    object TabSheet29: TTabSheet
      Caption = #24555#21457
      ImageIndex = 29
      object KFLoginEdit: TLabeledEdit
        Left = 16
        Top = 32
        Width = 249
        Height = 21
        EditLabel.Width = 55
        EditLabel.Height = 13
        EditLabel.Caption = 'Login Data:'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 0
        Text = 
          '{"loginUserId":"32522732@MINIGAME","loginAuthToken":"1f4148df640' +
          '2581a1bd4f3028c77374d","loginUserName":"KFmaster","loginOpenId":' +
          '"0dcb2af30ebc832c8a4cedaff958fa55","switchUserFlag":false,"cp":"' +
          'matrix","message":"'#36134#21495#20108'","status":1}'
      end
      object KFLoginVerifyBtn: TButton
        Left = 176
        Top = 88
        Width = 75
        Height = 25
        Caption = 'Login Verify'
        TabOrder = 1
        OnClick = KFLoginVerifyBtnClick
      end
    end
    object TabSheet30: TTabSheet
      Caption = #20048#35270
      ImageIndex = 30
      object LetvLoginEdit: TLabeledEdit
        Left = 16
        Top = 32
        Width = 257
        Height = 21
        EditLabel.Width = 55
        EditLabel.Height = 13
        EditLabel.Caption = 'Login Data:'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 0
        Text = 
          '{"flag":"succeed","uid":"201367226","token":"6523fb9m3l0zuRwMpQU' +
          '0m3S5XMCx4rGCQpagcTohbxjGE77hyag9ZtuMFTdGtBURw2L9rm23JOFrpzBiAPA' +
          'w"}'
      end
      object LetvLoginBtn: TButton
        Left = 184
        Top = 80
        Width = 83
        Height = 25
        Caption = 'Login Verify'
        TabOrder = 1
        OnClick = LetvLoginBtnClick
      end
      object LetvPayVerifyBtn: TButton
        Left = 72
        Top = 256
        Width = 155
        Height = 25
        Caption = 'Pay Verify'
        TabOrder = 2
        OnClick = LetvPayVerifyBtnClick
      end
    end
    object TabSheet31: TTabSheet
      Caption = #24403#20048
      ImageIndex = 31
      object DangLeLoginEdit: TLabeledEdit
        Left = 16
        Top = 24
        Width = 257
        Height = 21
        EditLabel.Width = 55
        EditLabel.Height = 13
        EditLabel.Caption = 'Login Data:'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 0
        Text = 
          '{"flag":0,"memberId":"2903960468220","username":"d8go37q275","ni' +
          'ckname":"d8go37q275","token":"12673954D9044C09A547B816007A2A4D"}'
      end
      object DangLeLoginBtn: TButton
        Left = 152
        Top = 64
        Width = 113
        Height = 25
        Caption = 'DangLeLoginBtn'
        TabOrder = 1
        OnClick = DangLeLoginBtnClick
      end
      object DangLePayBtn: TButton
        Left = 184
        Top = 224
        Width = 75
        Height = 25
        Caption = 'Pay Verify'
        TabOrder = 2
        OnClick = DangLePayBtnClick
      end
      object DangLePayEdit: TLabeledEdit
        Left = 24
        Top = 176
        Width = 233
        Height = 21
        EditLabel.Width = 82
        EditLabel.Height = 13
        EditLabel.Caption = 'Pay Return Data:'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 3
        Text = 
          'order=ok123456&money=5.21&mid=123456&time=20141212105433&result=' +
          '1&ext=1234567890&subject=item1&signature=21d1c6e109ef3ab56f1fc9b' +
          'dce6f4e5d'
      end
    end
    object TabSheet32: TTabSheet
      Caption = #23433#26234
      ImageIndex = 32
      object AnZhiLoginEdit: TLabeledEdit
        Left = 16
        Top = 24
        Width = 257
        Height = 21
        EditLabel.Width = 55
        EditLabel.Height = 13
        EditLabel.Caption = 'Login Data:'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 0
        Text = 
          '{"flag":"succeed","uid":"201611071531459LXKBQTKl6","token":"NzE5' +
          'OTUxOTV8MTQ3ODU5MTc5MnwwMDJ8TU9WRV9URVJNSU5BTHwzMDEyMDk="}'
      end
      object AnZhiLoginBtn: TButton
        Left = 160
        Top = 64
        Width = 75
        Height = 25
        Caption = 'Login Verify'
        TabOrder = 1
        OnClick = AnZhiLoginBtnClick
      end
      object AnZhiPayBtn: TButton
        Left = 144
        Top = 200
        Width = 75
        Height = 25
        Caption = 'Pay Verify'
        TabOrder = 2
        OnClick = AnZhiPayBtnClick
      end
      object AnZhiPayEdit: TLabeledEdit
        Left = 16
        Top = 160
        Width = 257
        Height = 21
        EditLabel.Width = 47
        EditLabel.Height = 13
        EditLabel.Caption = 'Pay Data:'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 3
        Text = 
          'data=LHz3XQcmdhq7HEcqZZxMNr8oaujtncid7YqbpwJ5Lt6Lk87zDjGwgM8V+xh' +
          'obap6unEyiW0xEeBcNfv0jiMBqaJv88cZ6wpgoYyWNyzJfSIAMSdh02HuEdBAEKi' +
          'k3FyMdKhi3YwNz25UEiykblHDYX/v99lzcLVeuxxHKmWcTDbzupXkoTCzrMVT30F' +
          'UyB8yn2EDJsEiRiZxqabcex2M9jD9xUI5vJmQA5JTlPgVqQazkVpKlVRx8qfY4p0' +
          'ZBTiG7YqbpwJ5Lt6CygmHa3EcWNURitDDqyelyMpukQpojfr0VP8lc22qcsO7x4n' +
          'KXQ5TyiaI7ql3IYw='
      end
    end
    object TabSheet33: TTabSheet
      Caption = #37239#27966
      ImageIndex = 33
      object CoolPadLoginEdit: TLabeledEdit
        Left = 8
        Top = 32
        Width = 265
        Height = 21
        EditLabel.Width = 55
        EditLabel.Height = 13
        EditLabel.Caption = 'Login Data:'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 0
        Text = 
          '{"flag":"succeed","Authcode":"1eb1c2ec7c70a69f442609b4659a386e",' +
          '"code":"1eb1c2ec7c70a69f442609b4659a386e"}'
      end
      object CoolPadLoginBtn: TButton
        Left = 152
        Top = 72
        Width = 113
        Height = 25
        Caption = 'Login Verify'
        TabOrder = 1
        OnClick = CoolPadLoginBtnClick
      end
      object CoolPadOrderBtn: TButton
        Left = 112
        Top = 176
        Width = 155
        Height = 25
        Caption = 'Get Order Number'
        TabOrder = 2
        OnClick = CoolPadOrderBtnClick
      end
      object CoolPadCpOrderEdit: TLabeledEdit
        Left = 16
        Top = 128
        Width = 121
        Height = 21
        EditLabel.Width = 80
        EditLabel.Height = 13
        EditLabel.Caption = 'cp order number:'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 3
        Text = 'tn-920-203fa'
      end
      object CoolPadPayEdit: TLabeledEdit
        Left = 8
        Top = 288
        Width = 273
        Height = 21
        EditLabel.Width = 89
        EditLabel.Height = 13
        EditLabel.Caption = 'Pay Calback Data:'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 4
        Text = 
          'transdata={"transtype":0,"cporderid":"1","transid":"2","appuseri' +
          'd":"test","appid":"3","waresid":31,"feetype":4,"money":5.00, "cu' +
          'rrency":"RMB", "result":0, "transtime":"2012-12-12 12:11:10","cp' +
          'private":"test","paytype":1}&sign=xxxxxx&signtype=RSA'
      end
      object CoolPadPayVerifyBtn: TButton
        Left = 184
        Top = 328
        Width = 75
        Height = 25
        Caption = 'Pay Verify'
        TabOrder = 5
        OnClick = CoolPadPayVerifyBtnClick
      end
    end
    object TabSheet34: TTabSheet
      Caption = #24212#29992#27719
      ImageIndex = 34
      object YYHLoginEdit: TLabeledEdit
        Left = 8
        Top = 24
        Width = 265
        Height = 21
        EditLabel.Width = 90
        EditLabel.Height = 13
        EditLabel.Caption = 'Login Return Data:'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 0
        Text = 
          '{"flag":"succeed","ticket":"d836d5cd-4da0-46ab-9f18-71f2c0c1c799' +
          '"}'
      end
      object YYHLoginVerifyBtn: TButton
        Left = 160
        Top = 72
        Width = 105
        Height = 25
        Caption = 'Login Verify'
        TabOrder = 1
        OnClick = YYHLoginVerifyBtnClick
      end
      object YYHPayEdit: TLabeledEdit
        Left = 0
        Top = 256
        Width = 273
        Height = 21
        EditLabel.Width = 89
        EditLabel.Height = 13
        EditLabel.Caption = 'Pay Calback Data:'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 2
        Text = 
          'transdata={"transtype":0,"cporderid":"1","transid":"2","appuseri' +
          'd":"test","appid":"3","waresid":31,"feetype":4,"money":5.00, "cu' +
          'rrency":"RMB", "result":0, "transtime":"2012-12-12 12:11:10","cp' +
          'private":"test","paytype":1}&sign=xxxxxx&signtype=RSA'
      end
      object YYHPayVerifyBtn: TButton
        Left = 152
        Top = 304
        Width = 75
        Height = 25
        Caption = 'Pay Verify'
        TabOrder = 3
        OnClick = YYHPayVerifyBtnClick
      end
    end
    object MEIZU: TTabSheet
      Caption = #39749#26063
      ImageIndex = 35
      object MZLoginEdit: TLabeledEdit
        Left = 8
        Top = 32
        Width = 265
        Height = 21
        EditLabel.Width = 55
        EditLabel.Height = 13
        EditLabel.Caption = 'Login Data:'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 0
        Text = 
          '{"flag":0,"mUid":"133468864","session":"eyJ2IjozLCJnIjpmYWxzZSwi' +
          'dSI6IjEzMzQ2ODg2NCIsInQiOjE0ODI5OTQzODk5MjQsInMiOiJucyIsInIiOiJi' +
          'YmtIZEdLR2dBT2hwM0t5czRIUiIsImEiOiI0RDE3RTMzREI4NzFFMUUzNDdCMTIx' +
          'NzU0MjY2MkMyRCIsImwiOiI1OEVDRjA0NzhDOTJDOTk3MTBFREY1NzAwMzM1REVG' +
          'QyJ9"}'
      end
      object MZLoginBtn: TButton
        Left = 192
        Top = 88
        Width = 75
        Height = 25
        Caption = 'Login Verify'
        TabOrder = 1
        OnClick = MZLoginBtnClick
      end
      object MZOrderBtn: TButton
        Left = 192
        Top = 184
        Width = 75
        Height = 25
        Caption = #35746#21333#31614#21517
        TabOrder = 2
        OnClick = MZOrderBtnClick
      end
      object MZOrderEdit: TLabeledEdit
        Left = 16
        Top = 144
        Width = 121
        Height = 21
        EditLabel.Width = 48
        EditLabel.Height = 13
        EditLabel.Caption = #35746#21333#21495#65306
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 3
        Text = '20170101-23892'
      end
      object PayDataEdit: TLabeledEdit
        Left = 8
        Top = 248
        Width = 273
        Height = 21
        EditLabel.Width = 84
        EditLabel.Height = 13
        EditLabel.Caption = #25903#20184#22238#35843#25968#25454#65306
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 4
        Text = 
          'app_id=464013&buy_amount=1&cp_order_id=2680&create_time=14137760' +
          '92239&notify_id=1413776113206&notify_time=2014-10-2011:35:13&ord' +
          'er_id=14102000000298934&partner_id=5458428&pay_time=141377611321' +
          '9&pay_type=0&product_id=2&product_per_price=1.0&product_unit='#26522'&t' +
          'otal_price=1.0&trade_status=3&uid=9700193&user_info='#22238#35843'CallbackIn' +
          'fo&sign=e2023c2de1fbc54ebcdac297c902fa58&sign_type=MD5'
      end
      object PayVerifyBtn: TButton
        Left = 200
        Top = 296
        Width = 75
        Height = 25
        Caption = #25903#20184#39564#31614
        TabOrder = 5
        OnClick = PayVerifyBtnClick
      end
    end
    object TabSheet35: TTabSheet
      Caption = #29233#28216#25103
      ImageIndex = 36
      object AIYOUXILoginEdit: TLabeledEdit
        Left = 8
        Top = 32
        Width = 265
        Height = 21
        EditLabel.Width = 55
        EditLabel.Height = 13
        EditLabel.Caption = 'Login Data:'
        ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
        TabOrder = 0
        Text = '{"flag":"succeed","code":"04e02e8a283db0d21f562fc8c9e4c5bb"}'
      end
      object AIYouXiLoginBtn: TButton
        Left = 184
        Top = 80
        Width = 75
        Height = 25
        Caption = 'Login Verify'
        TabOrder = 1
        OnClick = AIYouXiLoginBtnClick
      end
      object AIYOUXIPayIF2Btn: TButton
        Left = 144
        Top = 264
        Width = 121
        Height = 25
        Caption = #35745#36153#22238#35843#25509#21475
        TabOrder = 2
        OnClick = AIYOUXIPayIF2BtnClick
      end
    end
  end
  object Memo1: TMemo
    Left = 8
    Top = 32
    Width = 385
    Height = 417
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 448
    Width = 105
    Height = 25
    Caption = #33150#35759#25903#20184#19979#21333
    TabOrder = 1
  end
  object Button2: TButton
    Left = 120
    Top = 448
    Width = 75
    Height = 25
    Caption = 'unix'#26102#38388#25139
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 280
    Top = 448
    Width = 75
    Height = 25
    Caption = #26865#38236#30331#38470
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 360
    Top = 448
    Width = 75
    Height = 25
    Caption = #26865#38236'md5'
    TabOrder = 4
    OnClick = Button5Click
  end
  object Button8: TButton
    Left = 616
    Top = 448
    Width = 81
    Height = 25
    Caption = #26500#36896'js '#27979#35797
    TabOrder = 5
    OnClick = Button8Click
  end
  object Button29: TButton
    Left = 456
    Top = 447
    Width = 75
    Height = 25
    Caption = 'QQlogVerity'
    TabOrder = 7
  end
  object Button30: TButton
    Left = 536
    Top = 447
    Width = 75
    Height = 25
    Caption = 'QQPayVerity'
    TabOrder = 8
    OnClick = Button30Click
  end
  object Button31: TButton
    Left = 560
    Top = 487
    Width = 75
    Height = 25
    Caption = 'clear LJ'
    TabOrder = 9
    OnClick = Button31Click
  end
  object Button32: TButton
    Left = 88
    Top = 488
    Width = 75
    Height = 25
    Caption = 'clear Show'
    TabOrder = 10
    OnClick = Button32Click
  end
  object Button33: TButton
    Left = 456
    Top = 487
    Width = 75
    Height = 25
    Caption = 'clear ALL'
    TabOrder = 11
    OnClick = Button33Click
  end
  object IdHTTPServer1: TIdHTTPServer
    Bindings = <>
    Left = 680
    Top = 64
  end
  object TencentTimer: TTimer
    Enabled = False
    Interval = 15000
    Left = 684
    Top = 96
  end
end
