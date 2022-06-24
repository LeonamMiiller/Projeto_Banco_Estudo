unit UseCase.RealizarDeposito;

interface

uses
  Intf.Persistence, Entity.ContaBancaria;

type
  TRealizarDepositoUseCase = class
  private
    FPersistence: IPersistence;
    procedure Validate(const aDeposito: TContaBancaria);
  public
    constructor Create(aDepositoPersistence: IPersistence);
    procedure Execute(const aValor: double);
  end;

implementation

uses
  System.SysUtils;

{ TDepositoUseCase }

constructor TRealizarDepositoUseCase.Create(aDepositoPersistence: IPersistence);
begin
  FPersistence := aDepositoPersistence;
end;

procedure TRealizarDepositoUseCase.Execute(const aValor: double);
var
  Deposito: TContaBancaria;
begin
  Deposito := TContaBancaria.Create;
  try
    Deposito.SaldoAtual := aValor;

    Validate(Deposito);

    FPersistence.SalvarContaBancaria(Deposito);
  finally
    Deposito.Free;
  end;
end;


procedure TRealizarDepositoUseCase.Validate(const aDeposito: TContaBancaria);
begin
  if (aDeposito.SaldoAtual <= 0) or (aDeposito.SaldoAtual > 5000) then
    raise EArgumentException.Create('Informe um valor válido para o depósito.');
end;

end.
