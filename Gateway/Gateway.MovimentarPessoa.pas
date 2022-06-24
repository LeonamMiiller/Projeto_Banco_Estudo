unit Gateway.MovimentarPessoa;

interface

uses
  Intf.Connection, Entity.Pessoa;

type
  TMovimentarPessoaGateway = class
  private
    FDBConnection: IDBConnection;

  public
      Pessoa : TPessoa;
    constructor Create(aDBConnection: IDBConnection);
    procedure Salvar(const Nome: String; RG: integer; CPF: integer;
      Endereco: String; Gerente: Boolean);
    Function Carregar(aIDPessoa: integer): TPessoa;
  end;

implementation

uses
  UseCase.MovimentarPessoa, Gateway.Persistence;

constructor TMovimentarPessoaGateway.Create(aDBConnection: IDBConnection);
begin
  FDBConnection := aDBConnection;
  Pessoa := TPessoa.Create;
end;

procedure TMovimentarPessoaGateway.Salvar(const Nome: String; RG: integer;
  CPF: integer; Endereco: String; Gerente: Boolean);
var
  PersistenceGateway: TPersistenceGateway;
  PessoaUseCase: TMovimentarPessoaUseCase;
begin
  PersistenceGateway := TPersistenceGateway.Create(FDBConnection);

  PessoaUseCase := TMovimentarPessoaUseCase.Create(PersistenceGateway);

  try
    PessoaUseCase.Criar(Nome, RG, CPF, Endereco, Gerente);
  finally
    PessoaUseCase.Free;
  end;
end;

function TMovimentarPessoaGateway.Carregar(aIDPessoa: integer): TPessoa;
var
  PersistenceGateway: TPersistenceGateway;
  PessoaUseCase: TMovimentarPessoaUseCase;
begin
  try
    PersistenceGateway := TPersistenceGateway.Create(FDBConnection);

    PessoaUseCase := TMovimentarPessoaUseCase.Create(PersistenceGateway);
    Pessoa := PessoaUseCase.CarregarPessoa(aIDPessoa);

  finally
  //  PersistenceGateway.Free;
    PessoaUseCase.Free;
  end;

end;

end.
