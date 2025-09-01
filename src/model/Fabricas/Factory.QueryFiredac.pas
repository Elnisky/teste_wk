unit Factory.QueryFiredac;

interface

uses
  Impl.QueryFiredac,
  Interfaces.IConexaoFiredac;

type
  TQueryFactory = class
  public
    class function NovaQuery(const Conexao: IConexaoFiredac): TQueryFiredac;
  end;

implementation

class function TQueryFactory.NovaQuery(const Conexao: IConexaoFiredac): TQueryFiredac;
begin
  Result := TQueryFiredac.Create(Conexao);
end;

end.
