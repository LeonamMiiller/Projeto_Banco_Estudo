unit UseCase.MovimentarPessoa;

interface

uses
  Intf.Persistence, Entity.Pessoa;

type
  TMovimentarPessoaUseCase = class
  private
    FPersistence: IPersistence;
    procedure Validate(const aPessoa: TPessoa);
  public
    constructor Create(aPessoaPersistence: IPersistence);
    procedure Criar(const Nome: String; RG: integer; CPF: integer;
      Endereco: String; Gerente: Boolean);
     function CarregarPessoa(aIDPessoa : Integer) : TPessoa;
  end;

implementation

uses
  System.SysUtils;

constructor TMovimentarPessoaUseCase.Create(aPessoaPersistence: IPersistence);
begin
  FPersistence := aPessoaPersistence;
end;

procedure TMovimentarPessoaUseCase.Criar(const Nome: String; RG: integer;
  CPF: integer; Endereco: String; Gerente: Boolean);
var
  Pessoa: TPessoa;
begin
  Pessoa := TPessoa.Create;

  try

    Pessoa.Nome := Nome;
    Pessoa.RG := RG;
    Pessoa.CPF := CPF;
    Pessoa.Endereco := Endereco;
    Pessoa.Gerente := Gerente;

      Validate(Pessoa);
    FPersistence.SalvarPessoa(Pessoa);

  finally
     Pessoa.Free;
  end;

end;


function TMovimentarPessoaUseCase.CarregarPessoa(aIDPessoa : Integer) : TPessoa;
begin
  Result := FPersistence.CarregarPessoa(aIDPessoa)
end;

procedure TMovimentarPessoaUseCase.Validate(const aPessoa: TPessoa);
begin
  if (aPessoa.Nome.IsEmpty) then
    raise EArgumentException.Create('Insira um nome para o cadastro.');

  if (aPessoa.RG.ToString.IsEmpty) then
    raise EArgumentException.Create('Insira um RG para o cadastro.');

  if (aPessoa.CPF.ToString.IsEmpty) then
    raise EArgumentException.Create('Insira um CPF para o cadastro.');

  if (aPessoa.Endereco.IsEmpty) then
    raise EArgumentException.Create('Insira um Endereco para o cadastro.');

end;

end.
