unit Gateway.Persistence;

interface

uses
  Intf.Persistence, Intf.Connection, Entity.Saque, FireDAC.Comp.Client,
  Entity.Pessoa, Entity.ContaBancaria;

type
  TPersistenceGateway = class(TInterfacedObject, IPersistence)
  private
    FDBConnection: IDBConnection;
  public

    constructor Create(aDBConnection: IDBConnection);
    procedure SalvarPessoa(aPessoa: TPessoa);
    procedure CarregarContaBancaria(aContaBancaria: TContaBancaria);
    procedure SalvarContaBancaria(aContaBancaria: TContaBancaria);
    procedure SalvarSaque(aContaBancaria: TContaBancaria);
    function ObterSaldo: double;
    function CarregarPessoa(aIDPessoa: Integer): TPessoa;

  end;

implementation

uses
  System.SysUtils;

{ TPersistenceGateway }
{
  procedure TPersistenceGateway.CarregarPessoa(aPessoa: TPessoa);
  begin
  ////
  end;
}
procedure TPersistenceGateway.SalvarPessoa(aPessoa: TPessoa);
var
  Comando: TStringBuilder;
begin
  Comando := TStringBuilder.Create;
  try
    Comando.Append('INSERT INTO PESSOA (NOME, RG, CPF, ENDERECO, GERENTE) ')
      .Append('VALUES (').Append(Format('%s, %d, %d, %s, %s',
      [QuotedStr(aPessoa.Nome), aPessoa.RG, aPessoa.CPF,
      QuotedStr(aPessoa.Endereco), QuotedStr(BoolToStr(aPessoa.Gerente, true))]))
      .Append(')');

    FDBConnection.Execute(Comando.ToString);

  finally
    Comando.Free;
  end;
end;

procedure TPersistenceGateway.CarregarContaBancaria(aContaBancaria
  : TContaBancaria);
begin
  /// /
end;

procedure TPersistenceGateway.SalvarContaBancaria(aContaBancaria
  : TContaBancaria);
var
  Comando: TStringBuilder;
begin
  Comando := TStringBuilder.Create;
  try
    Comando.Append('UPDATE Conta').Append(' SET Saldo = Saldo - ')
      .Append(aContaBancaria.SaldoAtual).Append(' WHERE ID = 1');

    FDBConnection.Execute(Comando.ToString);
  finally
    Comando.Free;
  end;
end;

procedure TPersistenceGateway.SalvarSaque(aContaBancaria: TContaBancaria);
var
  Comando: TStringBuilder;
begin
  Comando := TStringBuilder.Create;
  try
    Comando.Append('UPDATE Conta').Append(' SET Saldo = Saldo - ')
      .Append(aContaBancaria.SaldoAtual).Append(' WHERE ID = 1');

    FDBConnection.Execute(Comando.ToString);
  finally
    Comando.Free;
  end;
end;

constructor TPersistenceGateway.Create(aDBConnection: IDBConnection);
begin
  FDBConnection := aDBConnection;
end;

function TPersistenceGateway.ObterSaldo: double;
var
  Comando: TStringBuilder;
begin
  Comando := TStringBuilder.Create;
  try
    Comando.Append('SELECT Saldo FROM Conta');

    result := FDBConnection.GetValue(Comando.ToString);
  finally
    Comando.Free;
  end;
end;

function TPersistenceGateway.CarregarPessoa(aIDPessoa: Integer): TPessoa;
var
  Comando: TStringBuilder;
  QueryResult: TFDQuery;
  Pessoa: TPessoa;
begin
  Comando := TStringBuilder.Create;
  Pessoa := TPessoa.Create;
  try
  //  Comando.Append('SELECT * FROM Pessoa WHERE ID = ').Append(aIDPessoa);

    QueryResult :=  TFDQuery.Create(nil);
    QueryResult := FDBConnection.GetAllFields('SELECT * FROM Pessoa WHERE ID = 1');




    Pessoa.PessoaID := QueryResult.FieldByName('ID').AsInteger;
    Pessoa.Nome := QueryResult.FieldByName('Nome').AsString;
    Pessoa.RG := QueryResult.FieldByName('RG').AsInteger;
    Pessoa.CPF :=  QueryResult.FieldByName('CPF').AsInteger;
    Pessoa.Endereco :=  QueryResult.FieldByName('Endereco').AsString;
    Pessoa.Gerente := QueryResult.FieldByName('Gerente').AsBoolean;

    result := Pessoa;

  finally
    Comando.Free;
    QueryResult.Free;
  end;

end;

end.
