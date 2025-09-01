-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS teste_wk;
USE teste_wk;

-- Tabela de Clientes
-- Campos: Código, Nome, Cidade, UF
CREATE TABLE clientes (
    cliCodigo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cliNome VARCHAR(255) NOT NULL,
    cliCidade VARCHAR(255) NOT NULL,
    cliUF VARCHAR(2) NOT NULL,

    -- Índices para melhorar consultas por cidade e UF
    INDEX idx_cliCidade (cliCidade),                   -- Acelera filtros por cidade
    INDEX idx_cliUF (cliUF),                           -- Acelera filtros por UF
    INDEX idx_cliCidade_UF (cliCidade, cliUF)          -- Acelera filtros combinados por cidade e UF
);

-- Tabela de Produtos
-- Campos: Código, Descrição, Preço de venda
CREATE TABLE produtos (
    proCodigo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    proDescricao VARCHAR(255) NOT NULL,
    proPrecoVenda DECIMAL(14,2) NOT NULL,

    -- Índices para melhorar buscas por descrição e faixa de preço
    INDEX idx_proDescricao (proDescricao),             -- Acelera buscas por nome do produto
    INDEX idx_proDescricao_preco (proDescricao, proPrecoVenda) -- Acelera filtros por nome e preço
);

-- Tabela de Dados Gerais do Pedido
-- Campos: Código do pedido, Código do cliente, Data do pedido, Valor total
CREATE TABLE dadosgeraispedido (
    dgpNumPedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dgpDataEmissao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    dgpCliCodigo INT NOT NULL,
    dgpVlrTotal DECIMAL(14,2) NOT NULL,

    -- Chave estrangeira ligando ao cliente
    FOREIGN KEY (dgpCliCodigo) REFERENCES clientes(cliCodigo),

    -- Índices para melhorar filtros por cliente, data e valor
    INDEX idx_dgpCliCodigo (dgpCliCodigo),                 -- Acelera consultas por cliente
    INDEX idx_dgpDataEmissao (dgpDataEmissao),             -- Acelera filtros por período
    INDEX idx_dgpVlrTotal (dgpVlrTotal),                   -- Acelera filtros por valor total
    INDEX idx_dgpCliPeriodo (dgpCliCodigo, dgpDataEmissao),-- Acelera filtros por cliente e período
    INDEX idx_dgpValorPeriodo (dgpVlrTotal, dgpDataEmissao)-- Acelera filtros por valor e período
);

-- Tabela de Itens do Pedido
-- Campos: Código do pedido, Código do produto, Quantidade, Valor unitário, Valor total
CREATE TABLE pedidos (
    pedCodPedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- Código interno do item (PK)
    pedNumPedido INT NOT NULL,                            -- Código do pedido (FK)
    pedProCodigo INT NOT NULL,                            -- Código do produto (FK)
    pedQuantidade INT NOT NULL,                           -- Quantidade do produto
    pedVlrUnitario DECIMAL(14,2) NOT NULL,                -- Valor unitário
    pedVlrTotal DECIMAL(14,2) NOT NULL,                   -- Valor total do item

    -- Chaves estrangeiras ligando ao pedido e ao produto
    FOREIGN KEY (pedNumPedido) REFERENCES dadosgeraispedido(dgpNumPedido),
    FOREIGN KEY (pedProCodigo) REFERENCES produtos(proCodigo),

    -- Índices para melhorar filtros por produto, pedido e quantidade
    INDEX idx_pedProCodigo (pedProCodigo),                -- Acelera consultas por produto
    INDEX idx_pedNumPedido (pedNumPedido),                -- Acelera joins e filtros por pedido
    INDEX idx_pedQuantidade (pedQuantidade),              -- Acelera filtros por quantidade
    INDEX idx_pedProdutoQuantidade (pedProCodigo, pedQuantidade), -- Acelera filtros por produto e quantidade
    INDEX idx_pedProdutoPedido (pedProCodigo, pedNumPedido)       -- Acelera filtros por produto e pedido
);

