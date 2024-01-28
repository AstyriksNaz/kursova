unit LogMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Imaging.jpeg, SecondMenu, Vcl.Imaging.pngimage;

type
  TLogForm = class(TForm)
    LogMenuImg1: TImage;
    ToCloseBitBtn: TBitBtn;
    ButToContinue: TButton;
    Image1: TImage;
    procedure ButToContinueClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LogForm: TLogForm;

implementation

{$R *.dfm}

procedure TLogForm.ButToContinueClick(Sender: TObject);
begin
  // Закрийте поточну форму

  // Створіть екземпляр другої форми і викличіть її
  SecondMenu.SecondForm := TSecondForm.Create(Application);
  try
    SecondMenu.SecondForm.ShowModal;  // Використовуйте ShowModal, якщо вам потрібно модальне вікно
  finally
    // Важливо визвати Free, щоб уникнути витоку пам'яті
    SecondMenu.SecondForm.Free;
    LogForm.Show; // Показати або може бути LogForm.ShowModal() залежно від вашого бажання
  end;
end;

end.

