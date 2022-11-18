object FormMain: TFormMain
  Left = 274
  Top = 264
  AlphaBlend = True
  AlphaBlendValue = 0
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 602
  ClientWidth = 862
  Color = clBlack
  TransparentColor = True
  TransparentColorValue = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 862
    Height = 602
    Align = alClient
    Center = True
    Proportional = True
    Stretch = True
    OnMouseDown = Image1MouseDown
  end
  object ListBoxShuffle: TListBox
    Left = 736
    Top = 224
    Width = 121
    Height = 97
    ItemHeight = 13
    TabOrder = 0
    Visible = False
  end
  object LBShuffleQuotes: TListBox
    Left = 736
    Top = 328
    Width = 121
    Height = 97
    ItemHeight = 13
    TabOrder = 1
    Visible = False
  end
  object LBUserEvents: TListBox
    Left = 736
    Top = 120
    Width = 121
    Height = 97
    ItemHeight = 13
    TabOrder = 2
    Visible = False
  end
  object LBShuffleUser: TListBox
    Left = 736
    Top = 24
    Width = 121
    Height = 89
    ItemHeight = 13
    TabOrder = 3
    Visible = False
  end
  object LBTrain: TListBox
    Left = 736
    Top = 432
    Width = 121
    Height = 97
    ItemHeight = 13
    TabOrder = 4
    Visible = False
  end
  object MP: TMediaPlayer
    Left = 216
    Top = 0
    Width = 85
    Height = 30
    EnabledButtons = [btPlay, btPause, btStop]
    VisibleButtons = [btPlay, btPause, btStop]
    AutoRewind = False
    Visible = False
    TabOrder = 5
  end
  object TimerDelayControlPanel: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerDelayControlPanelTimer
    Left = 8
  end
  object TimerMain: TTimer
    Enabled = False
    OnTimer = TimerMainTimer
    Left = 40
  end
  object TimerMainAnimation: TTimer
    Enabled = False
    Interval = 50
    OnTimer = TimerMainAnimationTimer
    Left = 72
  end
  object PopupMenu1: TPopupMenu
    MenuAnimation = [maTopToBottom, maBottomToTop]
    Left = 176
    object Work0000001: TMenuItem
      Caption = '00:00:00'
    end
    object TMenuItem
    end
    object Settings1: TMenuItem
      Caption = 'Settings'
      OnClick = Settings1Click
    end
    object Makeabreak1: TMenuItem
      Caption = 'Make a break'
      OnClick = Makeabreak1Click
    end
    object About: TMenuItem
      Caption = 'About EyeSaver'
      OnClick = AboutClick
    end
    object Exit2: TMenuItem
      Caption = 'Exit'
      OnClick = Exit2Click
    end
  end
  object PopupMenu2: TPopupMenu
    MenuAnimation = [maTopToBottom, maBottomToTop]
    Left = 336
    object ShQuote: TMenuItem
      Caption = 'Show Quote'
      OnClick = ShQuoteClick
    end
    object ShRemainTime: TMenuItem
      Caption = 'Show Remain Time'
      OnClick = ShRemainTimeClick
    end
    object ShTrain: TMenuItem
      Caption = 'Show Eye Gymnastic'
      OnClick = ShTrainClick
    end
    object ShMenuPanel: TMenuItem
      Caption = 'Show Menu Panel'
      OnClick = ShMenuPanelClick
    end
    object plSound: TMenuItem
      Caption = 'Sound'
      OnClick = plSoundClick
    end
    object BacktoWindows2: TMenuItem
    end
    object Settings2: TMenuItem
      Caption = 'Settings'
      OnClick = Settings2Click
    end
    object BacktoWindows3: TMenuItem
      Caption = 'Back to Windows'
      OnClick = BacktoWindows3Click
    end
    object ExitEyeSaver1: TMenuItem
      Caption = 'Exit Eye Saver'
      OnClick = ExitEyeSaver1Click
    end
  end
  object ActionList1: TActionList
    Left = 400
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 32883
      OnExecute = Action1Execute
    end
  end
  object ApplicationEvents1: TApplicationEvents
    OnIdle = ApplicationEvents1Idle
    Left = 432
  end
end
