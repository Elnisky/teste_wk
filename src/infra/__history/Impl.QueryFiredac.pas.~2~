unit Impl.QueryFiredac;

interface

uses
  Interfaces.IQueryFiredac,
  Interfaces.IConexaoFiredac,
  FireDAC.Comp.Client;

type
  TQueryFiredac = class(TInterfacedObject, IQueryFiredac)
  private
    FQuery: TFDQuery;
  public
    constructor Create(const AConexao: IConexaoFiredac);
    destructor Destroy; override;
    function Query: TFDQuery;
    procedure SetSQL(const ASQL: string);
    procedure ExecSQL;
    procedure Open;
    procedure Close;
  end;

implementation

{ TQueryFiredac }

constructor TQueryFiredac.Create(const AConexao: IConexaoFiredac);
begin
  FQuery := TFDQuery.Create(nil);
  FQuery.Connection := AConexao.Conexao;
end;

destructor TQueryFiredac.Destroy;
begin
  FQuery.Free;
  inherited;
end;

function TQueryFiredac.Query: TFDQuery;
begin
  Result := FQuery;
end;

procedure TQueryFiredac.SetSQL(const ASQL: string);
begin
  FQuery.SQL.Text := ASQL;
end;

procedure TQueryFiredac.ExecSQL;
begin
  FQuery.ExecSQL;
end;

procedure TQueryFiredac.Open;
begin
  FQuery.Open;
end;

procedure TQueryFiredac.Close;
begin
  FQuery.Close;
end;

end.
