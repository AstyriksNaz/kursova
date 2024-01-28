﻿unit SecondMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Imaging.jpeg, Vcl.ExtCtrls, LeadersMenu, Vcl.Imaging.pngimage,
  MapMenu, WondersMenu, ResourceMenu, UnitsMenu, DistrictMenu;
type
  TSecondForm = class(TForm)
    ButBack: TButton;
    SecondFormImg: TImage;
    ButLeaders: TButton;
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Image2: TImage;
    Button3: TButton;
    Image3: TImage;
    Button4: TButton;
    Button5: TButton;
    procedure ButBackClick(Sender: TObject);
    procedure ButLeadersClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SecondForm: TSecondForm;

implementation

{$R *.dfm}

procedure TSecondForm.ButBackClick(Sender: TObject);
begin
 Close;
end;

procedure TSecondForm.ButLeadersClick(Sender: TObject);
begin
Hide;
  // Створіть екземпляр форми "Лідери" і викличіть її
  LeadersMenu.LeadersForm := TLeadersForm.Create(Application);
  try
    LeadersMenu.LeadersForm.ShowModal;  // Використовуйте ShowModal, якщо вам потрібно модальне вікно
  finally
    // Важливо визвати Free, щоб уникнути витоку пам'яті
    LeadersMenu.LeadersForm.Free;
    Show; // Показати поточну форму знову після закриття "Лідерів"
  end;
end;

procedure TSecondForm.Button1Click(Sender: TObject);
begin

MapMenu.MapForm :=TMapForm.Create(Application);

try
  MapMenu.MapForm.ShowModal;
finally
MapMenu.MapForm.free;
Show;
end;
end;

procedure TSecondForm.Button2Click(Sender: TObject);
begin
Hide;

WondersMenu.WonderForm:=TWonderForm.Create(application);
try
  WondersMenu.WonderForm.ShowModal;
finally
WondersMenu.WonderForm.Free;
Show;
end;
end;

procedure TSecondForm.Button3Click(Sender: TObject);
begin
  Hide;
  ResourceMenu.ResourceForm := TResourceForm.Create(Application);
  try
    ResourceMenu.ResourceForm.ShowModal;
  finally
    ResourceMenu.ResourceForm.free;
    Show;
  end;
end;

procedure TSecondForm.Button4Click(Sender: TObject);
begin
  hide;

  UnitsMenu.UnitsForm:= TUnitsForm.Create(Application);
  Try
    UnitsMenu.UnitsForm.ShowModal;
  Finally
    UnitsMenu.UnitsForm.free;
    Show;
  End;
end;

procedure TSecondForm.Button5Click(Sender: TObject);
begin
hide;
DistrictMenu.DistrictForm:= TDistrictForm.Create(Application);
try
  DistrictMenu.DistrictForm.ShowModal;
finally
  DistrictMenu.DistrictForm.free;
  Show;
end;
end;

end.
