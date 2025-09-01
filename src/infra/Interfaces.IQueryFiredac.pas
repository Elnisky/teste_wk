unit Interfaces.IQueryFiredac;

interface

uses
  FireDAC.Comp.Client;

type
  IQueryFiredac = interface
    ['{D1E2F3A4-B5C6-7890-1234-56789ABCDEF0}']
    function Query: TFDQuery;
    procedure SetSQL(const ASQL: string);
    procedure ExecSQL;
    procedure Open;
    procedure Close;
  end;

implementation

end.
