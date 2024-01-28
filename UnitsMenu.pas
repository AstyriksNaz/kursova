unit UnitsMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TUnitsForm = class(TForm)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ButBack: TButton;
    UnitImage: TImage;
    ButNext: TButton;
    ButPrev: TButton;
    UnitIDLabel: TLabel;
    UnitID: TLabel;
    UnitNameLabel: TLabel;
    UnitName: TLabel;
    UnitTypeLabel: TLabel;
    UnitType: TLabel;
    UnitProdLabel: TLabel;
    UnitProd: TLabel;
    UnitEraLabel: TLabel;
    UnitEra: TLabel;
    UnitDamageLabel: TLabel;
    UnitDamage: TLabel;
    UnitRangelabel: TLabel;
    UnitRange: TLabel;
    UnitMovePointLabel: TLabel;
    UnitMovePoint: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Sort: TComboBox;
    Label1: TLabel;
    ButSort: TButton;
    CancelSort: TButton;
    SortAscOrDesc: TCheckBox;
    procedure ButBackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButNextClick(Sender: TObject);
    procedure ButPrevClick(Sender: TObject);
    procedure ButSortClick(Sender: TObject);
    procedure CancelSortClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UnitsForm: TUnitsForm;

implementation

{$R *.dfm}

procedure TUnitsForm.ButBackClick(Sender: TObject);
begin
close;
end;

procedure TUnitsForm.ButNextClick(Sender: TObject);
begin

  if not ADOQuery1.Eof then
  begin

    ADOQuery1.Next;


    if not ADOQuery1.Eof then
    begin

      UnitImage.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\Units\' + ADOQuery1.FieldByName('ID').AsString + '.png');
      UnitID.Caption := ADOQuery1.FieldByName('ID').AsString;
      UnitName.Caption := ADOQuery1.FieldByName('Unit''s_name').AsString;
      UnitType.Caption := ADOQuery1.FieldByName('Type').AsString;
      UnitProd.Caption := ADOQuery1.FieldByName('Production_cost').AsString;
      UnitEra.Caption := ADOQuery1.FieldByName('Era').AsString;
      UnitDamage.Caption := ADOQuery1.FieldByName('Damage').AsString;
      UnitRange.Caption := ADOQuery1.FieldByName('Attack_range').AsString;
      UnitMovePoint.Caption := ADOQuery1.FieldByName('Movement_points').AsString;
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


procedure TUnitsForm.ButPrevClick(Sender: TObject);
begin
  if not ADOQuery1.Bof then
  begin
    ADOQuery1.Prior;

    if not ADOQuery1.Bof then
    begin
      UnitImage.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\Units\' + ADOQuery1.FieldByName('ID').AsString + '.png');
      UnitID.Caption := ADOQuery1.FieldByName('ID').AsString;
      UnitName.Caption := ADOQuery1.FieldByName('Unit''s_name').AsString;
      UnitType.Caption := ADOQuery1.FieldByName('Type').AsString;
      UnitProd.Caption := ADOQuery1.FieldByName('Production_cost').AsString;
      UnitEra.Caption := ADOQuery1.FieldByName('Era').AsString;
      UnitDamage.Caption := ADOQuery1.FieldByName('Damage').AsString;
      UnitRange.Caption := ADOQuery1.FieldByName('Attack_range').AsString;
      UnitMovePoint.Caption := ADOQuery1.FieldByName('Movement_points').AsString;
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


procedure TUnitsForm.ButSortClick(Sender: TObject);
var
  s_sort: string;
  categoriSort: string;
begin
  // Визначаємо напрямок сортування (ASC або DESC) відповідно до вибору користувача
  if SortAscOrDesc.Checked then
   s_sort := 'DESC'
  else
      s_sort := 'ASC';

  // Визначаємо поле сортування відповідно до вибору користувача
  case Sort.ItemIndex of
    0: categoriSort := 'ID';
    1: categoriSort := 'Unit''s_name';
    2: categoriSort := 'Type';
    3: categoriSort := 'Production_cost';
    4: categoriSort := 'Era';
    5: categoriSort := 'Damage';
    6: categoriSort := 'Attack_range';
    7: categoriSort := 'Movement_points';
  else
    categoriSort := ''; // або встановіть значення за замовчуванням
  end;

  // Активуємо SQL запит для впорядкування
  ADOQuery1.Active := False;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM Units ORDER BY ' + categoriSort + ' ' + s_sort);
  ADOQuery1.Active := True;
  ADOQuery1.First;
  UnitImage.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\Units\' + ADOQuery1.FieldByName('ID').AsString + '.png');
      UnitID.Caption := ADOQuery1.FieldByName('ID').AsString;
      UnitName.Caption := ADOQuery1.FieldByName('Unit''s_name').AsString;
      UnitType.Caption := ADOQuery1.FieldByName('Type').AsString;
      UnitProd.Caption := ADOQuery1.FieldByName('Production_cost').AsString;
      UnitEra.Caption := ADOQuery1.FieldByName('Era').AsString;
      UnitDamage.Caption := ADOQuery1.FieldByName('Damage').AsString;
      UnitRange.Caption := ADOQuery1.FieldByName('Attack_range').AsString;
      UnitMovePoint.Caption := ADOQuery1.FieldByName('Movement_points').AsString;
end;

procedure TUnitsForm.CancelSortClick(Sender: TObject);
begin
  // Скасовуємо сортування та відображаємо дані у вихідному порядку
  Sort.ItemIndex := -1;
  ADOQuery1.Active := False;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('SELECT * FROM Units ORDER BY ID ASC');
  ADOQuery1.Active := True;

  SortAscOrDesc.Checked := false;
    ADOQuery1.First;
  UnitImage.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\Units\' + ADOQuery1.FieldByName('ID').AsString + '.png');
      UnitID.Caption := ADOQuery1.FieldByName('ID').AsString;
      UnitName.Caption := ADOQuery1.FieldByName('Unit''s_name').AsString;
      UnitType.Caption := ADOQuery1.FieldByName('Type').AsString;
      UnitProd.Caption := ADOQuery1.FieldByName('Production_cost').AsString;
      UnitEra.Caption := ADOQuery1.FieldByName('Era').AsString;
      UnitDamage.Caption := ADOQuery1.FieldByName('Damage').AsString;
      UnitRange.Caption := ADOQuery1.FieldByName('Attack_range').AsString;
      UnitMovePoint.Caption := ADOQuery1.FieldByName('Movement_points').AsString;
end;


procedure TUnitsForm.FormCreate(Sender: TObject);
begin
  UnitImage.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\Units\' + ADOQuery1.FieldByName('ID').AsString + '.png');
  UnitID.Caption := ADOQuery1.FieldByName('ID').AsString;
  UnitName.Caption := ADOQuery1.FieldByName('Unit''s_name').AsString;
  UnitType.Caption := ADOQuery1.FieldByName('Type').AsString;
  UnitProd.Caption := ADOQuery1.FieldByName('Production_cost').AsString;
  UnitEra.Caption := ADOQuery1.FieldByName('Era').AsString;
  UnitDamage.Caption := ADOQuery1.FieldByName('Damage').AsString;
  UnitRange.Caption := ADOQuery1.FieldByName('Attack_range').AsString;
  UnitMovePoint.Caption := ADOQuery1.FieldByName('Movement_points').AsString;
end;

end.
