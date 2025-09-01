unit Controller.Produto;

interface

uses
  Entidades.Produto,
  Service.Produto,
  System.Generics.Collections;

type
  TProdutoController = class
  private
    FService: TProdutoService;
  public
    constructor Create;
    destructor Destroy; override;
    function ListarProdutos: TObjectList<TProduto>;
    procedure SalvarProduto(Produto: TProduto);
    procedure ExcluirProduto(ID: Integer);
  end;

implementation

constructor TProdutoController.Create;
begin
  FService := TProdutoService.Create;
end;

function TProdutoController.ListarProdutos: TObjectList<TProduto>;
begin
  Result := FService.ObterTodos;
end;

procedure TProdutoController.SalvarProduto(Produto: TProduto);
begin
  FService.Salvar(Produto);
end;

destructor TProdutoController.Destroy;
begin
  FService.Free;
end;

procedure TProdutoController.ExcluirProduto(ID: Integer);
begin
  FService.Excluir(ID);
end;

end.
