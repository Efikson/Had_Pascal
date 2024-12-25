unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    Panel1: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    Button3: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Timer2: TTimer;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure DrawPlayer(var X, Y: integer; var angle: Real; LControl, RControl: Boolean; color: TColor);
    procedure GameStart;
    procedure GameStop;
    procedure GameReset(player: Integer);
    procedure CheckPlayerColision (player: Integer);
    Procedure AwardPointsCheckVictory(player: Integer);
  public
    X1, X2, Y1, Y2 : integer; //players positions
    angle1, angle2: Real; //players controls
    L1, R1, L2, R2, winner : Boolean; //players controls
  end;

var
  Form1: TForm1;
implementation

uses Unit2;

{$R *.dfm}

////////////////////////
// rendering players  //
procedure TForm1.DrawPlayer(var X, Y: integer; var angle: Real; LControl, RControl: Boolean; color: TColor);
begin
  Image1.Canvas.MoveTo(X, Y);
  X := Round(X + LineSpeed * Cos(angle));
  Y := Round(Y + LineSpeed * Sin(angle));
  Image1.Canvas.Pen.Color := color;
  Image1.Canvas.LineTo(X, Y);

  if LControl then
    angle := angle - 0.2;
  if RControl then
    angle := angle + 0.2;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  DrawPlayer(X1, Y1, angle1, L1, R1, clRed);
  DrawPlayer(X2, Y2, angle2, L2, R2, clBlue);
  CheckPlayerColision(1);
  CheckPlayerColision(2);
end;

//////////////////////
// players controls //
procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
const
BlinkRange = 60;
begin
  if Key = 81 then // Q
  begin
    if CheckBox1.State = cbChecked then
    begin
      X1 := Round(X1 + BlinkRange * Cos(angle1));
      Y1 := Round(Y1 + BlinkRange * Sin(angle1));
      CheckBox1.State := cbUnchecked;

      // glitch jump check
      if not PtInRect(image1.BoundsRect, Point(X1, Y1)) then
      begin
      AwardPointsCheckVictory(1);
      if winner then Exit;
      GameReset(1);
      Showmessage(label5.caption + ' wanted to run away cowardly.');
      end;
    end;
  end;

  if Key = 96 then // 0
  begin
    if CheckBox2.State = cbChecked then
    begin
      X2 := Round(X2 + BlinkRange * Cos(angle2));
      Y2 := Round(Y2 + BlinkRange * Sin(angle2));
      CheckBox2.State := cbUnchecked;

      // glitch jump check
      if not PtInRect(image1.BoundsRect, Point(X1, Y1)) then
      begin
      AwardPointsCheckVictory(2);
      if winner then Exit;
      GameReset(2);
      Showmessage(label6.caption + ' wanted to run away cowardly');
      end;
    end;
  end;

  // Movement and rotation control
  if Key = 65 then L1 := True;  // A
  if Key = 68 then R1 := True;  // D
  if Key = 37 then L2 := True;  // Left arrow
  if Key = 39 then R2 := True;  // Right arrow
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin  
  if Key = 65 then L1 := False;
  if Key = 68 then R1 := False;
  if Key = 37 then L2 := False;
  if Key = 39 then R2 := False;
end;

////////////////
// Game start //
procedure TForm1.GameStart;
begin
 button1.Enabled:=false;
 timer2.Enabled:=true;
 checkbox1.State:=cbunchecked;
 checkbox2.State:=cbunchecked;
 label4.Caption:=INTTOSTR(5);
 
 label3.Visible:=true;
 label3.Caption:=INTTOSTR(3);
 label3.Top:=trunc(image1.Height/2)-80;
 label3.left:=trunc(image1.Width/2)-30;
 label3.Font.size:=80;

 //green border
 Image1.canvas.pen.color:=clgreen;
 Image1.canvas.pen.width:=15;
 image1.Canvas.Rectangle(0,0,image1.Width,image1.Height);
 
 //controls reset
  Image1.Canvas.Pen.Width:= LineThickness;
  L1:= False;
  R1:= False;
  L2:= False;
  R2:= False; 
end;

procedure TForm1.GameStop;
begin
  button1.Enabled := False;
  button2.Enabled := True;
  timer1.Enabled := False;
  timer2.Enabled := False;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
Self.Position := poScreenCenter;
end;

