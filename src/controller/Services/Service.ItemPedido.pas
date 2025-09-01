unit Service.ItemPedido;

interface

uses
  Entidades.ItemPedido,
  Factory.Repository,
  Persistencia.ORM,
  System.Generics.Collections;

type
  TItemPedidoService = class
  private
    FRepo: TPersistencia<TItemPedido>;
  public
    constructor Create;
    function ObterTodos: TObjectList<TItemPedido>;
    function ObterPorPedido(NumPedido: Integer): TObjectList<TItemPedido>;
    procedure Salvar(Item: TItemPedido);
    procedure Excluir(ID: Integer);
  end;

implementation

{ TItemPedidoService }

constructor TItemPedidoService.Create;
begin
  FRepo := TRepositoryFactory.ItemPedidoRepository;
end;

function TItemPedidoService.ObterTodos: TObjectList<TItemPedido>;
begin
  Result := FRepo.ObterTodos;
end;

function TItemPedidoService.ObterPorPedido(NumPedido: Integer): TObjectList<TItemPedido>;
var
  Lista: TObjectList<TItemPedido>;
begin
  Lista := FRepo.ObterTodos;
  Result := TObjectList<TItemPedido>.Create;
  for var Item in Lista do
    if Item.NumPedido = NumPedido then
      Result.Add(Item);
end;

procedure TItemPedidoService.Salvar(Item: TItemPedido);
begin
  if Item.CodPedido = 0 then
    FRepo.Inserir(Item)
  else
    FRepo.Atualizar(Item);
end;

procedure TItemPedidoService.Excluir(ID: Integer);
var
  Lista: TObjectList<TItemPedido>;
  Item: TItemPedido;
begin
  Lista := FRepo.ObterTodos;
  for Item in Lista do
  begin
    if Item.CodPedido = ID then
    begin
      FRepo.Excluir(Item);
      Break; // achou, não precisa continuar
    end;
  end;
end;

end.
