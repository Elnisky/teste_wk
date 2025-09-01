-- --------------------------------------------------------
-- Servidor:                     10.0.0.108
-- Versão do servidor:           8.0.43-0ubuntu0.24.04.1 - (Ubuntu)
-- OS do Servidor:               Linux
-- HeidiSQL Versão:              12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para teste_wk
DROP DATABASE IF EXISTS `teste_wk`;
CREATE DATABASE IF NOT EXISTS `teste_wk` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `teste_wk`;

-- Copiando estrutura para tabela teste_wk.clientes
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `cliCodigo` int NOT NULL AUTO_INCREMENT,
  `cliNome` varchar(255) NOT NULL,
  `cliCidade` varchar(255) NOT NULL,
  `cliUF` varchar(2) NOT NULL,
  PRIMARY KEY (`cliCodigo`),
  KEY `idx_cliCidade` (`cliCidade`),
  KEY `idx_cliUF` (`cliUF`),
  KEY `idx_cliCidade_UF` (`cliCidade`,`cliUF`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela teste_wk.clientes: ~20 rows (aproximadamente)
DELETE FROM `clientes`;
INSERT INTO `clientes` (`cliCodigo`, `cliNome`, `cliCidade`, `cliUF`) VALUES
	(1, 'Ana Souza', 'Curitiba', 'PR'),
	(2, 'Bruno Lima', 'São Paulo', 'SP'),
	(3, 'Carlos Mendes', 'Rio de Janeiro', 'RJ'),
	(4, 'Daniela Rocha', 'Belo Horizonte', 'MG'),
	(5, 'Eduardo Silva', 'Porto Alegre', 'RS'),
	(6, 'Fernanda Costa', 'Recife', 'PE'),
	(7, 'Gabriel Torres', 'Fortaleza', 'CE'),
	(8, 'Helena Martins', 'Salvador', 'BA'),
	(9, 'Igor Almeida', 'Manaus', 'AM'),
	(10, 'Juliana Freitas', 'Natal', 'RN'),
	(11, 'Karen Oliveira', 'João Pessoa', 'PB'),
	(12, 'Leonardo Ribeiro', 'Campinas', 'SP'),
	(13, 'Mariana Teixeira', 'Florianópolis', 'SC'),
	(14, 'Nicolas Castro', 'Vitória', 'ES'),
	(15, 'Olívia Santos', 'Belém', 'PA'),
	(16, 'Pedro Henrique', 'Goiânia', 'GO'),
	(17, 'Quésia Barros', 'Cuiabá', 'MT'),
	(18, 'Rafael Nunes', 'Campo Grande', 'MS'),
	(19, 'Sabrina Lopes', 'Aracaju', 'SE'),
	(20, 'Thiago Pires', 'Teresina', 'PI');

-- Copiando estrutura para tabela teste_wk.dadosgeraispedido
DROP TABLE IF EXISTS `dadosgeraispedido`;
CREATE TABLE IF NOT EXISTS `dadosgeraispedido` (
  `dgpNumPedido` int NOT NULL AUTO_INCREMENT,
  `dgpDataEmissao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dgpCliCodigo` int NOT NULL,
  `dgpVlrTotal` decimal(14,2) NOT NULL,
  PRIMARY KEY (`dgpNumPedido`),
  KEY `idx_dgpCliCodigo` (`dgpCliCodigo`),
  KEY `idx_dgpDataEmissao` (`dgpDataEmissao`),
  KEY `idx_dgpVlrTotal` (`dgpVlrTotal`),
  KEY `idx_dgpCliPeriodo` (`dgpCliCodigo`,`dgpDataEmissao`),
  KEY `idx_dgpValorPeriodo` (`dgpVlrTotal`,`dgpDataEmissao`),
  CONSTRAINT `dadosgeraispedido_ibfk_1` FOREIGN KEY (`dgpCliCodigo`) REFERENCES `clientes` (`cliCodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela teste_wk.dadosgeraispedido: ~20 rows (aproximadamente)
DELETE FROM `dadosgeraispedido`;
INSERT INTO `dadosgeraispedido` (`dgpNumPedido`, `dgpDataEmissao`, `dgpCliCodigo`, `dgpVlrTotal`) VALUES
	(1, '2025-09-01 00:44:42', 1, 5.00),
	(2, '2025-09-01 00:44:42', 2, 7.50),
	(3, '2025-09-01 00:44:42', 3, 10.00),
	(4, '2025-09-01 00:44:42', 4, 12.00),
	(5, '2025-09-01 00:44:42', 5, 15.00),
	(6, '2025-09-01 00:44:42', 6, 18.50),
	(7, '2025-09-01 00:44:42', 7, 20.00),
	(8, '2025-09-01 00:44:42', 8, 22.00),
	(9, '2025-09-01 00:44:42', 9, 25.00),
	(10, '2025-09-01 00:44:42', 10, 30.00),
	(11, '2025-09-01 00:44:42', 11, 35.00),
	(12, '2025-09-01 00:44:42', 12, 40.00),
	(13, '2025-09-01 00:44:42', 13, 45.00),
	(14, '2025-09-01 00:44:42', 14, 50.00),
	(15, '2025-09-01 00:44:42', 15, 55.00),
	(16, '2025-09-01 00:44:42', 16, 60.00),
	(17, '2025-09-01 00:44:42', 17, 65.00),
	(18, '2025-09-01 00:44:42', 18, 70.00),
	(19, '2025-09-01 00:44:42', 19, 75.00),
	(20, '2025-09-01 00:44:42', 20, 80.00),
	(21, '2025-09-01 00:46:31', 1, 164.50),
	(22, '2025-09-01 00:49:49', 8, 85.70),
	(23, '2025-09-01 00:59:14', 8, 23.40);

-- Copiando estrutura para tabela teste_wk.pedidos
DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `pedCodPedido` int NOT NULL AUTO_INCREMENT,
  `pedNumPedido` int NOT NULL,
  `pedProCodigo` int NOT NULL,
  `pedQuantidade` int NOT NULL,
  `pedVlrUnitario` decimal(14,2) NOT NULL,
  `pedVlrTotal` decimal(14,2) NOT NULL,
  PRIMARY KEY (`pedCodPedido`),
  KEY `idx_pedProCodigo` (`pedProCodigo`),
  KEY `idx_pedNumPedido` (`pedNumPedido`),
  KEY `idx_pedQuantidade` (`pedQuantidade`),
  KEY `idx_pedProdutoQuantidade` (`pedProCodigo`,`pedQuantidade`),
  KEY `idx_pedProdutoPedido` (`pedProCodigo`,`pedNumPedido`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`pedNumPedido`) REFERENCES `dadosgeraispedido` (`dgpNumPedido`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`pedProCodigo`) REFERENCES `produtos` (`proCodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela teste_wk.pedidos: ~24 rows (aproximadamente)
DELETE FROM `pedidos`;
INSERT INTO `pedidos` (`pedCodPedido`, `pedNumPedido`, `pedProCodigo`, `pedQuantidade`, `pedVlrUnitario`, `pedVlrTotal`) VALUES
	(1, 1, 1, 2, 2.50, 5.00),
	(2, 2, 2, 5, 1.50, 7.50),
	(3, 3, 3, 1, 10.00, 10.00),
	(4, 4, 4, 4, 3.00, 12.00),
	(5, 5, 5, 3, 5.00, 15.00),
	(6, 6, 6, 2, 9.25, 18.50),
	(7, 7, 7, 4, 5.00, 20.00),
	(8, 8, 8, 2, 11.00, 22.00),
	(9, 9, 9, 5, 5.00, 25.00),
	(10, 10, 10, 3, 10.00, 30.00),
	(11, 11, 11, 2, 17.50, 35.00),
	(12, 12, 12, 4, 10.00, 40.00),
	(13, 13, 13, 3, 15.00, 45.00),
	(14, 14, 14, 2, 25.00, 50.00),
	(15, 15, 15, 5, 11.00, 55.00),
	(16, 16, 16, 3, 20.00, 60.00),
	(17, 17, 17, 2, 32.50, 65.00),
	(18, 18, 18, 4, 17.50, 70.00),
	(19, 19, 19, 3, 25.00, 75.00),
	(20, 20, 20, 4, 20.00, 80.00),
	(21, 21, 8, 5, 0.00, 160.00),
	(22, 21, 5, 3, 0.00, 4.50),
	(23, 23, 1, 3, 2.50, 7.50),
	(24, 23, 3, 1, 15.90, 15.90);

-- Copiando estrutura para tabela teste_wk.produtos
DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `proCodigo` int NOT NULL AUTO_INCREMENT,
  `proDescricao` varchar(255) NOT NULL,
  `proPrecoVenda` decimal(14,2) NOT NULL,
  PRIMARY KEY (`proCodigo`),
  KEY `idx_proDescricao` (`proDescricao`),
  KEY `idx_proDescricao_preco` (`proDescricao`,`proPrecoVenda`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela teste_wk.produtos: ~20 rows (aproximadamente)
DELETE FROM `produtos`;
INSERT INTO `produtos` (`proCodigo`, `proDescricao`, `proPrecoVenda`) VALUES
	(1, 'Caneta Azul', 2.50),
	(2, 'Lápis Preto', 1.20),
	(3, 'Caderno 100 folhas', 15.90),
	(4, 'Borracha Branca', 0.80),
	(5, 'Apontador Simples', 1.50),
	(6, 'Mochila Escolar', 89.90),
	(7, 'Estojo Triplo', 25.00),
	(8, 'Agenda 2025', 32.00),
	(9, 'Marcador de Texto', 3.75),
	(10, 'Papel Sulfite A4', 18.00),
	(11, 'Grampeador Médio', 12.50),
	(12, 'Tesoura Escolar', 6.90),
	(13, 'Cola Branca 250ml', 4.20),
	(14, 'Calculadora Simples', 22.00),
	(15, 'Régua 30cm', 2.80),
	(16, 'Pincel Atômico', 3.30),
	(17, 'Cartolina Colorida', 1.10),
	(18, 'Pastas Plásticas', 2.00),
	(19, 'Bloco de Notas', 5.50),
	(20, 'Envelope Kraft', 0.60);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
