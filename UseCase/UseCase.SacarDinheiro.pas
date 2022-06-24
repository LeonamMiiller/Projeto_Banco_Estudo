unit UseCase.SacarDinheiro;

interface

uses
  Intf.Persistence, Entity.ContaBancaria;

type
  TSacarDinheiroUseCase = class
  private
    FPersistence: IPersistence;
    procedure Validate(const aSaque: TContaBancaria);
  public
    constructor Create(aSaquePersistence: IPersistence);
    procedure Execute(const aValor: double);
  end;

implementation

uses
  System.SysUtils;

{ TSaqueUseCase }

constructor TSacarDinheiroUseCase.Create(aSaquePersistence: IPersistence);
begin
  FPersistence := aSaquePersistence;
end;

procedure TSacarDinheiroUseCase.Execute(const aValor: double);
var
  Saque: TContaBancaria;
begin
  Saque := TContaBancaria.Create;
  try
    Saque.SaldoAtual := aValor;

    Validate(Saque);

    FPersistence.SalvarSaque(Saque);
  finally
    Saque.Free;
  end;
end;

procedure TSacarDinheiroUseCase.Validate(const aSaque: TContaBancaria);
begin
  if aSaque.SaldoAtual <= 0 then
    raise EArgumentException.Create('Informe um valor válido para o saque.');

  if FPersistence.ObterSaldo < aSaque.SaldoAtual then
    raise EInvalidOp.Create('Não há saldo suficiente para este saque.');
end;

end.
