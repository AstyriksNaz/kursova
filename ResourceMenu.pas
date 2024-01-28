﻿unit ResourceMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TResourceForm = class(TForm)
    ButBack: TButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    BackGound: TImage;
    ResourceImg: TImage;
    ButPrev: TButton;
    ButNext: TButton;
    ResourceIDLabel: TLabel;
    Logo: TImage;
    ResourceID: TLabel;
    ResourceNameLabel: TLabel;
    ResourceName: TLabel;
    ResourceTypeLabel: TLabel;
    ResourceType: TLabel;
    ResourceLocationLabel: TLabel;
    ResourceMemoLocation: TMemo;
    LHead2: TLabel;
    ProductinLabel: TLabel;
    FoodLabel: TLabel;
    GoldLabel: TLabel;
    CultureLabel: TLabel;
    ScienceLabel: TLabel;
    FaintLabel: TLabel;
    Culture: TLabel;
    Science: TLabel;
    Faint: TLabel;
    Productin: TLabel;
    Food: TLabel;
    Gold: TLabel;
    LHead1: TLabel;
    ResourceImpLabel: TLabel;
    ResourceImp: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Sort: TComboBox;
    Label1: TLabel;
    Button1: TButton;
    clearBut: TButton;
    SortAscOrDesc: TCheckBox;
    procedure ButBackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButNextClick(Sender: TObject);
    procedure ButPrevClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure clearButClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ResourceForm: TResourceForm;

implementation

{$R *.dfm}

procedure TResourceForm.ButBackClick(Sender: TObject);
begin
close;
end;

procedure TResourceForm.ButNextClick(Sender: TObject);
begin
  // Перевіряємо, чи є наступний запис
  if not ADOQuery1.Eof then
  begin
    // Переходимо до наступного запису
    ADOQuery1.Next;

    // Перевіряємо, чи є наступний запис
    if not ADOQuery1.Eof then
    begin
      ResourceImg.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\Resources\' + ADOQuery1.FieldByName('ID').AsString + '.png');

      // Оновлюємо вміст міток та інших елементів за допомогою нових даних
      ResourceID.Caption := ADOQuery1.FieldByName('ID').AsString;
      ResourceName.Caption := ADOQuery1.FieldByName('Name').AsString;
      ResourceType.Caption := ADOQuery1.FieldByName('Type').AsString;
      ResourceImp.Caption := ADOQuery1.FieldByName('Improvement').AsString;
      ResourceMemoLocation.Clear;
      ResourceMemoLocation.Text := ADOQuery1.FieldByName('Found_in').AsString;
      Productin.Caption := ADOQuery1.FieldByName('Bonus_production').AsString;
      Gold.Caption := ADOQuery1.FieldByName('Bonus_gold').AsString;
      Food.Caption := ADOQuery1.FieldByName('Bonus_food').AsString;
      Culture.Caption := ADOQuery1.FieldByName('Bonus_culture').AsString;
      Faint.Caption := ADOQuery1.FieldByName('Bonus_faith').AsString;
      Science.Caption := ADOQuery1.FieldByName('Bonus_science').AsString;
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

procedure TResourceForm.ButPrevClick(Sender: TObject);
begin
  // Перевіряємо, чи є попередній запис
  if not ADOQuery1.Bof then
  begin
    // Переходимо до попереднього запису
    ADOQuery1.Prior;

    // Перевіряємо, чи є попередній запис
    if not ADOQuery1.Bof then
    begin
      ResourceImg.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\Resources\' + ADOQuery1.FieldByName('ID').AsString + '.png');

      // Оновлюємо вміст міток та інших елементів за допомогою нових даних
      ResourceID.Caption := ADOQuery1.FieldByName('ID').AsString;
      ResourceName.Caption := ADOQuery1.FieldByName('Name').AsString;
      ResourceType.Caption := ADOQuery1.FieldByName('Type').AsString;
      ResourceImp.Caption := ADOQuery1.FieldByName('Improvement').AsString;
      ResourceMemoLocation.Clear;
      ResourceMemoLocation.Text := ADOQuery1.FieldByName('Found_in').AsString;
      Productin.Caption := ADOQuery1.FieldByName('Bonus_production').AsString;
      Gold.Caption := ADOQuery1.FieldByName('Bonus_gold').AsString;
      Food.Caption := ADOQuery1.FieldByName('Bonus_food').AsString;
      Culture.Caption := ADOQuery1.FieldByName('Bonus_culture').AsString;
      Faint.Caption := ADOQuery1.FieldByName('Bonus_faith').AsString;
      Science.Caption := ADOQuery1.FieldByName('Bonus_science').AsString;
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


