unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, TAIntervalSources;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    txt_Ib: TLabel;
    txt_Ie: TLabel;
    txt_Icsat: TLabel;
    txt_Vcecort: TLabel;
    txt_Vce: TLabel;
    Panel1: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  Vcc,R1,R2,Rc,Re: Real;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  txt_Ib.Visible:= False;
  txt_Ie.Visible:= False;
  txt_Vce.Visible:= False;
  txt_Icsat.Visible:= False;
  txt_Vcecort.Visible:= False;
  //Edit1.SetFocus;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  Edit1.SetFocus;
  //------------- visibilidad
  txt_Ib.Visible:= False;
  txt_Ie.Visible:= False;
  txt_Vce.Visible:= False;
  txt_Icsat.Visible:= False;
  txt_Vcecort.Visible:= False;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var I,Ib,Ie,Ve,Vb,Vc,Vce,Vceq,Icq,Icsat,Vcecort : Real;
    a,b,c,d,e: string;
begin
  //----------------------------------------------------------- Lectura de datos
  //----------------------------------------------------------------------------
  Vcc := StrToFloat(Edit1.Text);
  R1  := StrToFloat(Edit2.Text);
  R2  := StrToFloat(Edit4.Text);
  Rc  := StrToFloat(Edit3.Text);
  Re  := StrtoFloat(Edit5.Text);
  //----------------------------------------------------------------------------
  //------------------------------ cálculo de I, txt_Ib
  If ((R1+R2)>0) Then
  begin
       I := Vcc /(R1+R2);
       Ib := I / 20
  end;
  //------------------------------ cálculo de Vb
  Vb := I * R2;
  //------------------------------ cálculo de Ve
  Ve := Vb - 0.7;
  //------------------------------ cálculo de Ie, Ie Q
  If (Re>0) Then
  begin
       Ie := Ve / Re;
       Icq:= Ie
  end;
  //------------------------------ cálculo de Vc
  Vc := Vcc - Ie*Rc;
  //------------------------------ cálculo de Vce, Vce Q
  Vce := Vc - Ve;
  Vceq:= Vce;
  //------------------------------ cálculo de Ic saturación
  If (Rc>0) Then
     Icsat := (Vcc-Ve) / Rc;
  //------------------------------ cálculo Vce corte
  Vcecort := Vcc - Ve;

  //----------------------------------------------------------- Visble los Label
  txt_Ib.Visible:= True;
  txt_Ie.Visible:= True;
  txt_Vce.Visible:= True;
  txt_Icsat.Visible:= True;
  txt_Vcecort.Visible:= True;
  //------------------------------------------------------ Asignación de valores
  //----------------------------------------------------------------------------
  str(Ib:6:6,a);
  txt_Ib.Caption:= a + ' A';
  str(Icq:6:6,b);
  txt_Ie.Caption:= b + ' A';
  str(Vceq:1:1,c);
  txt_Vce.Caption:= c + ' V';
  str(Icsat:6:6,d);
  txt_Icsat.Caption:= d + ' A';
  str(Vcecort:1:1,e);
  txt_Vcecort.Caption:= e + ' V';
  //----------------------------------------------------------------------------
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  close;
end;

end.