INSERT INTO clientes (cliNome, cliCidade, cliUF) VALUES
('Ana Souza', 'Curitiba', 'PR'),
('Bruno Lima', 'São Paulo', 'SP'),
('Carlos Mendes', 'Rio de Janeiro', 'RJ'),
('Daniela Rocha', 'Belo Horizonte', 'MG'),
('Eduardo Silva', 'Porto Alegre', 'RS'),
('Fernanda Costa', 'Recife', 'PE'),
('Gabriel Torres', 'Fortaleza', 'CE'),
('Helena Martins', 'Salvador', 'BA'),
('Igor Almeida', 'Manaus', 'AM'),
('Juliana Freitas', 'Natal', 'RN'),
('Karen Oliveira', 'João Pessoa', 'PB'),
('Leonardo Ribeiro', 'Campinas', 'SP'),
('Mariana Teixeira', 'Florianópolis', 'SC'),
('Nicolas Castro', 'Vitória', 'ES'),
('Olívia Santos', 'Belém', 'PA'),
('Pedro Henrique', 'Goiânia', 'GO'),
('Quésia Barros', 'Cuiabá', 'MT'),
('Rafael Nunes', 'Campo Grande', 'MS'),
('Sabrina Lopes', 'Aracaju', 'SE'),
('Thiago Pires', 'Teresina', 'PI');

INSERT INTO produtos (proDescricao, proPrecoVenda) VALUES
('Caneta Azul', 2.50),
('Lápis Preto', 1.20),
('Caderno 100 folhas', 15.90),
('Borracha Branca', 0.80),
('Apontador Simples', 1.50),
('Mochila Escolar', 89.90),
('Estojo Triplo', 25.00),
('Agenda 2025', 32.00),
('Marcador de Texto', 3.75),
('Papel Sulfite A4', 18.00),
('Grampeador Médio', 12.50),
('Tesoura Escolar', 6.90),
('Cola Branca 250ml', 4.20),
('Calculadora Simples', 22.00),
('Régua 30cm', 2.80),
('Pincel Atômico', 3.30),
('Cartolina Colorida', 1.10),
('Pastas Plásticas', 2.00),
('Bloco de Notas', 5.50),
('Envelope Kraft', 0.60);

-- Gerar 20 pedidos com 2 produtos cada
INSERT INTO dadosgeraispedido (dgpCliCodigo, dgpVlrTotal) VALUES
(1, 5.00), (2, 7.50), (3, 10.00), (4, 12.00), (5, 15.00),
(6, 18.50), (7, 20.00), (8, 22.00), (9, 25.00), (10, 30.00),
(11, 35.00), (12, 40.00), (13, 45.00), (14, 50.00), (15, 55.00),
(16, 60.00), (17, 65.00), (18, 70.00), (19, 75.00), (20, 80.00);

-- Itens dos pedidos (2 produtos por pedido)
INSERT INTO pedidos (pedNumPedido, pedProCodigo, pedQuantidade, pedVlrUnitario, pedVlrTotal) VALUES
(1, 1, 2, 2.50, 5.00),
(2, 2, 5, 1.50, 7.50),
(3, 3, 1, 10.00, 10.00),
(4, 4, 4, 3.00, 12.00),
(5, 5, 3, 5.00, 15.00),
(6, 6, 2, 9.25, 18.50),
(7, 7, 4, 5.00, 20.00),
(8, 8, 2, 11.00, 22.00),
(9, 9, 5, 5.00, 25.00),
(10, 10, 3, 10.00, 30.00),
(11, 11, 2, 17.50, 35.00),
(12, 12, 4, 10.00, 40.00),
(13, 13, 3, 15.00, 45.00),
(14, 14, 2, 25.00, 50.00),
(15, 15, 5, 11.00, 55.00),
(16, 16, 3, 20.00, 60.00),
(17, 17, 2, 32.50, 65.00),
(18, 18, 4, 17.50, 70.00),
(19, 19, 3, 25.00, 75.00),
(20, 20, 4, 20.00, 80.00);