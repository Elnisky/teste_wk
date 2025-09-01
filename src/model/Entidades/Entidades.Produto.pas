unit Entidades.Produto;

interface

uses
  Atributos.ORM;

type
  [TTabela('produtos')]
  TProduto = class
  private
    FCodigo: Integer;
    FDescricao: string;
    FPrecoVenda: Double;
  public
    [TCampo('proCodigo'), TChavePrimaria, TAutoIncremento]
    property Codigo: Integer read FCodigo write FCodigo;

    [TCampo('proDescricao')]
    property Descricao: string read FDescricao write FDescricao;

    [TCampo('proPrecoVenda')]
    property PrecoVenda: Double read FPrecoVenda write FPrecoVenda;
  end;

implementation

end.
