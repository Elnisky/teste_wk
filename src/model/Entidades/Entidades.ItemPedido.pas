unit Entidades.ItemPedido;

interface

uses
  Atributos.ORM;

type
  [TTabela('pedidos')]
  TItemPedido = class
  private
    FCodPedido: Integer;
    FNumPedido: Integer;
    FProCodigo: Integer;
    FQuantidade: Integer;
    FVlrUnitario: Double;
    FVlrTotal: Double;
  public
    [TCampo('pedCodPedido'), TChavePrimaria, TAutoIncremento]
    property CodPedido: Integer read FCodPedido write FCodPedido;

    [TCampo('pedNumPedido'), TForeignKey('dadosgeraispedido(dgpNumPedido)')]
    property NumPedido: Integer read FNumPedido write FNumPedido;

    [TCampo('pedProCodigo'), TForeignKey('produtos(proCodigo)')]
    property ProCodigo: Integer read FProCodigo write FProCodigo;

    [TCampo('pedQuantidade')]
    property Quantidade: Integer read FQuantidade write FQuantidade;

    [TCampo('pedVlrUnitario')]
    property VlrUnitario: Double read FVlrUnitario write FVlrUnitario;

    [TCampo('pedVlrTotal')]
    property VlrTotal: Double read FVlrTotal write FVlrTotal;
  end;

implementation
end.
