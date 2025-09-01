object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Pedidos'
  ClientHeight = 543
  ClientWidth = 696
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = mnuPrincipal
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object grdPedidos: TDBGrid
    Left = 0
    Top = 0
    Width = 696
    Height = 496
    Align = alClient
    DataSource = dsPedidos
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object pnlPrincipal: TPanel
    Left = 0
    Top = 496
    Width = 696
    Height = 47
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      696
      47)
    object btnAbrirPedido: TButton
      Left = 491
      Top = 14
      Width = 94
      Height = 25
      Hint = 'Selecione no grid'
      Anchors = [akLeft, akBottom]
      Caption = 'Abrir pedido'
      TabOrder = 0
      OnClick = btnAbrirPedidoClick
    end
    object btnRemoverPedido: TButton
      Left = 591
      Top = 14
      Width = 94
      Height = 25
      Hint = 'Selecione no grid'
      Anchors = [akLeft, akBottom]
      Caption = 'Remover pedido'
      TabOrder = 1
      OnClick = btnRemoverPedidoClick
    end
    object btnNovoPedido: TButton
      Left = 11
      Top = 14
      Width = 94
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Novo pedido'
      TabOrder = 2
      OnClick = btnNovoPedidoClick
    end
  end
  object mnuPrincipal: TMainMenu
    Left = 40
    Top = 56
    object mnuCadastros: TMenuItem
      Caption = 'Cadastros'
      Visible = False
      object mnuCadastroClientes: TMenuItem
        Caption = 'Cadastro de Clientes'
      end
      object mnuCadastroProdutos: TMenuItem
        Caption = 'Cadastro de Produtos'
      end
    end
  end
  object dsPedidos: TDataSource
    DataSet = cdsPedidos
    Left = 208
    Top = 96
  end
  object cdsPedidos: TClientDataSet
    PersistDataPacket.Data = {
      6D0000009619E0BD0100000018000000040000000000030000006D00094E756D
      50656469646F040001000000000007436C69656E746501004900000001000557
      494454480200020064000B44617461456D697373616F08000800000000000856
      6C72546F74616C08000400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 280
    Top = 96
    object cdsPedidosNumPedido: TIntegerField
      DisplayLabel = 'Pedido'
      DisplayWidth = 10
      FieldName = 'NumPedido'
    end
    object cdsPedidosCliente: TStringField
      DisplayWidth = 66
      FieldName = 'Cliente'
      Size = 100
    end
    object cdsPedidosDataEmissao: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DataEmissao'
    end
    object cdsPedidosVlrTotal: TFloatField
      DisplayLabel = 'Total'
      DisplayWidth = 10
      FieldName = 'VlrTotal'
      DisplayFormat = 'R$ ,0.00'
    end
  end
end
