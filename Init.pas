unit Init;

interface

uses

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  THome = class(TForm)
    procedure FormDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure SacarDinheiro;
    procedure RealizarDeposito;
    procedure Depositar;
    procedure CadastrarPessoa;
  public
    { Public declarations }
  end;

var
  Home: THome;

implementation

{$R *.dfm}

uses
  Gateway.Saque, Gateway.Deposito, Gateway.ContaBancaria,
  Gateway.MovimentarPessoa, DatabaseConnection;

procedure THome.FormDblClick(Sender: TObject);
begin
  // RealizarDeposito;
  //Depositar;
  // SacarDinheiro;

  CadastrarPessoa;
end;

procedure THome.RealizarDeposito;
var
  DepositoGateway: TDepositoGateway;
  Valor: real;
begin
  DepositoGateway := TDepositoGateway.Create(TDBConnection.Create);
  try
    Valor := StrToFloatDef('14', 0);
    DepositoGateway.Depositar(Valor);
  finally
    DepositoGateway.Free;
  end;
end;

procedure THome.SacarDinheiro;
var
  SaqueGateway: TSaqueGateway;
  Valor: real;
begin
  SaqueGateway := TSaqueGateway.Create(TDBConnection.Create);
  try
    Valor := StrToFloatDef('12', 0);
    SaqueGateway.Sacar(Valor);
  finally
    SaqueGateway.Free;
  end;
end;

procedure THome.Depositar;
var
  ContaBancaria: TContaBancariaGateway;
  Valor: real;
begin
  ContaBancaria := TContaBancariaGateway.Create(TDBConnection.Create);
  try
    Valor := StrToFloatDef('14', 0);
    ContaBancaria.Depositar(Valor)
  finally
    ContaBancaria.Free;
  end;
end;

procedure THome.CadastrarPessoa;
var
  Nome, Endereco: String;
  RG, CPF: Integer;
  Gerente: Boolean;

  MovimentarPessoa: TMovimentarPessoaGateway;
begin

  MovimentarPessoa := TMovimentarPessoaGateway.Create(TDBConnection.Create);
  try

    Nome := 'Victoria';
    RG := 1234565;
    CPF := 116415299;
    Endereco := 'CASCAVEL';
    Gerente := True;
    MovimentarPessoa.Salvar(Nome, RG, CPF, Endereco, Gerente);

    MovimentarPessoa.Carregar(1);
    ShowMessage( MovimentarPessoa.Pessoa.Nome);
   {
   with MovimentarPessoa.Carregar(1) do
   begin
   Nome := Format('ID: %d, Nome: %s, RG: %d, CPF: %d, Endereco: %s', [PessoaID, Nome, RG, CPF, Endereco]);
      ShowMessageFmt('ID: %d, Nome: %s, RG: %d, CPF: %d, Endereco: %s', [PessoaID, Nome, RG, CPF, Endereco])
   end;
   ;
    }
  finally
    MovimentarPessoa.Free;
  end;




end;

end.