// start of the first round
procedure TForm1.FormShow(Sender: TObject);
begin
 edit1.Text:= '0';
 edit2.Text:= '0';
 label5.Caption:=player1;
 label6.Caption:=player2;
 label8.Caption:= 'Race to ' + INTTOSTR(Rounds);
 winner := false;
       
 GameStart;  
end;

// stop and reset after collision
procedure TForm1.GameReset(player: Integer);
begin
  GameStop;
  button1.Enabled := True;
  label3.Visible := True;
  label3.Top := Trunc(image1.Height / 2) - 20;
  label3.Left := Trunc(image1.Width / 2) - 160;
  label3.Font.Size := 20;
  label3.Caption := 'Press ENTER for a new round.';
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  //random vector of players at start
  label3.Caption:= INTTOSTR(STRTOINT(label3.Caption) -1);
  if label3.Caption=INTTOSTR(0) THEN
  begin
  label3.visible:=false;
  X1:= Round(Image1.Width * 1/4);
  X2:= Round(Image1.Width * 3/4);
  Y1:= Image1.Height div 2;
  Y2:= Image1.Height div 2;

  randomize;
  angle1:= random (7); //angles in radians
  angle2:= random (7);

  timer1.enabled:= true;
  button1.enabled:=false;
  button2.enabled:=false;
  end;

  //bonus button spawn
  label4.Caption:= INTTOSTR(STRTOINT(label4.Caption) - 1);
  IF label4.Caption =INTTOSTR(0) THEN
  begin
  label4.Caption:=INTTOSTR(5);
  button3.Top:=30 + random(490);
  button3.left:=30 + random(690);
  button3.Visible:=true;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 GameStart;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
form1.hide;
form2.Show;
end;

// adding points and checking victory
Procedure Tform1.AwardPointsCheckVictory(player: Integer);
begin
  case player of
    1: edit2.Text := INTTOSTR(STRTOINT(edit2.Text) + 1);
    2: edit1.Text := INTTOSTR(STRTOINT(edit1.Text) + 1);
  end;

  if (StrToInt(edit1.Text) = Rounds) then
  begin
    winner := true;
    GameStop;
    ShowMessage(label5.Caption + ' is the winner!');
  end
  else if (StrToInt(edit2.Text) = Rounds) then
  begin
    winner := true;
    GameStop;
    ShowMessage(label6.Caption + ' is the winner!');
  end;
end;

///////////////////////
// collision control //
procedure TForm1.CheckPlayerColision(player: Integer);
var
  mess: Integer;
  bod1: TPoint;
  playerX, playerY, playerAngle: real;
  playerJmeno: string;
  playerCheckBox: TCheckBox;
begin  
  case player of
    1: begin
      playerX := X1;
      playerY := Y1;
      playerAngle := angle1;
      playerJmeno := player1;
      playerCheckBox := CheckBox1;
    end;
    2: begin
      playerX := X2;
      playerY := Y2;
      playerAngle := angle2;
      playerJmeno := player2;
      playerCheckBox := CheckBox2;
    end;
  end;

  bod1.X := Round(playerX + (LineThickness * 3 / 4) * Cos(playerAngle));
  bod1.Y := Round(playerY + (LineThickness * 3 / 4) * Sin(playerAngle));

  // collision check
  case image1.Canvas.Pixels[bod1.X, bod1.Y] of
    clRed: begin
      AwardPointsCheckVictory(player);
      if winner then Exit;
      GameReset(player);
      mess := Random(2);
      case mess of
        0: ShowMessage(playerJmeno + ' got tricked.');
        1: ShowMessage(playerJmeno + ' hit the red thin line.');
      end; 
    end;
    clBlue: begin
      AwardPointsCheckVictory(player);
      if winner then Exit;
      GameReset(player);
      mess := Random(2);
      case mess of
        0: ShowMessage(playerJmeno + ' got fooled.');
        1: ShowMessage(playerJmeno + ' hit the blue track.');
      end;
    end;
    clGreen: begin
      AwardPointsCheckVictory(player);
      if winner then Exit;
      GameReset(player);
      mess := Random(2);
      case mess of
        0: ShowMessage(playerJmeno + ' wanted to go to windows.');
        1: ShowMessage(playerJmeno + ' hit the green border.');
      end;
    end;
  end; 

  // Collision check with bonus button
  if PtInRect(Button3.BoundsRect, bod1) then
  begin
    Button3.Visible := False;
    playerCheckBox.State := cbChecked;
  end;             
end;

end.




