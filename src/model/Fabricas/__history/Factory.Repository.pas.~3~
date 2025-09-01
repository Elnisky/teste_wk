unit Factory.Repository;

interface

uses
  Entidades.Cliente,
  Entidades.ItemPedido,
  Entidades.Pedido,
  Entidades.Produto,
  Factory.ConexaoFiredac,
  Factory.QueryFiredac,
  Persistencia.ORM,
  System.SysUtils;

type
  TRepositoryFactory = class
  private
  public
    class function ClienteRepository: TPersistencia<TCliente>;
    class function ProdutoRepository: TPersistencia<TProduto>;
    class function PedidoRepository: TPersistencia<TPedido>;
    class function ItemPedidoRepository: TPersistencia<TItemPedido>;
  end;

implementation

{ TRepositoryFactory }

class function TRepositoryFactory.ClienteRepository: TPersistencia<TCliente>;
begin
  var Conexao := TConexaoFactory.NovaConexao;
  Result := TPersistencia<TCliente>.Create(Conexao,
                                           TQueryFactory.NovaQuery(Conexao));
end;

class function TRepositoryFactory.ProdutoRepository: TPersistencia<TProduto>;
begin
  var Conexao := TConexaoFactory.NovaConexao;
  Result := TPersistencia<TProduto>.Create(Conexao,
                                           TQueryFactory.NovaQuery(Conexao));
end;

class function TRepositoryFactory.PedidoRepository: TPersistencia<TPedido>;
begin
  var Conexao := TConexaoFactory.NovaConexao;
  Result := TPersistencia<TPedido>.Create(Conexao,
                                          TQueryFactory.NovaQuery(Conexao));
end;

class function TRepositoryFactory.ItemPedidoRepository: TPersistencia<TItemPedido>;
begin
  var Conexao := TConexaoFactory.NovaConexao;
  Result := TPersistencia<TItemPedido>.Create(Conexao,
                                              TQueryFactory.NovaQuery(Conexao));
end;

end.
