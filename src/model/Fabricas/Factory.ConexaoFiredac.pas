unit Factory.ConexaoFiredac;

interface

uses
  Impl.ConexaoFiredac;

type
  TConexaoFactory = class
  public
    class function NovaConexao: TConexaoFiredac;
  end;

implementation

class function TConexaoFactory.NovaConexao: TConexaoFiredac;
begin
  Result := TConexaoFiredac.Create;
end;

end.
