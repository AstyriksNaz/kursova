﻿unit MapMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.ExtCtrls, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TMapForm = class(TForm)
    ButBack: TButton;
    ADOConnection1: TADOConnection;
    MapNameLabel: TLabel;
    MapName: TLabel;
    NeedMovPointLabel: TLabel;
    MovePoint: TLabel;
    GetFoodLabel: TLabel;
    GetFood: TLabel;
    GetProductionLabel: TLabel;
    GetProduction: TLabel;
    GetGoldLabel: TLabel;
    GetGold: TLabel;
    InfoLabel: TLabel;
    MapImage: TImage;
    ButNext: TButton;
    ButPrev: TButton;
    MovePointImg: TImage;
    FoodImg: TImage;
    ProductionImg: TImage;
    GoldImg: TImage;
    Background: TImage;
    ModifierLabel: TLabel;
    Modifier: TLabel;
    ADOQuery1: TADOQuery;
    procedure ButBackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButNextClick(Sender: TObject);
    procedure ButPrevClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MapForm: TMapForm;
  temp_str: string;

implementation

{$R *.dfm}

procedure TMapForm.ButBackClick(Sender: TObject);
begin
close;
end;

procedure TMapForm.ButNextClick(Sender: TObject);
begin
  if not ADOQuery1.Eof then
  begin
    // Переходимо до наступного запису
    ADOQuery1.Next;

    // Перевіряємо, чи є наступний запис
    if not ADOQuery1.Eof then
    begin

      MapImage.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\MapImg\' + ADOQuery1.FieldByName('ID').AsString + '.png');

      // Оновлюємо вміст міток та інших елементів за допомогою нових даних
      MapName.Caption := ADOQuery1.FieldByName('Location''s_name').AsString;
      MovePoint.Caption := ADOQuery1.FieldByName('Need_movement_points').AsString;
      GetFood.Caption := ADOQuery1.FieldByName('Base_Yield_by_food').AsString;
      GetProduction.Caption := ADOQuery1.FieldByName('Base_Yield_by_production').AsString;
      GetGold.Caption := ADOQuery1.FieldByName('Base_Yield_by_gold').AsString;

      temp_str := ADOQuery1.FieldByName('Modifier').AsString;
    if temp_str = 'False' then
begin
Modifier.Caption:= 'Ні, це поле самостійне';
end
else
begin
  Modifier.Caption:= 'Так, це поле не самостійне';
end;
    end
    else
    begin
      ShowMessage('Це останній запис.');
    end;
  end
  else
  begin
    ShowMessage('Немає даних у ADOQuery1.');
  end;

end;

procedure TMapForm.ButPrevClick(Sender: TObject);
begin
  // Перевіряємо, чи є попередній запис
  if not ADOQuery1.Bof then
  begin
    // Переходимо до попереднього запису
    ADOQuery1.Prior;

    // Перевіряємо, чи є попередній запис
    if not ADOQuery1.Bof then
    begin

      MapImage.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\MapImg\' + ADOQuery1.FieldByName('ID').AsString + '.png');

      // Оновлюємо вміст міток та інших елементів за допомогою нових даних
      MapName.Caption := ADOQuery1.FieldByName('Location''s_name').AsString;
      MovePoint.Caption := ADOQuery1.FieldByName('Need_movement_points').AsString;
      GetFood.Caption := ADOQuery1.FieldByName('Base_Yield_by_food').AsString;
      GetProduction.Caption := ADOQuery1.FieldByName('Base_Yield_by_production').AsString;
      GetGold.Caption := ADOQuery1.FieldByName('Base_Yield_by_gold').AsString;
      temp_str := ADOQuery1.FieldByName('Modifier').AsString;
    if temp_str = 'False' then
begin
Modifier.Caption:= 'Ні, це поле самостійне';
end
else
begin
  Modifier.Caption:= 'Так, це поле не самостійне';
end;
    end
    else
    begin
      ShowMessage('Це перший запис.');
    end;
  end
  else
  begin
    ShowMessage('Це перший запис.');
  end;

end;

procedure TMapForm.FormCreate(Sender: TObject);
begin

MapImage.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\MapImg\' + ADOQuery1.FieldByName('ID').AsString + '.png');

MapName.Caption := ADOQuery1.FieldByName('Location''s_name').AsString;

MovePoint.Caption := ADOQuery1.FieldByName('Need_movement_points').AsString;
GetFood.Caption :=ADOQuery1.FieldByName('Base_Yield_by_food').AsString;
GetProduction.Caption := ADOQuery1.FieldByName('Base_Yield_by_production').AsString;
GetGold.Caption := ADOQuery1.FieldByName('Base_Yield_by_gold').AsString;

temp_str := ADOQuery1.FieldByName('Modifier').AsString;

    if temp_str = 'False' then
begin
Modifier.Caption:= 'Ні, це поле самостійне';
end
else
begin
  Modifier.Caption:= 'Так, це поле не самостійне';
end;

end;

end.
