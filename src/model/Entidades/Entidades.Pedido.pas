unit Entidades.Pedido;

interface

uses
  Atributos.ORM;

type
  [TTabela('dadosgeraispedido')]
  TPedido = class
  private
    FNumPedido: Integer;
    FDataEmissao: TDateTime;
    FCliCodigo: Integer;
    FVlrTotal: Double;
  public
    [TCampo('dgpNumPedido'), TChavePrimaria, TAutoIncremento]
    property NumPedido: Integer read FNumPedido write FNumPedido;

    [TCampo('dgpDataEmissao')]
    property DataEmissao: TDateTime read FDataEmissao write FDataEmissao;

    [TCampo('dgpCliCodigo'), TForeignKey('clientes(cliCodigo)')]
    property CliCodigo: Integer read FCliCodigo write FCliCodigo;

    [TCampo('dgpVlrTotal')]
    property VlrTotal: Double read FVlrTotal write FVlrTotal;
  end;

implementation

end.
