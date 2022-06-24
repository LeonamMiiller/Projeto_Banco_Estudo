unit Gateway.ContaBancaria;

interface
uses
  Intf.Connection;

type
  TContaBancariaGateway = class
  private
    FDBConnection: IDBConnection;
  public
    constructor Create(aDBConnection: IDBConnection);
    procedure Sacar(const aValor: double);
    procedure Depositar(const aValor: double);
  end;


implementation

uses
  UseCase.RealizarDeposito, Defs.Types, Gateway.Persistence;

{ TContaBancariaGateway }

constructor TContaBancariaGateway.Create(aDBConnection: IDBConnection);
begin
  FDBConnection := aDBConnection;
end;

procedure TContaBancariaGateway.Sacar(const aValor: double);
var
  PersistenceGateway: TPersistenceGateway;
  DepositoUseCase: TRealizarDepositoUseCase;
begin
  PersistenceGateway := TPersistenceGateway.Create(FDBConnection);

  DepositoUseCase := TRealizarDepositoUseCase.Create(PersistenceGateway);

  try
    DepositoUseCase.Execute(aValor);
  finally
    DepositoUseCase.Free;
  end;
end;


procedure TContaBancariaGateway.Depositar(const aValor: double);
var
  PersistenceGateway: TPersistenceGateway;
  DepositoUseCase: TRealizarDepositoUseCase;
begin
  PersistenceGateway := TPersistenceGateway.Create(FDBConnection);

  DepositoUseCase := TRealizarDepositoUseCase.Create(PersistenceGateway);

  try
    DepositoUseCase.Execute(aValor);
  finally
    DepositoUseCase.Free;
  end;
end;


end.
