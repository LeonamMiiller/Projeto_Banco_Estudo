unit Intf.Persistence;

interface

uses
  Entity.Saque, Entity.Pessoa, Entity.ContaBancaria;

type
  IPersistence = interface
 //   procedure CarregarPessoa(aPessoa : TPessoa);
    procedure SalvarPessoa(aPessoa : TPessoa);
    procedure CarregarContaBancaria(aContaBancaria : TContaBancaria);
    procedure SalvarContaBancaria(aContaBancaria : TContaBancaria);
    procedure SalvarSaque(aContaBancaria: TContaBancaria);
    function ObterSaldo: double;
    function CarregarPessoa(aIDPessoa : Integer) : TPessoa;

  end;

implementation

end.
