unit WondersMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg;

type
  TWonderForm = class(TForm)
    ADOConnection1: TADOConnection;
    WondersImage: TImage;
    WondersIDLabel: TLabel;
    WondersNameLabel: TLabel;
    WondersID: TLabel;
    WondersName: TLabel;
    WondersLocationLabel: TLabel;
    WondersLocation: TLabel;
    WondersBonusLabel: TLabel;
    WondersBonusMemo: TMemo;
    WondersPasibilityLabel: TLabel;
    WondersPasibility: TLabel;
    WondersSizeLabel: TLabel;
    WondersSize: TLabel;
    ButBack: TButton;
    HeadImg: TImage;
    SecondImg: TImage;
    ButNext: TButton;
    ButPrev: TButton;
    BackGround: TImage;
    WondersPlacementMemo: TMemo;
    WondersPlacementLabel: TLabel;
    RadioGroup1: TRadioGroup;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    WondersProductionCostLabel: TLabel;
    WondersProductionCost: TLabel;
    WondersProductionCostImg: TImage;
    procedure FormCreate(Sender: TObject);
    procedure ButBackClick(Sender: TObject);
    procedure ButPrevClick(Sender: TObject);
    procedure ButNextClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WonderForm: TWonderForm;
  s_temp: String;

implementation

{$R *.dfm}

procedure TWonderForm.ButBackClick(Sender: TObject);
begin
close;
end;

procedure TWonderForm.ButNextClick(Sender: TObject);
begin
  if s_temp = 'Wonders_of_Nature' then
  begin
    // Перевіряємо, чи є наступний запис в ADOQuery1
    if not ADOQuery1.Eof then
    begin
      // Переходимо до наступного запису в ADOQuery1
      ADOQuery1.Next;

      // Перевіряємо, чи є наступний запис в ADOQuery1
      if not ADOQuery1.Eof then
      begin
        WondersImage.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\'+s_temp+'\' + ADOQuery1.FieldByName('ID').AsString + '.png');

        // Оновлюємо вміст міток та інших елементів за допомогою нових даних з ADOQuery1
        WondersID.Caption := ADOQuery1.FieldByName('ID').AsString;
        WondersName.Caption := ADOQuery1.FieldByName('Wonder''s_name(nature)').AsString;
        WondersLocation.Caption := ADOQuery1.FieldByName('Location').AsString;
        WondersBonusMemo.Clear;
        WondersBonusMemo.Text := ADOQuery1.FieldByName('Bonus').AsString;
        WondersSize.Caption := ADOQuery1.FieldByName('Size').AsString;
        WondersPasibility.Caption := ADOQuery1.FieldByName('Pasibility').AsString;
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
  end
  else
  begin
    // Перевіряємо, чи є наступний запис у другому ADOQuery2
    if not ADOQuery2.Eof then
    begin
      // Переходимо до наступного запису в ADOQuery2
      ADOQuery2.Next;

      // Перевіряємо, чи є наступний запис в ADOQuery2
      if not ADOQuery2.Eof then
      begin
        WondersImage.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\'+s_temp+'\' + ADOQuery1.FieldByName('ID').AsString + '.png');

        // Оновлюємо вміст міток та інших елементів за допомогою нових даних з ADOQuery2
        WondersID.Caption := ADOQuery2.FieldByName('ID').AsString;
        WondersName.Caption := ADOQuery2.FieldByName('Wonder''s_name').AsString;
        WondersBonusMemo.Clear;
        WondersBonusMemo.Text := ADOQuery2.FieldByName('Effects').AsString;
        WondersPlacementMemo.Clear;
        WondersPlacementMemo.Text := ADOQuery2.FieldByName('Placement').AsString;
        WondersProductionCost.Caption := ADOQuery2.FieldByName('Production_cost').asString;
      end
      else
      begin
        ShowMessage('Це останній запис.');
      end;
    end
    else
    begin
      ShowMessage('Немає даних у ADOQuery2.');
    end;
  end;
end;


procedure TWonderForm.ButPrevClick(Sender: TObject);
begin
if s_temp = 'Wonders_of_Nature' then
begin
        // Перевіряємо, чи є попередній запис
  if not ADOQuery1.Bof then
  begin
    // Переходимо до попереднього запису
    ADOQuery1.Prior;

    // Перевіряємо, чи є попередній запис
    if not ADOQuery1.Bof then
    begin
      WondersImage.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\'+s_temp+'\' + ADOQuery1.FieldByName('ID').AsString + '.png');

      // Оновлюємо вміст міток та інших елементів за допомогою нових даних
      WondersID.Caption := ADOQuery1.FieldByName('ID').AsString;
      WondersName.Caption := ADOQuery1.FieldByName('Wonder''s_name(nature)').AsString;
      WondersLocation.Caption := ADOQuery1.FieldByName('Location').AsString;
      WondersBonusMemo.Clear;
      WondersBonusMemo.Text := ADOQuery1.FieldByName('Bonus').AsString;
      WondersSize.Caption := ADOQuery1.FieldByName('Size').AsString;
      WondersPasibility.Caption := ADOQuery1.FieldByName('Pasibility').AsString;
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
end
else
begin