procedure TResourceForm.Button1Click(Sender: TObject);
var
s_sort: string;
categoriSort: string;
begin
if  SortASCorDESC.Checked then
  s_sort := 'DESC'
else
  s_sort := 'ASC';

case Sort.ItemIndex of
  0: categoriSort := 'ID';
  1: categoriSort := 'Name';
  2: categoriSort := 'Type';
  3: categoriSort := 'Improvement';
  4: categoriSort := 'Found_in';
  5: categoriSort := 'Bonus_production';
  6: categoriSort := 'Bonus_gold';
  7: categoriSort := 'Bonus_food';
  8: categoriSort := 'Bonus_culture';
  9: categoriSort := 'Bonus_faith';
  10: categoriSort := 'Bonus_science';
else
  categoriSort := ''; // або встановіть значення за замовчуванням
end;


  ADOQuery1.Active := false;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM Resource ORDER BY '+ categoriSort +' '+s_sort+';');
  ADOQuery1.Active := true;
  ADOQuery1.First;


ResourceImg.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\Resources\' + ADOQuery1.FieldByName('ID').AsString + '.png');
ResourceID.Caption := ADOQuery1.FieldByName('ID').AsString;
  ResourceName.Caption := ADOQuery1.FieldByName('Name').AsString;
  ResourceType.Caption := ADOQuery1.FieldByName('Type').AsString;
  ResourceImp.Caption := ADOQuery1.FieldByName('Improvement').AsString;
  ResourceMemoLocation.Clear;
  ResourceMemoLocation.Text := ADOQuery1.FieldByName('Found_in').AsString;
  Productin.Caption := ADOQuery1.FieldByName('Bonus_production').AsString;
  Gold.Caption := ADOQuery1.FieldByName('Bonus_gold').AsString;
  Food.Caption := ADOQuery1.FieldByName('Bonus_food').AsString;
  Culture.Caption := ADOQuery1.FieldByName('Bonus_culture').AsString;
  Faint.Caption := ADOQuery1.FieldByName('Bonus_faith').AsString;
  Science.Caption := ADOQuery1.FieldByName('Bonus_science').AsString;


end;

procedure TResourceForm.clearButClick(Sender: TObject);
begin
  Sort.Text := 'ID';
  ADOQuery1.Active := false;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM Resource ORDER BY ID ASC');
  ADOQuery1.Active := true;
  ADOQuery1.First;
  SortASCorDESC.Checked := false;
ResourceImg.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\Resources\' + ADOQuery1.FieldByName('ID').AsString + '.png');
ResourceID.Caption := ADOQuery1.FieldByName('ID').AsString;
  ResourceName.Caption := ADOQuery1.FieldByName('Name').AsString;
  ResourceType.Caption := ADOQuery1.FieldByName('Type').AsString;
  ResourceImp.Caption := ADOQuery1.FieldByName('Improvement').AsString;
  ResourceMemoLocation.Clear;
  ResourceMemoLocation.Text := ADOQuery1.FieldByName('Found_in').AsString;
  Productin.Caption := ADOQuery1.FieldByName('Bonus_production').AsString;
  Gold.Caption := ADOQuery1.FieldByName('Bonus_gold').AsString;
  Food.Caption := ADOQuery1.FieldByName('Bonus_food').AsString;
  Culture.Caption := ADOQuery1.FieldByName('Bonus_culture').AsString;
  Faint.Caption := ADOQuery1.FieldByName('Bonus_faith').AsString;
  Science.Caption := ADOQuery1.FieldByName('Bonus_science').AsString;
end;

procedure TResourceForm.FormCreate(Sender: TObject);
begin

ResourceImg.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\Resources\' + ADOQuery1.FieldByName('ID').AsString + '.png');
ResourceID.Caption := ADOQuery1.FieldByName('ID').AsString;
  ResourceName.Caption := ADOQuery1.FieldByName('Name').AsString;
  ResourceType.Caption := ADOQuery1.FieldByName('Type').AsString;
  ResourceImp.Caption := ADOQuery1.FieldByName('Improvement').AsString;
  ResourceMemoLocation.Clear;
  ResourceMemoLocation.Text := ADOQuery1.FieldByName('Found_in').AsString;
  Productin.Caption := ADOQuery1.FieldByName('Bonus_production').AsString;
  Gold.Caption := ADOQuery1.FieldByName('Bonus_gold').AsString;
  Food.Caption := ADOQuery1.FieldByName('Bonus_food').AsString;
  Culture.Caption := ADOQuery1.FieldByName('Bonus_culture').AsString;
  Faint.Caption := ADOQuery1.FieldByName('Bonus_faith').AsString;
  Science.Caption := ADOQuery1.FieldByName('Bonus_science').AsString;

end;

end.