unit Gateway.Deposito;

interface

uses
  Intf.Connection;

type
  TDepositoGateway = class
  private
    FDBConnection: IDBConnection;
  public
    constructor Create(aDBConnection: IDBConnection);
    procedure Depositar(const aValor: double);
  end;

implementation

uses
  UseCase.RealizarDeposito, Defs.Types, Gateway.Persistence;

{ TSaqueGateway }

constructor TDepositoGateway.Create(aDBConnection: IDBConnection);
begin
  FDBConnection := aDBConnection;
end;

procedure TDepositoGateway.Depositar(const aValor: double);
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
