unit DistrictMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Data.DB, Data.Win.ADODB;

type
  TDistrictForm = class(TForm)
    ButBack: TButton;
    DistrictImg: TImage;
    Image1: TImage;
    DistrictNameLabel: TLabel;
    DistrictName: TLabel;
    Independent_buildingLabel: TLabel;
    Independent_building: TLabel;
    DistrictBonusLabel: TLabel;
    DistrictBonus: TLabel;
    DistrictProdCostLabel: TLabel;
    DistrictProdCost: TLabel;
    DistrictEraLabel: TLabel;
    DistrictEra: TLabel;
    ProductionLabel: TLabel;
    Production: TLabel;
    FoodLabel: TLabel;
    Food: TLabel;
    GoldLabel: TLabel;
    Gold: TLabel;
    CultureLabel: TLabel;
    Culture: TLabel;
    FaintLabel: TLabel;
    Faint: TLabel;
    DistrictBuildInLabel: TLabel;
    DistrictBuildIn: TLabel;
    ScienceLabel: TLabel;
    Science: TLabel;
    DistrictID: TLabel;
    HeadL2: TLabel;
    HeadL1: TLabel;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    ButPrev: TButton;
    ButNext: TButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    Image8: TImage;
    Button1: TButton;
    clearBut: TButton;
    Sort: TComboBox;
    Label1: TLabel;
    SortAscOrDesc: TCheckBox;
    procedure ButBackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButPrevClick(Sender: TObject);
    procedure ButNextClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure clearButClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DistrictForm: TDistrictForm;

implementation

{$R *.dfm}

procedure TDistrictForm.ButBackClick(Sender: TObject);
begin
close;
end;

procedure TDistrictForm.ButNextClick(Sender: TObject);
begin
     // Перевіряємо, чи є наступний запис
  if not ADOQuery1.Eof then
  begin
    // Переходимо до наступного запису
    ADOQuery1.Next;

 // Оновлюємо вміст міток та інших елементів за допомогою нових даних
  DistrictImg.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\Distritcs\' + ADOQuery1.FieldByName('ID').AsString + '.png');
  DistrictID.Caption := 'Айді района: '+ ADOQuery1.FieldByName('ID').AsString;
  DistrictName.Caption := ADOQuery1.FieldByName('District''s_name').AsString;

  if ADOQuery1.FieldByName('Independent_building').AsBoolean then
    Independent_building.Caption := 'Так, цей район самостійний'
    else
    Independent_building.Caption := 'Ні, ця будівля не самостійна';

  DistrictProdCost.Caption := ADOQuery1.FieldByName('Production_cost').AsString;
  DistrictBonus.Caption := ADOQuery1.FieldByName('Bonus:').AsString;
  DistrictEra.Caption := ADOQuery1.FieldByName('Era').AsString;
  Production.Caption := ADOQuery1.FieldByName('Bonus_production').AsString;
  Gold.Caption := ADOQuery1.FieldByName('Bonus_gold').AsString;
  Food.Caption := ADOQuery1.FieldByName('Bonus_food').AsString;
  Culture.Caption := ADOQuery1.FieldByName('Bonus_culture').AsString;
  Faint.Caption := ADOQuery1.FieldByName('Bonus_faith').AsString;
  Science.Caption := ADOQuery1.FieldByName('Bonus_science').AsString;

if ADOQuery1.FieldByName('Bulid_in').AsString = '' then
begin
   DistrictBuildInLabel.Hide;
  DistrictBuildIn.Hide;
end
else
begin
  DistrictBuildIn.Caption := ADOQuery1.FieldByName('Bulid_in').AsString;
  DistrictBuildIn.Show;
     DistrictBuildInLabel.show;
end;
  end
  else
  begin
    ShowMessage('Це останній запис.');
  end;
end;

