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
  private
    procedure UpdatePlayer(var X, Y: integer; var angle: Real; LControl, RControl: Boolean; color: TColor);
    procedure InicializujHru;
    procedure ZastavitHru;
    procedure Kontroluj (player: Integer);
    Procedure BodyVitezstvi(player: Integer);
    procedure ResetHry(player: Integer);
  public
    X1, X2, Y1, Y2 : integer; //Pozice hráèù
    angle1, angle2: Real; //ovládání hráèù
    L1, R1, L2, R2, vitez : Boolean; //ovládání hráèù
  end;

var
  Form1: TForm1;
implementation

uses Unit2;

{$R *.dfm}

////////////////////////
// Vykreslování hráèù //
procedure TForm1.UpdatePlayer(var X, Y: integer; var angle: Real; LControl, RControl: Boolean; color: TColor);
begin
  Image1.Canvas.MoveTo(X, Y);
  X := Round(X + RychlostCary * Cos(angle));
  Y := Round(Y + RychlostCary * Sin(angle));
  Image1.Canvas.Pen.Color := color;
  Image1.Canvas.LineTo(X, Y);

  if LControl then
    angle := angle - 0.2;
  if RControl then
    angle := angle + 0.2;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  UpdatePlayer(X1, Y1, angle1, L1, R1, clRed);
  UpdatePlayer(X2, Y2, angle2, L2, R2, clBlue);
  Kontroluj(1);
  Kontroluj(2);
end;

////////////////////
// Ovládání hráèù //
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

      // Kontrola skoku mimo herní oblast
      if not PtInRect(image1.BoundsRect, Point(X1, Y1)) then
      begin
      BodyVitezstvi(1);
      if vitez then Exit;
      ResetHry(1);
      Showmessage(label5.caption + ' chtìl zbabìle utéct');      
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

      // Kontrola skoku mimo herní oblast   
      if not PtInRect(image1.BoundsRect, Point(X1, Y1)) then
      begin
      BodyVitezstvi(2);
      if vitez then Exit;
      ResetHry(2);
      Showmessage(label6.caption + ' chtìl zbabìle utéct');      
      end;
    end;
  end;

  // Ovládání pohybu a otáèení
  if Key = 65 then L1 := True;  // A
  if Key = 68 then R1 := True;  // D
  if Key = 37 then L2 := True;  // šipka vlevo
  if Key = 39 then R2 := True;  // šipka vpravo
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin  
  if Key = 65 then L1 := False;
  if Key = 68 then R1 := False;
  if Key = 37 then L2 := False;
  if Key = 39 then R2 := False;
end;

//////////////////////
// Inicializace Hry //
procedure TForm1.InicializujHru;
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

 //vykreslení rámeèku
 Image1.canvas.pen.color:=clgreen;
 Image1.canvas.pen.width:=15;
 image1.Canvas.Rectangle(0,0,image1.Width,image1.Height);
 
 //reset ovládání
  Image1.Canvas.Pen.Width:= TloutkaCary;
  L1:= False;
  R1:= False;
  L2:= False;
  R2:= False; 
end;

procedure TForm1.ZastavitHru;
begin
  button1.Enabled := False;
  button2.Enabled := True;
  timer1.Enabled := False;
  timer2.Enabled := False;
end;

// Spuštìní prvního kola
procedure TForm1.FormShow(Sender: TObject);
begin
 edit1.Text:= '0';
 edit2.Text:= '0';
 label5.Caption:=hrac1;
 label6.Caption:=hrac2;
 label8.Caption:= 'Limit vyhraných kol = ' + INTTOSTR(PocetKol);
 vitez := false;

 InicializujHru;  
end;

