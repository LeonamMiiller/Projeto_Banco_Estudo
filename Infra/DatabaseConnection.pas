unit DatabaseConnection;

interface

uses
  FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Phys.FB, FireDAC.VCLUI.Wait, System.Classes, Intf.Connection;

type
  TDBConnection = class(TInterfacedObject, IDBConnection)
  private
    function GetConnection: TFDConnection;
  public
    procedure Execute(const aComando: string);
    function GetValue(const aComando: string): variant;
    Function GetAllFields(const aComando : String) : TFDQuery;
  end;

implementation

{ TDBConnection }

procedure TDBConnection.Execute(const aComando: string);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := GetConnection;
    Query.SQL.Text := aComando;
    Query.ExecSQL;
  finally
    Query.Connection.Free;
    Query.Free;
  end;
end;

function TDBConnection.GetConnection: TFDConnection;
var
  Connection: TFDConnection;
begin
  Connection := TFDConnection.Create(nil);
  Connection.DriverName := 'FB';
  Connection.Params.Add('Database=..\..\BD\Database.fdb');
  Connection.Params.Add('User_Name=SYSDBA');
  Connection.Params.Add('Password=masterkey');
  Connection.LoginPrompt := False;
  Connection.Open;

  result := Connection;
end;

function TDBConnection.GetValue(const aComando: string): Variant;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := GetConnection;
    Query.Open(aComando);
    result := Query.Fields[0].AsVariant;
  finally
    Query.Connection.Free;
    Query.Free;
  end;
end;

Function TDBConnection.GetAllFields(const aComando : String) : TFDQuery;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := GetConnection;
    Query.Open(aComando);
    query.Fields[0].AsString;
    result := Query;
  finally

  end;

end;

end.