if not ADOQuery2.Bof then
  begin
    // Переходимо до попереднього запису
    ADOQuery2.Prior;

    // Перевіряємо, чи є попередній запис
    if not ADOQuery2.Bof then
    begin
      WondersImage.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\'+s_temp+'\' + ADOQuery1.FieldByName('ID').AsString + '.png');

      WondersID.Caption := ADOQuery2.FieldByName('ID').AsString;
      WondersName.Caption := ADOQuery2.FieldByName('Wonder''s_name').AsString;
       WondersBonusMemo.Clear;
      WondersBonusMemo.Text := ADOQuery2.FieldByName('Effects').AsString;
      WondersPlacementMemo.clear;
      WondersPlacementMemo.text := ADOQuery2.FieldByName('Placement').AsString;
      WondersProductionCost.Caption := ADOQuery2.FieldByName('Production_cost').asString;
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
end;



procedure TWonderForm.FormCreate(Sender: TObject);
begin

s_temp := 'Wonders_of_Nature';
WondersImage.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\'+s_temp+'\' + ADOQuery1.FieldByName('ID').AsString + '.png');
WondersID.Caption:= ADOQuery1.FieldByName('ID').AsString;
WondersName.Caption := ADOQuery1.FieldByName('Wonder''s_name(nature)').AsString;
WondersLocation.Caption := ADOQuery1.FieldByName('Location').AsString;
WondersBonusMemo.clear;
WondersBonusMemo.text := ADOQuery1.FieldByName('Bonus').AsString;
WondersSize.Caption := ADOQuery1.FieldByName('Size').AsString;

WondersPasibility.Caption := ADOQuery1.FieldByName('Pasibility').AsString;
end;

procedure TWonderForm.RadioGroup1Click(Sender: TObject);
begin
 case RadioGroup1.ItemIndex of
    0: // Wonders_of_World
    begin
    ADOQuery1.First;
    ADOQuery2.First;
      s_temp := 'Wonders_of_World';
      SecondImg.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\WorldImg.png');
      WondersLocationLabel.Hide;
      WondersLocation.Hide;
      WondersPasibilityLabel.Hide;
      WondersPasibility.Hide;
      WondersSizeLabel.Hide;
      WondersSize.Hide;

      WondersProductionCostImg.Show;
      WondersProductionCostLabel.Show;
      WondersProductionCost.Show;
      WondersProductionCost.Caption := '';
      WondersPlacementLabel.Show;
      WondersPlacementMemo.Show;
      WondersBonusLabel.Top := 230;
      WondersBonusMemo.Top := 230;

    end;

    1: // Wonders_of_Nature
    begin
     ADOQuery1.First;
    ADOQuery2.First;
      s_temp := 'Wonders_of_Nature';
      SecondImg.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\NatureImg.png');

      WondersLocationLabel.Visible := True;
      WondersLocation.Visible := True;
      WondersPasibilityLabel.Visible := True;
      WondersPasibility.Visible := True;
      WondersSizeLabel.Visible := True;
      WondersSize.Visible := True;

      WondersProductionCostImg.Hide;
      WondersProductionCostLabel.Hide;
      WondersProductionCost.Hide;
      WondersPlacementLabel.Visible := False;
      WondersPlacementMemo.Visible := False;

      WondersBonusLabel.Top := 350;
      WondersBonusMemo.Top := 350;

    end;
  end;
        WondersImage.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\..\img\'+s_temp+'\' + ADOQuery1.FieldByName('ID').AsString + '.png');

      WondersID.Caption := ADOQuery2.FieldByName('ID').AsString;
      WondersName.Caption := ADOQuery2.FieldByName('Wonder''s_name').AsString;
       WondersBonusMemo.Clear;
      WondersBonusMemo.Text := ADOQuery2.FieldByName('Effects').AsString;
      WondersPlacementMemo.clear;
      WondersPlacementMemo.text := ADOQuery2.FieldByName('Placement').AsString;
      WondersProductionCost.Caption := ADOQuery2.FieldByName('Production_cost').asString;
end;

end.
