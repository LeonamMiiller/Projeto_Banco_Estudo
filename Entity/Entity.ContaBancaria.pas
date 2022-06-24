unit Entity.ContaBancaria;

interface
  type
    TContaBancaria = class
      private
         FCliente : Integer;
         FNumeroConta : Integer;
         FSaldoAtual : double;
         FContaAtiva : Boolean;
         FSenhaConta : String;
         FContaCorrente : Boolean;

      public

        Property Cliente : Integer read FCliente write FCliente;
        Property NumeroConta : Integer read FNumeroConta write FNumeroConta;
        Property SaldoAtual: double read FSaldoAtual write FSaldoAtual;
        Property ContaAtiva : Boolean read FContaAtiva write FContaAtiva;
        Property SenhaConta : String read FSenhaConta write FSenhaConta;
        Property ContaCorrente : Boolean read FContaCorrente write FContaCorrente;
    end;



implementation

end.
