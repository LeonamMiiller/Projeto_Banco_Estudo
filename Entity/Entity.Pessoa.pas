unit Entity.Pessoa;

interface

type
  TPessoa = class
  private
    FPessoaID : Integer;
    FNome: String;
    FRG: Integer;
    FCPF: Integer;
    FEndereco: String;
    FGerente: Boolean;
  public
    Property PessoaID : Integer read FPessoaID write FPessoaID;
    Property Nome: String read FNome write FNome;
    Property RG: Integer read FRG write FRG;
    Property CPF: Integer read FCPF write FCPF;
    property Endereco: String read FEndereco write FEndereco;
    Property Gerente: Boolean read FGerente write FGerente;
  end;

implementation

end.