// Zastavení a pøípadný reset hry po kolizi
procedure TForm1.ResetHry(player: Integer);
begin
  ZastavitHru;
  button1.Enabled := True;
  label3.Visible := True;
  label3.Top := Trunc(image1.Height / 2) - 20;
  label3.Left := Trunc(image1.Width / 2) - 160;
  label3.Font.Size := 20;
  label3.Caption := 'Pro nové kolo stiskni ENTER';
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  //náhodný vektor hráèù pøi startu
  label3.Caption:= INTTOSTR(STRTOINT(label3.Caption) -1);
  if label3.Caption=INTTOSTR(0) THEN
  begin
  label3.visible:=false;
  X1:= Round(Image1.Width * 1/4);
  X2:= Round(Image1.Width * 3/4);
  Y1:= Image1.Height div 2;
  Y2:= Image1.Height div 2;

  randomize;
  angle1:= random (7); //úhly v radiánech
  angle2:= random (7);

  timer1.enabled:= true;
  button1.enabled:=false;
  button2.enabled:=false;
  end;

  //spawn tlaèítka bonusu
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
 InicializujHru;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
form1.hide;
form2.Show;
end;

// Pøiètení bodù a kontrola vítìzství
Procedure Tform1.BodyVitezstvi(player: Integer);
begin
  // Pøiètení bodu hráèi
  case player of
    1: edit2.Text := INTTOSTR(STRTOINT(edit2.Text) + 1);
    2: edit1.Text := INTTOSTR(STRTOINT(edit1.Text) + 1);
  end;

  // Kontrola vítìzství
  if (StrToInt(edit1.Text) = PocetKol) then
  begin
    vitez := true;
    ZastavitHru;
    ShowMessage(label5.Caption + ' zvítìzil!');
  end
  else if (StrToInt(edit2.Text) = PocetKol) then
  begin
    vitez := true;
    ZastavitHru;
    ShowMessage(label6.Caption + ' zvítìzil!');
  end;
end;

/////////////////////
// Kontrola kolizí //
procedure TForm1.Kontroluj(player: Integer);
var
  mess: Integer;
  bod1: TPoint;
  playerX, playerY, playerAngle: real;
  playerName: string;
  playerCheckBox: TCheckBox;
begin  
  case player of
    1: begin
      playerX := X1;
      playerY := Y1;
      playerAngle := angle1;
      playerName := hrac1;
      playerCheckBox := CheckBox1;
    end;
    2: begin
      playerX := X2;
      playerY := Y2;
      playerAngle := angle2;
      playerName := hrac2;
      playerCheckBox := CheckBox2;
    end;
  end;

  // Kolize pro hráèe
  bod1.X := Round(playerX + (TloutkaCary * 3 / 4) * Cos(playerAngle));
  bod1.Y := Round(playerY + (TloutkaCary * 3 / 4) * Sin(playerAngle));

  // Kontrola kolize
  case image1.Canvas.Pixels[bod1.X, bod1.Y] of
    clRed: begin
      BodyVitezstvi(player);
      if vitez then Exit;
      ResetHry(player);
      mess := Random(2);
      case mess of
        0: ShowMessage(playerName + ' ochutnal sám sebe');
        1: ShowMessage(playerName + ' narazil do èervené dráhy');
      end; 
    end;
    clBlue: begin
      BodyVitezstvi(player);
      if vitez then Exit;
      ResetHry(player);
      mess := Random(2);
      case mess of
        0: ShowMessage(playerName + ' se nechal napálit');
        1: ShowMessage(playerName + ' narazil do modré dráhy'); 
      end;
    end;
    clGreen: begin
      BodyVitezstvi(player);
      if vitez then Exit;
      ResetHry(player);
      mess := Random(2);
      case mess of
        0: ShowMessage(playerName + ' chtìl vyjet do windowsù');
        1: ShowMessage(playerName + ' narazil do zelené dráhy');
      end;
    end;
  end; 

  // Kontrola kolize s tlaèítkem bonusu
  if PtInRect(Button3.BoundsRect, bod1) then
  begin
    Button3.Visible := False;
    playerCheckBox.State := cbChecked;
  end;             
end;

end.




