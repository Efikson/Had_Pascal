object Form2: TForm2
  Left = 1080
  Top = 123
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Track races'
  ClientHeight = 201
  ClientWidth = 451
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
  object Label1: TLabel
    Left = 32
    Top = 8
    Width = 100
    Height = 20
    Caption = 'Tlou'#353#357'ka '#269#225'ry'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 80
    Width = 122
    Height = 20
    Caption = 'Rychlost pohybu'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 0
    Top = 177
    Width = 451
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
    Left = 32
    Top = 144
    Width = 141
    Height = 20
    Caption = 'Limit vyhran'#253'ch kol'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 336
    Top = 24
    Width = 99
    Height = 41
    Caption = 'START'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 336
    Top = 72
    Width = 99
    Height = 41
    Caption = 'KONEC'
    Font.Charset = DEFAULT_CHARSET
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
    Height = 45
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
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Text = '5'
  end
  object TrackBar2: TTrackBar
    Left = 8
    Top = 104
    Width = 150
    Height = 45
    Min = 1
    PageSize = 1
    Position = 5
    TabOrder = 4
    OnChange = TrackBar2Change
  end
  object Edit2: TEdit
    Left = 160
    Top = 104
    Width = 25
    Height = 21
    TabOrder = 5
    Text = '5'
  end
  object Edit3: TEdit
    Left = 200
    Top = 56
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Text = 'Player 1'
    OnChange = Edit3Change
  end
  object Edit4: TEdit
    Left = 200
    Top = 88
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    Text = 'Player 2'
    OnChange = Edit4Change
  end
  object Edit5: TEdit
    Left = 184
    Top = 144
    Width = 33
    Height = 21
    TabOrder = 8
    Text = '15'
    OnChange = Edit5Change
  end
end