procedure TDistrictForm.ButPrevClick(Sender: TObject);
begin
         // Перевіряємо, чи є попередній запис
  if not ADOQuery1.Bof then
  begin
    // Переходимо до попереднього запису
    ADOQuery1.Prior;

 // Оновлюємо вміст міток та інших елементів за допомогою нових даних
  DistrictImg.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\Distritcs\' + ADOQuery1.FieldByName('ID').AsString + '.png');
 DistrictID.Caption := 'Айді района: '+ ADOQuery1.FieldByName('ID').AsString;
  DistrictName.Caption := ADOQuery1.FieldByName('District''s_name').AsString;

  if ADOQuery1.FieldByName('Independent_building').AsBoolean then
    Independent_building.Caption := 'Так, цей район самостійний'
    else
    Independent_building.Caption := 'Ні, ця будівля не самостійна';

  DistrictProdCost.Caption := ADOQuery1.FieldByName('Production_cost').AsString;
  DistrictBonus.Caption := ADOQuery1.FieldByName('Bonus:').AsString;
  DistrictEra.Caption := ADOQuery1.FieldByName('Era').AsString;
  Production.Caption := ADOQuery1.FieldByName('Bonus_production').AsString;
  Gold.Caption := ADOQuery1.FieldByName('Bonus_gold').AsString;
  Food.Caption := ADOQuery1.FieldByName('Bonus_food').AsString;
  Culture.Caption := ADOQuery1.FieldByName('Bonus_culture').AsString;
  Faint.Caption := ADOQuery1.FieldByName('Bonus_faith').AsString;
  Science.Caption := ADOQuery1.FieldByName('Bonus_science').AsString;

if ADOQuery1.FieldByName('Bulid_in').AsString = '' then
begin
   DistrictBuildInLabel.Hide;
  DistrictBuildIn.Hide;
end
else
begin
  DistrictBuildIn.Caption := ADOQuery1.FieldByName('Bulid_in').AsString;
  DistrictBuildIn.Show;
     DistrictBuildInLabel.show;
end;
  end
  else
  begin
    ShowMessage('Це перший запис.');
  end;
end;

procedure TDistrictForm.Button1Click(Sender: TObject);
var
  s_sort: string;
  categoriSort: string;
begin

  if SortAscOrDesc.Checked then
   s_sort := 'DESC'
  else
      s_sort := 'ASC';

  case Sort.ItemIndex of
    0: categoriSort := 'ID';
    1: categoriSort := 'District''s_name';
    2: categoriSort := 'Independent_building';
    3: categoriSort := 'Bonus:';
    4: categoriSort := 'Production_cost';
    5: categoriSort := 'Era';
    6: categoriSort := 'Bonus_food';
    7: categoriSort := 'Bonus_production';
    8: categoriSort := 'Bonus_gold';
    9: categoriSort := 'Bonus_culture';
    10: categoriSort := 'Bonus_faith';
    11: categoriSort := 'Bonus_science';
    12: categoriSort := 'Bulid_in';
  else
    categoriSort := ''; // або встановіть значення за замовчуванням
  end;

  // Активуємо SQL запит для впорядкування
  ADOQuery1.Active := False;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM Districts ORDER BY ' + categoriSort + ' ' + s_sort);
  ADOQuery1.Active := True;
  ADOQuery1.First;

   // Оновлюємо вміст міток та інших елементів за допомогою нових даних
  DistrictImg.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\Distritcs\' + ADOQuery1.FieldByName('ID').AsString + '.png');
   DistrictID.Caption := 'Айді района: '+ ADOQuery1.FieldByName('ID').AsString;
  DistrictName.Caption := ADOQuery1.FieldByName('District''s_name').AsString;

  if ADOQuery1.FieldByName('Independent_building').AsBoolean then
    Independent_building.Caption := 'Так, цей район самостійний'
    else
    Independent_building.Caption := 'Ні, ця будівля не самостійна';

  DistrictProdCost.Caption := ADOQuery1.FieldByName('Production_cost').AsString;
  DistrictBonus.Caption := ADOQuery1.FieldByName('Bonus:').AsString;
  DistrictEra.Caption := ADOQuery1.FieldByName('Era').AsString;
  Production.Caption := ADOQuery1.FieldByName('Bonus_production').AsString;
  Gold.Caption := ADOQuery1.FieldByName('Bonus_gold').AsString;
  Food.Caption := ADOQuery1.FieldByName('Bonus_food').AsString;
  Culture.Caption := ADOQuery1.FieldByName('Bonus_culture').AsString;
  Faint.Caption := ADOQuery1.FieldByName('Bonus_faith').AsString;
  Science.Caption := ADOQuery1.FieldByName('Bonus_science').AsString;

