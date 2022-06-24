unit Intf.Connection;

interface

uses
  FireDAC.Comp.Client;
type
  IDBConnection = interface
    procedure Execute(const aComando: string);
    function GetValue(const aComando: string): variant;
    Function GetAllFields(const aComando : String) : TFDQuery;
  end;

implementation

end.

