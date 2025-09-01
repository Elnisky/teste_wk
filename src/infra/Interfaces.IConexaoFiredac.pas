unit Interfaces.IConexaoFiredac;

interface

uses
  FireDAC.Comp.Client;

type
  IConexaoFiredac = interface
    ['{A1B2C3D4-E5F6-7890-1234-56789ABCDEF0}']
    function Conexao: TFDConnection;
  end;

implementation

end.
