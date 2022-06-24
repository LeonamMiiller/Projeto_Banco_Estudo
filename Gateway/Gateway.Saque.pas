unit Gateway.Saque;

interface

uses
  Intf.Connection;

type
  TSaqueGateway = class
  private
    FDBConnection: IDBConnection;
  public
    constructor Create(aDBConnection: IDBConnection);
    procedure Sacar(const aValor: double);
  end;

implementation

uses
  UseCase.SacarDinheiro,   Defs.Types, Gateway.Persistence;

{ TSaqueGateway }

constructor TSaqueGateway.Create(aDBConnection: IDBConnection);
begin
  FDBConnection := aDBConnection;
end;

procedure TSaqueGateway.Sacar(const aValor: double);
var
  PersistenceGateway: TPersistenceGateway;
  SaqueUseCase: TSacarDinheiroUseCase;
begin
  PersistenceGateway := TPersistenceGateway.Create(FDBConnection);

  SaqueUseCase := TSacarDinheiroUseCase.Create(PersistenceGateway);

  try
    SaqueUseCase.Execute(aValor);

  finally

    SaqueUseCase.Free;
  end;
end;

end.
