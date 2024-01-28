﻿unit UniqueDistrictsMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TUniqueDistrictsForm = class(TForm)
    ButBack: TButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    BackGround: TImage;
    DistImg: TImage;
    ProductionImg: TImage;
    UDBonus: TLabel;
    UDID: TLabel;
    DistrictBomus: TLabel;
    DistrictID: TLabel;
    DistrictName: TLabel;
    DistrictProduction: TLabel;
    DistrictReplaced: TLabel;
    UDName: TLabel;
    UDProduction: TLabel;
    UDReplaced: TLabel;
    ShowAllTableBut: TButton;
    Label1: TLabel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    CloseTable: TButton;
    procedure ButBackClick(Sender: TObject);
    procedure ShowAllTableButClick(Sender: TObject);
    procedure CloseTableClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor CreateWithTemp(AOwner: TComponent; const ATemp: string);
  end;

var
  UniqueDistrictsForm: TUniqueDistrictsForm;
  temp: string; // Глобальна змінна для зберігання temp

implementation

{$R *.dfm}

constructor TUniqueDistrictsForm.CreateWithTemp(AOwner: TComponent; const ATemp: string);
begin
  inherited Create(AOwner);
  temp := ATemp; // Записуємо передане значення в глобальну змінну temp
end;

procedure TUniqueDistrictsForm.ButBackClick(Sender: TObject);
begin
  Close;
end;

procedure TUniqueDistrictsForm.CloseTableClick(Sender: TObject);
begin
  DBGrid1.Visible := False;
end;

procedure TUniqueDistrictsForm.FormCreate(Sender: TObject);
var
  Found: Boolean;
begin
  Found := False;

  // Перейти до першого запису
  ADOQuery1.First;

  // Пройти всі записи, щоб знайти потрібний
  while not ADOQuery1.Eof do
  begin
    if Temp = ADOQuery1.FieldByName('Unique_district''s_name').AsString then
    begin
      Found := True;
      Break; // Знайшли потрібний запис, виходимо з циклу
    end;

    ADOQuery1.Next; // Перехід до наступного запису
  end;

  if Found then
  begin
    DistrictID.Caption := ADOQuery1.FieldByName('ID').AsString;
    DistrictName.Caption := ADOQuery1.FieldByName('Unique_district''s_name').AsString;

    DistrictReplaced.Caption := ADOQuery1.FieldByName('Replaces').AsString;
    DistrictProduction.Caption := ADOQuery1.FieldByName('Production_cost').AsString;

    DistImg.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\Distritcs\UniqueDistrits\' + ADOQuery1.FieldByName('ID').AsString + '.png');
  end
  else
  begin
    Close; // Закриваємо форму, оскільки запис не знайдено
  end;

  DBGrid1.Columns[0].Width := 20;
    DBGrid1.Columns[1].Width := 100;
      DBGrid1.Columns[2].Width := 120;
        DBGrid1.Columns[3].Width := 120;
          DBGrid1.Columns[4].Width := 180;
            DBGrid1.Columns[5].Width := 100;
    DBGrid1.Columns[6].Width := 100;
end;

procedure TUniqueDistrictsForm.ShowAllTableButClick(Sender: TObject);
begin
  DBGrid1.Visible := True;
  CloseTable.Visible := true;
end;

end.

