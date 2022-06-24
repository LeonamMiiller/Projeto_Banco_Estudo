program Banco;

uses
  Vcl.Forms,
  Init in 'Init.pas' {Home},
  DatabaseConnection in 'Infra\DatabaseConnection.pas',
  Intf.Connection in 'Gateway\Intf.Connection.pas',
  Defs.Types in 'Entity\Defs.Types.pas',
  Entity.Pessoa in 'Entity\Entity.Pessoa.pas',
  Entity.ContaBancaria in 'Entity\Entity.ContaBancaria.pas',
  Entity.Saque in 'Entity\Entity.Saque.pas',
  Entity.Deposito in 'Entity\Entity.Deposito.pas',
  Gateway.Deposito in 'Gateway\Gateway.Deposito.pas',
  Gateway.Persistence in 'Gateway\Gateway.Persistence.pas',
  Gateway.ContaBancaria in 'Gateway\Gateway.ContaBancaria.pas',
  Gateway.Saque in 'Gateway\Gateway.Saque.pas',
  Intf.Persistence in 'UseCase\Intf.Persistence.pas',
  UseCase.RealizarDeposito in 'UseCase\UseCase.RealizarDeposito.pas',
  UseCase.SacarDinheiro in 'UseCase\UseCase.SacarDinheiro.pas',
  UseCase.MovimentarPessoa in 'UseCase\UseCase.MovimentarPessoa.pas',
  Gateway.MovimentarPessoa in 'Gateway\Gateway.MovimentarPessoa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(THome, Home);
  Application.Run;
end.
