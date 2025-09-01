unit Controller.ItemPedido;

interface

uses
  Entidades.ItemPedido,
  Service.ItemPedido,
  System.Generics.Collections;

type
  TItemPedidoController = class
  private
    FService: TItemPedidoService;
  public
    constructor Create;
    function ListarItens: TObjectList<TItemPedido>;
    function ListarPorPedido(NumPedido: Integer): TObjectList<TItemPedido>;
    procedure SalvarItem(Item: TItemPedido);
    procedure ExcluirItem(ID: Integer);
  end;

implementation

constructor TItemPedidoController.Create;
begin
  FService := TItemPedidoService.Create;
end;

function TItemPedidoController.ListarItens: TObjectList<TItemPedido>;
begin
  Result := FService.ObterTodos;
end;

function TItemPedidoController.ListarPorPedido(NumPedido: Integer): TObjectList<TItemPedido>;
begin
  Result := FService.ObterPorPedido(NumPedido);
end;

procedure TItemPedidoController.SalvarItem(Item: TItemPedido);
begin
  FService.Salvar(Item);
end;

procedure TItemPedidoController.ExcluirItem(ID: Integer);
begin
  FService.Excluir(ID);
end;

end.
