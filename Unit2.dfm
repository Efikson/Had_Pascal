object Form2: TForm2
  Left = 1462
  Top = 121
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Track races'
  ClientHeight = 213
  ClientWidth = 431
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 8
    Width = 117
    Height = 20
    Caption = 'Track thickness'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 72
    Width = 91
    Height = 20
    Caption = 'Track speed'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 0
    Top = 189
    Width = 431
    Height = 24
    Align = alBottom
    Alignment = taRightJustify
    Caption = 'Created by Filip Efler   '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Onyx'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 40
    Top = 136
    Width = 91
    Height = 20
    Caption = 'Rounds won'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 328
    Top = 32
    Width = 64
    Height = 25
    Caption = 'Q | A D'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 328
    Top = 96
    Width = 55
    Height = 25
    Caption = '0 | < >'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 200
    Top = 144
    Width = 99
    Height = 41
    Caption = 'START'
    Font.Charset = BALTIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 320
    Top = 144
    Width = 99
    Height = 41
    Caption = 'EXIT'
    Font.Charset = BALTIC_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object TrackBar1: TTrackBar
    Left = 8
    Top = 32
    Width = 150
    Height = 33
    Max = 20
    Min = 5
    PageSize = 1
    Position = 5
    TabOrder = 2
    OnChange = TrackBar1Change
  end
  object Edit1: TEdit
    Left = 160
    Top = 32
    Width = 25
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    Text = '5'
  end
  object TrackBar2: TTrackBar
    Left = 8
    Top = 96
    Width = 150
    Height = 33
    Min = 1
    PageSize = 1
    Position = 5
    TabOrder = 4
    OnChange = TrackBar2Change
  end
  object Edit2: TEdit
    Left = 160
    Top = 96
    Width = 25
    Height = 21
    ReadOnly = True
    TabOrder = 5
    Text = '5'
  end
  object Edit3: TEdit
    Left = 200
    Top = 32
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 13
    ParentFont = False
    TabOrder = 6
    Text = 'Player 1'
    OnChange = Edit3Change
  end
  object Edit4: TEdit
    Left = 200
    Top = 96
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 13
    ParentFont = False
    TabOrder = 7
    Text = 'Player 2'
    OnChange = Edit4Change
  end
  object Edit5: TEdit
    Left = 160
    Top = 160
    Width = 25
    Height = 21
    ReadOnly = True
    TabOrder = 8
    Text = '10'
  end
  object TrackBar3: TTrackBar
    Left = 8
    Top = 160
    Width = 150
    Height = 45
    Max = 15
    Min = 1
    Position = 10
    TabOrder = 9
    OnChange = TrackBar3Change
  end
end
