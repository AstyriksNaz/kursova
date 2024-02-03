program Project1;

uses
  Vcl.Forms,
  LogMenu in 'LogMenu.pas' {LogForm},
  SecondMenu in 'SecondMenu.pas' {SecondForm},
  LeadersMenu in 'LeadersMenu.pas' {LeadersForm},
  UniqueUnitMenu in 'UniqueUnitMenu.pas' {UniqueUnitForm},
  MapMenu in 'MapMenu.pas' {MapForm},
  WondersMenu in 'WondersMenu.pas' {WonderForm},
  UniqueDistrictsMenu in 'UniqueDistrictsMenu.pas' {UniqueDistrictsForm},
  ResourceMenu in 'ResourceMenu.pas' {ResourceForm},
  UnitsMenu in 'UnitsMenu.pas' {UnitsForm},
  DistrictMenu in 'DistrictMenu.pas' {DistrictForm},
  Unit1 in 'Unit1.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLogForm, LogForm);
  Application.CreateForm(TSecondForm, SecondForm);
  Application.CreateForm(TLeadersForm, LeadersForm);
  Application.CreateForm(TUniqueUnitForm, UniqueUnitForm);
  Application.CreateForm(TMapForm, MapForm);
  Application.CreateForm(TWonderForm, WonderForm);
  Application.CreateForm(TUniqueDistrictsForm, UniqueDistrictsForm);
  Application.CreateForm(TResourceForm, ResourceForm);
  Application.CreateForm(TUnitsForm, UnitsForm);
  Application.CreateForm(TDistrictForm, DistrictForm);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
