unit Controller.Cliente;

interface

uses
  Entidades.Cliente,
  Service.Cliente,
  System.Generics.Collections;

type
  TClienteController = class
  private
    FService: TClienteService;
  public
    constructor Create;
    destructor Destroy; override;
    function ListarClientes: TObjectList<TCliente>;
    procedure SalvarCliente(Cliente: TCliente);
    procedure ExcluirCliente(ID: Integer);
  end;

implementation

constructor TClienteController.Create;
begin
  FService := TClienteService.Create;
end;

function TClienteController.ListarClientes: TObjectList<TCliente>;
begin
  Result := FService.ObterTodos;
end;

procedure TClienteController.SalvarCliente(Cliente: TCliente);
begin
  FService.Salvar(Cliente);
end;

destructor TClienteController.Destroy;
begin
  FService.Free;
  inherited;
end;

procedure TClienteController.ExcluirCliente(ID: Integer);
begin
  FService.Excluir(ID);
end;

end.
