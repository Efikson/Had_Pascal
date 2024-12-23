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
    procedure kontroluj (Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure UpdatePlayer(var X, Y: Integer; var angle: Real; LControl, RControl: Boolean; color: TColor);
    procedure InicializujHru;
    procedure ResetHry(hrac: Integer);
  public
    X1, X2, Y1, Y2 : Integer;
    angle1, angle2: Real;
    L1, R1, L2, R2 : Boolean;
  end;

var
  Form1: TForm1;
implementation

uses Unit2;

{$R *.dfm}

////////////////////////
// Vykreslování hráèù //
procedure TForm1.UpdatePlayer(var X, Y: Integer; var angle: Real; LControl, RControl: Boolean; color: TColor);
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
  kontroluj(Sender);
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

procedure TForm1.Button1Click(Sender: TObject);
begin
 InicializujHru;
end;

// Spuštìní prvního kola
procedure TForm1.FormShow(Sender: TObject);
begin
 edit1.Text:= '0';
 edit2.Text:= '0';
 label5.Caption:=hrac1;
 label6.Caption:=hrac2;
 label8.Caption:= 'Limit vyhraných kol = ' + INTTOSTR(PocetKol);

 InicializujHru;  
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
  angle1:= random (7);
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

procedure TForm1.Button2Click(Sender: TObject);
begin
form1.hide;
form2.Show;
end;

// Zastavení a reset hry po kolizi
procedure TForm1.ResetHry(hrac: Integer);
begin
  case hrac of
  1: edit2.Text := INTTOSTR(STRTOINT(edit2.Text) + 1);
  2: edit1.Text := INTTOSTR(STRTOINT(edit1.Text) + 1);
  end;
timer1.Enabled := false;
timer2.Enabled := false;
label3.Visible := true;
label3.Top := trunc(image1.Height / 2) - 20;
label3.Left := trunc(image1.Width / 2) - 160;
label3.Font.Size := 20;
label3.Caption := 'Pro nové kolo stiskni ENTER';
button1.Enabled := true;
button2.Enabled := true;  
end;   

/////////////////////
// Kontrola kolizí //
procedure TForm1.kontroluj(Sender: TObject);
var
mess : integer;
bod, bod1: TPoint;
begin
//kolize pro hráèe 1
bod1.X:=Round(X1+(TloutkaCary*3/4)*cos(angle1));
bod1.Y:=Round(Y1+(TloutkaCary*3/4)*sin(angle1));

case image1.Canvas.Pixels[bod1.X, bod1.Y] of
  clRed: begin
    ResetHry(1);
    mess := random(2);
    case mess of
      0: Showmessage(label5.caption + ' ochutnal sám sebe');
      1: Showmessage(label5.caption + ' narazil do svoji dráhy');
    end;
  end;
  clBlue: begin
    ResetHry(1);
    mess := random(2);
    case mess of
      0: Showmessage(label5.caption + ' se nechal napálit');
      1: Showmessage(label5.caption + ' narazil do modré dráhy');
    end;

  end;
  ClGreen: begin
    ResetHry(1);
    mess := random(2);
    case mess of
      0: Showmessage(label5.caption + ' chtìl vyjet do windowsù');
      1: Showmessage(label5.caption + ' narazil do zelené dráhy');
    end;
  end;
end;  


  //kolize s tlaèítkem bonusu
  bod.X:=Round(X1+(TloutkaCary*3/4)*cos(angle1));
  bod.y:=Round(Y1+(TloutkaCary*3/4)*sin(angle1));
  IF Ptinrect(button3.BoundsRect,bod) THEN
  begin
  button3.visible:=false;
  checkbox1.State:=cbchecked;
  end;

  bod.X:=Round(X2+(TloutkaCary*3/4)*cos(angle2));
  bod.y:=Round(Y2+(TloutkaCary*3/4)*sin(angle2));
  IF Ptinrect(button3.BoundsRect,bod) THEN
  begin
  button3.visible:=false;
  checkbox2.State:=cbchecked;
  end;  

  IF edit1.Text=INTTOSTR(PocetKol) THEN
  begin     
  showmessage(label5.caption + ' zvítìzil');
  button1.enabled:=false;
  end;

  IF edit2.Text=INTTOSTR(PocetKol) THEN
  begin
  showmessage(label6.caption + ' zvítìzil');
  button1.enabled:=false;
  end;
  
end;

end.




