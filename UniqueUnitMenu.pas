﻿unit UniqueUnitMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.Win.ADODB,
  Data.DB, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Imaging.jpeg;

type
  TUniqueUnitForm = class(TForm)
    ButBack: TButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    UNID: TLabel;
    UNName: TLabel;
    UnitName: TLabel;
    UNReplaced: TLabel;
    UnitReplaced: TLabel;
    UNType: TLabel;
    UnitType: TLabel;
    DamageImg: TImage;
    UNDamage: TLabel;
    UnitDamage: TLabel;
    UNProduction: TLabel;
    UnitProduction: TLabel;
    ProductionImg: TImage;
    BackGround: TImage;
    UnitID: TLabel;
    ImageUnit: TImage;
    constructor Create(AOwner: TComponent; const temp: String); // Змінив тип на String
    procedure ButBackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FTemp: String; // Змінив тип на String
    { Private declarations }
  public
    property Temp: String read FTemp; // Змінив тип на String
    { Public declarations }
  end;

var
  UniqueUnitForm: TUniqueUnitForm;

implementation

{$R *.dfm}

constructor TUniqueUnitForm.Create(AOwner: TComponent; const temp: String);
begin
  inherited Create(AOwner);
  FTemp := temp; // Зберігаємо значення temp при створенні об'єкта
end;

procedure TUniqueUnitForm.ButBackClick(Sender: TObject);
begin
  Close;
end;

procedure TUniqueUnitForm.FormCreate(Sender: TObject);
var
  Found: Boolean;
begin
  Found := False;

  // Перейти до першого запису
  ADOQuery1.First;

  // Пройти всі записи, щоб знайти потрібний
  while not ADOQuery1.Eof do
  begin
    if FTemp = ADOQuery1.FieldByName('Unique_Unit''s_name').AsString then
    begin
      Found := True;
      Break; // Знайшли потрібний запис, виходимо з циклу
    end;

    ADOQuery1.Next; // Перехід до наступного запису
  end;

  if Found then
  begin
    UnitID.Caption := FTemp; // Використовуйте значення temp у FormCreate
    UnitName.Caption := ADOQuery1.FieldByName('Unique_Unit''s_name').AsString;
    UnitReplaced.Caption := ADOQuery1.FieldByName('Replaced').AsString;
    UnitType.Caption := ADOQuery1.FieldByName('Type').AsString;
    UnitDamage.Caption := ADOQuery1.FieldByName('Damage').AsString;
    UnitProduction.Caption := ADOQuery1.FieldByName('Production_cost').AsString;

    ImageUnit.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\Units\UniqueUnits\' + ADOQuery1.FieldByName('ID').AsString + '.png');
  end
  else
  begin
    Close; // Закриваємо форму, оскільки запис не знайдено
  end;
end;

end.
