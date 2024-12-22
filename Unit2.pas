unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    TrackBar1: TTrackBar;
    Edit1: TEdit;
    Label1: TLabel;
    TrackBar2: TTrackBar;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2 ;
  cara,konec:integer;
  speed: real;
  name1,name2: string;
implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
cara:=trackbar1.position;
speed:=TrackBar2.position;
form2.Hide;
form1.show;  

end;

procedure TForm2.Button2Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TForm2.TrackBar1Change(Sender: TObject);
begin
cara:=trackbar1.position;
edit1.Text:= INTTOSTR(trackbar1.position);
end;

procedure TForm2.TrackBar2Change(Sender: TObject);
begin
speed:=TrackBar2.position;
edit2.Text:= INTTOSTR(trackbar2.position);
end;

procedure TForm2.Edit3Change(Sender: TObject);
begin
 name1:= edit3.text;
end;

procedure TForm2.Edit4Change(Sender: TObject);
begin
name2:= edit4.text;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
name1:='player1';
name2:='player2';
konec:=15;
end;

procedure TForm2.Edit5Change(Sender: TObject);
begin
konec:= STRTOINT(edit5.text);
end;

end.