if ADOQuery1.FieldByName('Bulid_in').AsString = '' then
begin
   DistrictBuildInLabel.Hide;
  DistrictBuildIn.Hide;
end
else
begin
  DistrictBuildIn.Caption := ADOQuery1.FieldByName('Bulid_in').AsString;
  DistrictBuildIn.Show;
     DistrictBuildInLabel.show;
end;

end;

procedure TDistrictForm.clearButClick(Sender: TObject);
begin
  Sort.ItemIndex := -1;
  ADOQuery1.Active := False;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM Districts ORDER BY ID ASC');
  ADOQuery1.Active := True;

                      // Оновлюємо вміст міток та інших елементів за допомогою нових даних
  DistrictImg.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\Distritcs\' + ADOQuery1.FieldByName('ID').AsString + '.png');
   DistrictID.Caption := 'Айді района: '+ ADOQuery1.FieldByName('ID').AsString;
  DistrictName.Caption := ADOQuery1.FieldByName('District''s_name').AsString;

  if ADOQuery1.FieldByName('Independent_building').AsBoolean then
    Independent_building.Caption := 'Так, цей район самостійний'
    else
    Independent_building.Caption := 'Ні, ця будівля не самостійна';

  DistrictProdCost.Caption := ADOQuery1.FieldByName('Production_cost').AsString;
  DistrictBonus.Caption := ADOQuery1.FieldByName('Bonus:').AsString;
  DistrictEra.Caption := ADOQuery1.FieldByName('Era').AsString;
  Production.Caption := ADOQuery1.FieldByName('Bonus_production').AsString;
  Gold.Caption := ADOQuery1.FieldByName('Bonus_gold').AsString;
  Food.Caption := ADOQuery1.FieldByName('Bonus_food').AsString;
  Culture.Caption := ADOQuery1.FieldByName('Bonus_culture').AsString;
  Faint.Caption := ADOQuery1.FieldByName('Bonus_faith').AsString;
  Science.Caption := ADOQuery1.FieldByName('Bonus_science').AsString;

if ADOQuery1.FieldByName('Bulid_in').AsString = '' then
begin
   DistrictBuildInLabel.Hide;
  DistrictBuildIn.Hide;
end
else
begin
  DistrictBuildIn.Caption := ADOQuery1.FieldByName('Bulid_in').AsString;
  DistrictBuildIn.Show;
     DistrictBuildInLabel.show;
end;

end;

procedure TDistrictForm.FormCreate(Sender: TObject);
begin

  // Оновлюємо вміст міток та інших елементів за допомогою нових даних
  DistrictImg.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\Distritcs\' + ADOQuery1.FieldByName('ID').AsString + '.png');
   DistrictID.Caption := 'Айді района: '+ ADOQuery1.FieldByName('ID').AsString;
  DistrictName.Caption := ADOQuery1.FieldByName('District''s_name').AsString;

  if ADOQuery1.FieldByName('Independent_building').AsBoolean then
    Independent_building.Caption := 'Так, цей район самостійний'
    else
    Independent_building.Caption := 'Ні, ця будівля не самостійна';

  DistrictProdCost.Caption := ADOQuery1.FieldByName('Production_cost').AsString;
  DistrictBonus.Caption := ADOQuery1.FieldByName('Bonus:').AsString;
  DistrictEra.Caption := ADOQuery1.FieldByName('Era').AsString;
  Production.Caption := ADOQuery1.FieldByName('Bonus_production').AsString;
  Gold.Caption := ADOQuery1.FieldByName('Bonus_gold').AsString;
  Food.Caption := ADOQuery1.FieldByName('Bonus_food').AsString;
  Culture.Caption := ADOQuery1.FieldByName('Bonus_culture').AsString;
  Faint.Caption := ADOQuery1.FieldByName('Bonus_faith').AsString;
  Science.Caption := ADOQuery1.FieldByName('Bonus_science').AsString;

if ADOQuery1.FieldByName('Bulid_in').AsString = '' then
begin
   DistrictBuildInLabel.Hide;
  DistrictBuildIn.Hide;
end
else
begin
  DistrictBuildIn.Caption := ADOQuery1.FieldByName('Bulid_in').AsString;
  DistrictBuildIn.Show;
     DistrictBuildInLabel.show;
end;

end;


end.
