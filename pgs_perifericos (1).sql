-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3309
-- Tempo de geração: 28/11/2025 às 05:51
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `pgs_perifericos`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacoes`
--

CREATE TABLE `avaliacoes` (
  `id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `nota` int(11) NOT NULL CHECK (`nota` >= 1 and `nota` <= 5),
  `titulo` varchar(200) DEFAULT NULL,
  `comentario` text DEFAULT NULL,
  `data_avaliacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `aprovado` tinyint(1) DEFAULT 1,
  `recomendacao` enum('sim','nao') DEFAULT 'sim'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` text DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`, `descricao`, `ativo`) VALUES
(1, 'Teclados', 'Teclados mecânicos, membrana e gaming', 1),
(2, 'Mouses', 'Mouses gamers, ópticos e sem fio', 1),
(3, 'Headsets', 'Fones de ouvido e headsets gamers', 1),
(4, 'Monitores', 'Monitores gaming e profissionais', 1),
(5, 'Mousepads', 'Mousepads speed e control', 1),
(6, 'Webcams', 'Webcams para streaming e reuniões', 1),
(7, 'Microfones', 'Microfones para streaming e gravação', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `data_nascimento` date NOT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp(),
  `ativo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id`, `usuario_id`, `nome`, `email`, `cpf`, `telefone`, `data_nascimento`, `data_cadastro`, `ativo`) VALUES
(1, 5, 'Cliente Teste', 'cliente@email.com', '55566677788', '(11) 95555-5555', '1995-05-25', '2025-11-23 03:47:10', 1),
(4, 9, 'PABLO GONCALVES SANTOS', 'pablo11042007santo@gmail.com', '41193306809', '11940075122', '0013-12-13', '2025-11-23 06:14:23', 1),
(5, 13, 'PABLO GONCALVES SANTOS', 'pablo11042007santosss@gmail.com', '41193306805', '11940075122', '0013-12-13', '2025-11-23 08:00:27', 1),
(6, 16, 'testeeeeeeeeee', 'pablo11042007sannnto@gmail.com', '41193308809', '11940075122', '2222-03-12', '2025-11-23 18:21:31', 1),
(9, 30, 'PABLO GONCALVES SANTOS', 'testehj@gmail.com', '12313121313', '11940075122', '2007-04-11', '2025-11-28 03:41:56', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cupons_desconto`
--

CREATE TABLE `cupons_desconto` (
  `id` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `desconto_percentual` decimal(5,2) DEFAULT NULL,
  `desconto_valor` decimal(10,2) DEFAULT NULL,
  `data_validade` date DEFAULT NULL,
  `usos_maximos` int(11) DEFAULT NULL,
  `usos_atuais` int(11) DEFAULT 0,
  `ativo` tinyint(1) DEFAULT 1,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cupons_desconto`
--

INSERT INTO `cupons_desconto` (`id`, `codigo`, `desconto_percentual`, `desconto_valor`, `data_validade`, `usos_maximos`, `usos_atuais`, `ativo`, `data_criacao`) VALUES
(1, 'BEMVINDO10', 10.00, NULL, '2024-12-31', 100, 0, 1, '2025-11-24 04:01:23'),
(2, 'PRIMEIRACOMPRA', NULL, 25.00, '2024-12-31', 50, 0, 1, '2025-11-24 04:01:23'),
(3, 'PROMO15', 15.00, NULL, '2024-06-30', 200, 0, 1, '2025-11-24 04:01:23'),
(4, 'FRETE100', NULL, 10.00, '2024-12-31', NULL, 0, 1, '2025-11-24 04:01:23');

-- --------------------------------------------------------

--
-- Estrutura para tabela `enderecos`
--

CREATE TABLE `enderecos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `logradouro` varchar(200) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `principal` tinyint(1) DEFAULT 0,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `enderecos`
--

INSERT INTO `enderecos` (`id`, `usuario_id`, `titulo`, `cep`, `logradouro`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `principal`, `data_cadastro`) VALUES
(1, 7, 'Principal', '04474070', '13adadadafa', '12313', '', '', 'São Paulo', 'SP', 1, '2025-11-23 04:08:44'),
(2, 8, 'Principal', '04474070', '13afas', '1231', '', '', 'São Paulo', 'SP', 1, '2025-11-23 04:10:41'),
(3, 9, 'Principal', '04474070', '13asadsadad', '13', '', 'Centro', 'São Paulo', 'SP', 1, '2025-11-23 06:14:23'),
(4, 13, 'Principal', '04474070', 'asda', '13', '', 'Centro', 'São Paulo', 'SP', 1, '2025-11-23 08:00:27'),
(8, 16, 'adadasdasdasd', '12321332', 'asdadsada', '213213', 'asdasd', 'adada', 'dadadadsas', 'PR', 0, '2025-11-23 21:01:32'),
(10, 28, 'Principal', '04474070', 'asdadadaad', '131', '', 'Centro', 'São Paulo', 'SP', 1, '2025-11-27 02:43:59'),
(11, 30, 'Principal', '04474070', 'asdadadadasdasd', '1313', '', 'Centro', 'São Paulo', 'SP', 1, '2025-11-28 03:41:56');

-- --------------------------------------------------------

--
-- Estrutura para tabela `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `pergunta` varchar(255) NOT NULL,
  `resposta` text NOT NULL,
  `categoria` enum('compra','produto','garantia','entrega','pagamento') NOT NULL,
  `ordem` int(11) DEFAULT 0,
  `ativo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `cargo` enum('administrador','estoquista','atendente','vendedor','gerente') NOT NULL,
  `departamento` varchar(50) NOT NULL,
  `data_admissao` date NOT NULL,
  `data_demissao` date DEFAULT NULL,
  `matricula` varchar(50) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT 1,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id`, `usuario_id`, `nome`, `email`, `cpf`, `telefone`, `data_nascimento`, `cargo`, `departamento`, `data_admissao`, `data_demissao`, `matricula`, `ativo`, `data_criacao`) VALUES
(1, 1, 'Administrador Master', 'admin@pgsecommerce.com', '11122233344', '(11) 99999-9999', '1980-01-01', 'administrador', 'Administração', '2023-01-01', NULL, 'PG001', 1, '2025-11-23 03:47:10'),
(2, 2, 'João Estoquista', 'estoque@pgsecommerce.com', '22233344455', '(11) 98888-8888', '1985-03-15', 'estoquista', 'Estoque', '2023-02-15', NULL, 'PG002', 1, '2025-11-23 03:47:10'),
(3, 3, 'Maria Atendente', 'atendimento@pgsecommerce.com', '33344455566', '(11) 97777-7777', '1990-07-20', 'atendente', 'Atendimento', '2023-03-20', NULL, 'PG003', 1, '2025-11-23 03:47:10'),
(4, 4, 'Pedro Vendedor', 'vendas@pgsecommerce.com', '44455566677', '(11) 96666-6666', '1988-11-10', 'vendedor', 'Vendas', '2023-04-10', NULL, 'PG004', 1, '2025-11-23 03:47:10'),
(5, 6, 'PABLO GONCALVES SANTOS', 'pablo11042001237santo@pgs.com', '2131312', '11940075122', '0001-12-13', 'gerente', 'administrativo', '0000-00-00', NULL, '1331', 1, '2025-11-23 03:49:31'),
(6, 10, 'PABLO GONCALVES SANTOS', 'sadsada@pgs.com', '1313123213', '11940075122', '0131-03-31', 'gerente', 'estoque', '0000-00-00', NULL, '131313asdda', 1, '2025-11-23 06:16:21'),
(7, 14, 'PABLO GONCALVES SANTOS', 'pablo11042007santossssss@pgs.com', '2312313123', '11940075122', '0022-03-13', 'atendente', 'atendimento', '1313-03-12', NULL, '12313', 1, '2025-11-23 08:03:17'),
(8, 15, 'PABLO GONCALVES SANTOS', 'pablo11042007sannnto@pgs.com', '1231612313', '11940075122', '0013-03-12', 'atendente', 'vendas', '0322-03-12', NULL, '123133213', 1, '2025-11-23 18:08:22'),
(9, 17, 'PABLO GONCALVES SANTOS', 'pablo11042007ssssssanto@pgs.com', '12313123213', '11940075122', '0222-12-13', 'atendente', 'vendas', '2222-12-13', NULL, 'asdasa2asd', 1, '2025-11-23 21:51:33'),
(10, 18, 'PABLO GONCALVES SANTOS', 'testeee@pgs.com', '123123123', '11940075122', '1231-03-12', 'vendedor', 'atendimento', '2131-03-12', NULL, '213123', 1, '2025-11-24 05:24:07'),
(11, 19, 'PABLO GONCALVES SANTOS', 'admin@pgs.com', '1231312313123', '11940075122', '0123-03-12', 'gerente', 'estoque', '1232-12-13', NULL, '2323', 1, '2025-11-25 02:31:47'),
(12, 20, 'PABLO GONCALVES SANTOS', 'teste@pgs.com', '21313131321', '11940075122', '2000-02-02', 'gerente', 'administrativo', '0313-03-12', NULL, '123313', 1, '2025-11-26 00:26:16'),
(13, 21, 'sadadasdasdadsadsadas', 'teste2@pgs.com', '21312312313212', '11940075122', '2000-03-12', 'administrador', 'administrativo', '2000-03-12', NULL, 'asdasdasd', 1, '2025-11-26 01:10:19'),
(16, 25, 'PABLO GONCALVES SANTOS', 'atendente@pgs.com', '2131321231', '11940075122', '2000-04-12', 'atendente', 'atendimento', '2000-03-12', NULL, '23sadasd', 1, '2025-11-26 05:38:12'),
(18, 29, 'PABLO GONCALVES SANTOS', 'administrador@pgs.com', '12313213231', '11940075122', '2000-11-11', 'administrador', 'ti', '2000-02-22', NULL, 'asdad1das', 1, '2025-11-28 01:26:14');

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens_pedido`
--

CREATE TABLE `itens_pedido` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT 1,
  `preco_unitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `itens_pedido`
--

INSERT INTO `itens_pedido` (`id`, `pedido_id`, `produto_id`, `quantidade`, `preco_unitario`) VALUES
(1, 1, 1, 2, 199.90),
(2, 2, 2, 2, 449.90),
(3, 3, 2, 1, 449.90),
(4, 4, 2, 1, 449.90),
(5, 5, 2, 1, 449.90),
(6, 6, 1, 3, 199.90),
(7, 7, 4, 1, 259.90),
(8, 8, 2, 1, 449.90),
(9, 9, 1, 1, 199.90),
(10, 10, 1, 1, 199.90),
(11, 11, 3, 1, 299.90),
(12, 12, 2, 1, 449.90),
(14, 14, 2, 1, 449.90);

-- --------------------------------------------------------

--
-- Estrutura para tabela `marcas`
--

CREATE TABLE `marcas` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` text DEFAULT NULL,
  `site_url` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT 1,
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `marcas`
--

INSERT INTO `marcas` (`id`, `nome`, `descricao`, `site_url`, `logo`, `ativo`, `data_criacao`) VALUES
(1, 'Redragon', 'Marca especializada em periféricos gamers de alta qualidade', 'https://redragon.com.br', NULL, 1, '2025-11-23 03:47:10'),
(2, 'Logitech', 'Líder mundial em periféricos para computador e gaming', 'https://logitech.com', NULL, 1, '2025-11-23 03:47:10'),
(3, 'HyperX', 'Marca da Kingston focada em produtos para gaming', 'https://hyperx.com', NULL, 1, '2025-11-23 03:47:10'),
(4, 'Dell', 'Fabricante de computadores e periféricos profissionais', 'https://dell.com', NULL, 1, '2025-11-23 03:47:10'),
(5, 'Razer', 'Marca premium de periféricos para gaming', 'https://razer.com', NULL, 1, '2025-11-23 03:47:10'),
(6, 'Corsair', 'Especialista em componentes e periféricos gamers', 'https://corsair.com', NULL, 1, '2025-11-23 03:47:10'),
(7, 'SteelSeries', 'Marca dinamarquesa de equipamentos para gaming', 'https://steelseries.com', NULL, 1, '2025-11-23 03:47:10'),
(8, 'ASUS', 'Fabricante de componentes e periféricos gamers ROG', 'https://asus.com', NULL, 1, '2025-11-23 03:47:10'),
(10, 'teste', 'asdasd', '1', NULL, 0, '2025-11-26 06:08:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `mensagens_suporte`
--

CREATE TABLE `mensagens_suporte` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `mensagem` text NOT NULL,
  `data_envio` timestamp NOT NULL DEFAULT current_timestamp(),
  `eh_funcionario` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `mensagens_suporte`
--

INSERT INTO `mensagens_suporte` (`id`, `ticket_id`, `usuario_id`, `mensagem`, `data_envio`, `eh_funcionario`) VALUES
(3, 3, 16, 'asdasdsadasdadas', '2025-11-25 03:24:41', 0),
(4, 3, 21, 'respondido?', '2025-11-26 04:19:19', 1),
(5, 4, 30, 'asdsadasdsadsadas', '2025-11-28 03:57:36', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) DEFAULT 0.00,
  `status` enum('pendente','pago','processando','enviado','entregue','cancelado') DEFAULT 'pendente',
  `metodo_pagamento` enum('cartao','pix','boleto') DEFAULT NULL,
  `numero_cartao` varchar(20) DEFAULT NULL,
  `nome_titular` varchar(100) DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `codigo_seguranca` varchar(4) DEFAULT NULL,
  `codigo_pix` text DEFAULT NULL,
  `codigo_boleto` varchar(50) DEFAULT NULL,
  `data_pedido` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_pagamento` timestamp NULL DEFAULT NULL,
  `data_envio` timestamp NULL DEFAULT NULL,
  `endereco_entrega` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedidos`
--

INSERT INTO `pedidos` (`id`, `cliente_id`, `total`, `subtotal`, `desconto`, `status`, `metodo_pagamento`, `numero_cartao`, `nome_titular`, `data_vencimento`, `codigo_seguranca`, `codigo_pix`, `codigo_boleto`, `data_pedido`, `data_pagamento`, `data_envio`, `endereco_entrega`) VALUES
(1, 16, 399.80, 399.80, 0.00, 'pendente', 'cartao', NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-24 05:45:53', NULL, NULL, 'Endereço selecionado pelo usuário'),
(2, 16, 899.80, 899.80, 0.00, 'pendente', 'pix', NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-24 05:51:20', NULL, NULL, 'Endereço selecionado pelo usuário'),
(3, 16, 449.90, 449.90, 0.00, 'pendente', 'cartao', NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-24 05:52:03', NULL, NULL, 'Endereço selecionado pelo usuário'),
(4, 16, 449.90, 449.90, 0.00, 'pendente', 'cartao', NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-24 05:56:37', NULL, NULL, 'Endereço selecionado pelo usuário'),
(5, 16, 449.90, 449.90, 0.00, 'pendente', 'cartao', NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-24 06:02:48', NULL, NULL, 'Endereço selecionado pelo usuário'),
(6, 16, 599.70, 599.70, 0.00, 'pendente', 'cartao', ' 313', '13131313', '0000-00-00', '231', '', '', '2025-11-24 06:43:02', NULL, NULL, 'asdadsada, 213213 - asdasd - adada - dadadadsas/PR - CEP: 12321332'),
(7, 16, 289.80, 259.90, 0.00, 'pendente', 'cartao', '31 3', 'sadadasdadadad', '0000-00-00', '131', '', '', '2025-11-24 06:43:58', NULL, NULL, 'asdadsada, 213213 - asdasd - adada - dadadadsas/PR - CEP: 12321332'),
(8, 16, 449.90, 449.90, 0.00, 'pendente', 'pix', '', '', '0000-00-00', '', 'PIX202511250139135827', '', '2025-11-25 00:39:13', NULL, NULL, 'asdadsada, 213213 - asdasd - adada - dadadadsas/PR - CEP: 12321332'),
(9, 16, 229.80, 199.90, 0.00, 'pendente', 'pix', '', '', '0000-00-00', '', 'PIX202511250142191752', '', '2025-11-25 00:42:19', NULL, NULL, 'asdadsada, 213213 - asdasd - adada - dadadadsas/PR - CEP: 12321332'),
(10, 16, 229.80, 199.90, 0.00, 'pendente', 'boleto', '', '', '0000-00-00', '', '', '34191.11111 11111.111111 11111.111111 1 1111000006', '2025-11-25 05:47:47', NULL, NULL, 'asdadsada, 213213 - asdasd - adada - dadadadsas/PR - CEP: 12321332'),
(11, 16, 299.90, 299.90, 0.00, 'pendente', 'pix', '', '', '0000-00-00', '', 'PIX202511260241064527', '', '2025-11-26 01:41:06', NULL, NULL, 'asdadsada, 213213 - asdasd - adada - dadadadsas/PR - CEP: 12321332'),
(12, 16, 449.90, 449.90, 0.00, 'entregue', 'pix', '', '', '0000-00-00', '', 'PIX202511260422296186', '', '2025-11-26 03:22:29', NULL, NULL, 'asdadsada, 213213 - asdasd - adada - dadadadsas/PR - CEP: 12321332'),
(14, 30, 449.90, 449.90, 0.00, 'pendente', 'pix', '', '', '0000-00-00', '', 'PIX202511280456067132', '', '2025-11-28 03:56:06', NULL, NULL, 'asdadadadasdasd, 1313 - Centro - São Paulo/SP - CEP: 04474070');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `marca_id` int(11) DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `especificacoes` text DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `preco_promocional` decimal(10,2) DEFAULT NULL,
  `estoque` int(11) DEFAULT 0,
  `imagem` varchar(255) DEFAULT NULL,
  `garantia_meses` int(11) DEFAULT 12,
  `ativo` tinyint(1) DEFAULT 1,
  `em_destaque` tinyint(1) DEFAULT 0,
  `em_promocao` tinyint(1) DEFAULT 0,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp(),
  `media_avaliacoes` decimal(3,2) DEFAULT 0.00,
  `total_avaliacoes` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id`, `categoria_id`, `marca_id`, `nome`, `descricao`, `especificacoes`, `preco`, `preco_promocional`, `estoque`, `imagem`, `garantia_meses`, `ativo`, `em_destaque`, `em_promocao`, `data_cadastro`, `media_avaliacoes`, `total_avaliacoes`) VALUES
(1, 1, 1, 'Teclado Mecânico Gamer Redragon Kumara RGB', 'Teclado mecânico gamer com switches Outemu Brown, iluminação RGB personalizável e design robusto. Ideal para jogos e trabalho.', 'Switches Outemu Brown\r\nLayout ABNT2\r\nAnti-ghosting N-Key Rollover\r\nIluminação RGB\r\nConstrução em ABS', 249.90, 199.90, 7, 'produto_1_692913c2135b2.jpg', 12, 1, 1, 1, '2025-11-23 21:55:36', 0.00, 0),
(2, 1, 3, 'Teclado Mecânico Gamer HyperX Alloy Origins Core', 'Teclado mecânico compacto com switches HyperX Red, estrutura em alumínio e iluminação RGB vibrante.', 'Switches HyperX Red\r\nLayout Tenkeyless\r\nEstrutura em alumínio\r\nIluminação RGB dinâmica', 499.90, 449.90, 38, 'produto_2_6929145bd08e2.png', 24, 1, 1, 0, '2025-11-23 21:55:36', 0.00, 0),
(3, 2, 2, 'Mouse Gamer Logitech G502 HERO', 'Mouse gamer de alto desempenho com sensor HERO 25K DPI e 11 botões programáveis.', 'Sensor HERO 25K DPI\r\n11 botões programáveis\r\nPesos ajustáveis\r\nIluminação RGB', 349.90, 299.90, 11, 'produto_3_6929149856ec2.jpg', 24, 1, 1, 1, '2025-11-23 21:55:36', 0.00, 0),
(4, 2, 5, 'Mouse Gamer Razer DeathAdder V2', 'Mouse gamer ergonômico com sensor óptico Focus+ 20K DPI e switches ópticos Razer.', 'Sensor Focus+ 20K DPI\r\nSwitches ópticos Razer\r\n8 botões programáveis\r\nDesign ergonômico', 299.90, 259.90, 9, 'produto_4_692914e3697a7.jpg', 24, 1, 1, 1, '2025-11-23 21:55:36', 0.00, 0),
(5, 3, 3, 'Headset Gamer HyperX Cloud Stinger', 'Headset gamer leve e confortável com drivers de 50mm e microfone com cancelamento de ruído.', 'Drivers 50mm\r\nMicrofone giratório\r\nControles de áudio no fone\r\nPeso: 275g', 199.90, 169.90, 20, 'produto_5_692916b15704c.webp', 12, 1, 1, 1, '2025-11-23 21:55:36', 0.00, 0),
(6, 3, 2, 'Headset Gamer Logitech G432 7.1', 'Headset com som surround DTS 7.1 e drivers de 50mm para imersão total em jogos.', 'Som DTS 7.1\r\nDrivers 50mm\r\nMicrofone flip-to-mute\r\nCompatível multiplataforma', 299.90, 249.90, 15, 'produto_6_692916dcec008.webp', 24, 1, 1, 1, '2025-11-23 21:55:36', 0.00, 0),
(7, 4, 8, 'Monitor Gamer AOC 24G2SE 24\"', 'Monitor gamer 24\" Full HD com 144Hz e 1ms para jogos competitivos.', '24\" Full HD\r\n144Hz\r\n1ms\r\nFreeSync\r\nPainel VA', 899.90, 799.90, 6, 'produto_7_6929170b7be1c.webp', 36, 1, 1, 1, '2025-11-23 21:55:36', 0.00, 0),
(8, 4, 8, 'Monitor Gamer ASUS TUF VG279Q 27\"', 'Monitor IPS 27\" com 144Hz e tecnologia Adaptive-Sync para jogos fluidos.', '27\" Full HD\r\n144Hz\r\n1ms\r\nIPS\r\nAdaptive-Sync', 1499.90, 1299.90, 4, 'produto_8_692917486ae29.webp', 36, 1, 1, 1, '2025-11-23 21:55:36', 0.00, 0),
(9, 5, 1, 'Mousepad Gamer Redragon Flick P027', 'Mousepad gamer de tecido com base antiderrapante e bordas costuradas.', '800x300mm\r\nEspessura 3mm\r\nBase de borracha\r\nBordas costuradas', 49.90, 39.90, 30, 'produto_9_692917e202f10.webp', 6, 1, 1, 1, '2025-11-23 21:55:36', 0.00, 0),
(10, 5, 2, 'Mousepad Gamer Logitech G240', 'Mousepad de alto desempenho com superfície otimizada para sensores ópticos.', '340x280mm\r\nSuperfície de tecido\r\nBase de borracha\r\nFino e portátil', 79.90, 69.90, 25, 'produto_10_6929178870b7a.webp', 12, 1, 1, 1, '2025-11-23 21:55:36', 0.00, 0),
(11, 6, 2, 'Webcam Logitech C920x HD Pro', 'Webcam Full HD 1080p com autofoco e microfone stereo integrado.', 'Full HD 1080p\r\nAutofoco\r\nMicrofone stereo\r\nCompatível com Skype, Zoom', 399.90, 349.90, 8, 'produto_11_692917ace4e13.jpg', 24, 1, 1, 1, '2025-11-23 21:55:36', 0.00, 0),
(12, 6, 1, 'Webcam Gamer Redragon Fobos GW800', 'Webcam gamer 1080p com microfone com redução de ruído e iluminação ajustável.', 'Full HD 1080p\r\nMicrofone com noise reduction\r\nIluminação ajustável\r\nClip universal', 199.90, 169.90, 12, 'produto_12_692918652142e.webp', 12, 1, 1, 1, '2025-11-23 21:55:36', 0.00, 0),
(13, 7, 3, 'Microfone HyperX QuadCast', 'Microfone condenser USB com quatro padrões polares e anti-vibração integrado.', 'Condenser USB\r\n4 padrões polares\r\nAnti-vibração\r\nLED personalizável', 699.90, 599.90, 5, 'produto_13_692918241a049.webp', 24, 1, 1, 1, '2025-11-23 21:55:36', 0.00, 0),
(14, 7, 1, 'Microfone Gamer Redragon Blazar GM300', 'Microfone USB plug-and-play com padrão cardioide e controle de ganho.', 'Padrão cardioide\r\nControle de ganho\r\nBase ajustável\r\nPlug-and-play', 299.90, 249.90, 10, 'produto_14_69291809a49be.webp', 12, 1, 1, 1, '2025-11-23 21:55:36', 0.00, 0),
(15, 7, 8, 'testeeeee', 'ssslaa teste', '', 1000.00, NULL, 0, 'produto_15_692918f25bb01.jpg', 12, 1, 0, 0, '2025-11-26 04:22:53', 0.00, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tickets_suporte`
--

CREATE TABLE `tickets_suporte` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `assunto` varchar(200) NOT NULL,
  `categoria` enum('compra','produto','garantia','entrega','conta','outros') NOT NULL,
  `descricao` text NOT NULL,
  `status` enum('aberto','em_andamento','respondido','fechado') DEFAULT 'aberto',
  `prioridade` enum('baixa','media','alta','urgente') DEFAULT 'media',
  `data_abertura` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_ultima_resposta` timestamp NULL DEFAULT NULL,
  `data_fechamento` timestamp NULL DEFAULT NULL,
  `funcionario_responsavel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tickets_suporte`
--

INSERT INTO `tickets_suporte` (`id`, `usuario_id`, `assunto`, `categoria`, `descricao`, `status`, `prioridade`, `data_abertura`, `data_ultima_resposta`, `data_fechamento`, `funcionario_responsavel`) VALUES
(3, 16, 'asdadasdsdad', 'produto', 'asdasdsadasdadas', 'respondido', 'alta', '2025-11-25 03:24:41', '2025-11-26 04:19:19', NULL, NULL),
(4, 30, 'asdasdasdsadasd', 'produto', 'asdsadasdsadsadas', 'aberto', 'media', '2025-11-28 03:57:36', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `tipo` enum('cliente','admin','funcionario') DEFAULT 'cliente',
  `cpf` varchar(14) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp(),
  `ativo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `tipo`, `cpf`, `telefone`, `data_nascimento`, `data_cadastro`, `ativo`) VALUES
(1, 'Administrador Master', 'admin@pgsecommerce.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', '11122233344', '(11) 99999-9999', '1980-01-01', '2025-11-23 03:47:10', 1),
(2, 'João Estoquista', 'estoque@pgsecommerce.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'funcionario', '22233344455', '(11) 98888-8888', '1985-03-15', '2025-11-23 03:47:10', 1),
(3, 'Maria Atendente', 'atendimento@pgsecommerce.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'funcionario', '33344455566', '(11) 97777-7777', '1990-07-20', '2025-11-23 03:47:10', 1),
(4, 'Pedro Vendedor', 'vendas@pgsecommerce.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'funcionario', '44455566677', '(11) 96666-6666', '1988-11-10', '2025-11-23 03:47:10', 1),
(5, 'Cliente Teste', 'cliente@email.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'cliente', '55566677788', '(11) 95555-5555', '1995-05-25', '2025-11-23 03:47:10', 1),
(6, 'PABLO GONCALVES SANTOS', 'pablo11042001237santo@pgs.com', '$2y$10$U31Cvt/dvgXB09y8en0WFec/.l9OjwfsfGEJlIpNw06U1MfuWcGIS', 'funcionario', '2131312', '11940075122', '0001-12-13', '2025-11-23 03:49:31', 1),
(7, 'PABLO GONCALVES SANTOS', 'pablo11042007santos@pgs.com', '$2y$10$LyDu2zjzTSRsmZuzcwl5QuuDhr4.5EvzCxJw0VdRkwq6GX9l/wKCy', 'cliente', '1213131132', '11940075122', '0013-03-31', '2025-11-23 04:08:44', 1),
(8, 'PABLO GONCALVES SANTOS', 'sla@pgs.com', '$2y$10$HT3VntkLDvJzq84uzBOD0uCfnHw7Se5Bi3643dSX9y5Jbhm2X9wyC', 'cliente', '1231141', '11940075122', '0000-00-00', '2025-11-23 04:10:41', 0),
(9, 'PABLO GONCALVES SANTOS', 'pablo11042007santo@gmail.com', '$2y$10$cn8piksSkrsafxq5Zvajiej42wjjoBvPH9W66tNLZZv1q/1A7aIrS', 'cliente', '41193306809', '11940075122', '0013-12-13', '2025-11-23 06:14:23', 1),
(10, 'PABLO GONCALVES SANTOS', 'sadsada@pgs.com', '$2y$10$4FWH5WXHq7kfQIYXlf7RveT4gvCOyWKQ6yvMZ1QcFQRHbBu2KUPW.', 'funcionario', '1313123213', '11940075122', '0131-03-31', '2025-11-23 06:16:21', 1),
(11, 'asdad', 'adad@gmail.com', '$2y$10$EYyQjsMPUUHwLCNpoNIbo.7HZ.fOk4KrzvOaLhKVi5ttg2zz4x8Ea', 'funcionario', NULL, NULL, NULL, '2025-11-23 07:42:04', 1),
(13, 'PABLO GONCALVES SANTOS', 'pablo11042007santosss@gmail.com', '$2y$10$Kd/XhszHkE6OB2grn.hzgulnsMliJd8gaF1VYYfSJkMTiHr8Odw7u', 'cliente', '41193306805', '11940075122', '0013-12-13', '2025-11-23 08:00:27', 0),
(14, 'PABLO GONCALVES SANTOS', 'pablo11042007santossssss@pgs.com', '$2y$10$PSSL2FsnYQ0vaEaUmIGNLuyM7eBZpj/F177iRrp8xxUGQZ3Eb2n46', 'funcionario', '2312313123', '11940075122', '0022-03-13', '2025-11-23 08:03:17', 1),
(15, 'PABLO GONCALVES SANTOS', 'pablo11042007sannnto@pgs.com', '$2y$10$BfYM24fmtw4LQHM42dJib.iPKGNQ/6K0o98suJ4oO3WEph9r.m5LC', 'funcionario', '1231612313', '11940075122', '0013-03-12', '2025-11-23 18:08:22', 1),
(16, 'testeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee', 'pablo11042007sannnto@gmail.com', '$2y$10$wZXbCgbtJltr/TjKgRJlRet6D76PwUnM/hLp675uoQ7PrrLraumF6', 'cliente', '411933088099', '11940075122', '2222-03-12', '2025-11-23 18:21:31', 1),
(17, 'PABLO GONCALVES SANTOS', 'pablo11042007ssssssanto@pgs.com', '$2y$10$cF7wHnzFEh6H/x5x2/qZ2.5vIvX1hsz1Ypht24Ftni9EqgFd2YQJG', 'funcionario', '12313123213', '11940075122', '0222-12-13', '2025-11-23 21:51:33', 1),
(18, 'PABLO GONCALVES SANTOS', 'testeee@pgs.com', '$2y$10$4g6dnhYQVh67TbOLrorPUOa4FDCoMhHa5cJygC2LcwM.j.9kWOpWC', 'funcionario', '123123123', '11940075122', '1231-03-12', '2025-11-24 05:24:07', 1),
(19, 'PABLO GONCALVES SANTOS', 'admin@pgs.com', '$2y$10$JEvsFooIJkod.5w94woWqenEmj4F1hrRPyWZAeZ8I0NM/ugZkaSlS', 'funcionario', '1231312313123', '11940075122', '0123-03-12', '2025-11-25 02:31:47', 1),
(20, 'PABLO GONCALVES SANTOS', 'teste@pgs.com', '$2y$10$u9KcvLER0lUlv42lOdvXZOd6Kjx0AKTQbwtdMgKt29ovcYN0g6b92', 'funcionario', '21313131321', '11940075122', '2000-02-02', '2025-11-26 00:26:16', 1),
(21, 'sadadasdasdadsadsadas', 'teste2@pgs.com', '$2y$10$QaBxU3ds4aBikEBwMZoQA.7JNyx1cpy10d4T4VHvA/JdkDz5vUGDW', 'funcionario', '21312312313212', '11940075122', '2000-03-12', '2025-11-26 01:10:19', 1),
(25, 'PABLO GONCALVES SANTOS', 'atendente@pgs.com', '$2y$10$MeoUQQ7daSV5O4wpyVpd/OHVyEWt7bnD444mgGkUb5LoyZNaMEXV2', 'funcionario', '2131321231', '11940075122', '2000-04-12', '2025-11-26 05:38:12', 1),
(28, 'testeeeeeeAMMMBURRGGGGG', 'testeamburgi@gmail.com', '$2y$10$NgnBZV4Qu8gmUcMlSUigQOkTsPx52qxfaHFT8Q3yXp7FGfXN9Lsmy', 'cliente', '41193303801', '11940075122', '2000-12-22', '2025-11-27 02:43:59', 1),
(29, 'PABLO GONCALVES SANTOS', 'administrador@pgs.com', '$2y$10$Q4Jd7wkaaD/FbbTKiWtaWurynkJevtHvfbfMPVAE6I36jnpQJCSO2', 'funcionario', '12313213231', '11940075122', '2000-11-11', '2025-11-28 01:26:14', 1),
(30, 'PABLO GONCALVES SANTOS', 'testehj@gmail.com', '$2y$10$NDyuqjyelOkHz/UQldcu3.SDDJ7hMfqkpwmHSnvy772Pd5ZhKhGpu', 'cliente', '12313121313', '11940075122', '2007-04-11', '2025-11-28 03:41:56', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `data_adicao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `wishlist`
--

INSERT INTO `wishlist` (`id`, `usuario_id`, `produto_id`, `data_adicao`) VALUES
(108, 30, 1, '2025-11-28 04:13:59');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `avaliacoes`
--
ALTER TABLE `avaliacoes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_avaliacao` (`usuario_id`,`produto_id`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `idx_avaliacoes_produto` (`produto_id`),
  ADD KEY `idx_avaliacoes_usuario` (`usuario_id`);

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `cupons_desconto`
--
ALTER TABLE `cupons_desconto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Índices de tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `matricula` (`matricula`),
  ADD KEY `idx_funcionarios_email` (`email`);

--
-- Índices de tabela `itens_pedido`
--
ALTER TABLE `itens_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices de tabela `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_marcas_nome` (`nome`);

--
-- Índices de tabela `mensagens_suporte`
--
ALTER TABLE `mensagens_suporte`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pedidos_status` (`status`,`data_pedido`),
  ADD KEY `idx_pedidos_cliente` (`cliente_id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_produtos_destaque` (`em_destaque`,`ativo`),
  ADD KEY `idx_produtos_promocao` (`em_promocao`,`ativo`),
  ADD KEY `idx_produtos_categoria` (`categoria_id`),
  ADD KEY `idx_produtos_marca` (`marca_id`);

--
-- Índices de tabela `tickets_suporte`
--
ALTER TABLE `tickets_suporte`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `funcionario_responsavel` (`funcionario_responsavel`),
  ADD KEY `idx_tickets_status` (`status`,`data_abertura`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD KEY `idx_usuarios_email` (`email`);

--
-- Índices de tabela `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_wishlist` (`usuario_id`,`produto_id`),
  ADD KEY `produto_id` (`produto_id`),
  ADD KEY `idx_wishlist_usuario` (`usuario_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `avaliacoes`
--
ALTER TABLE `avaliacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `cupons_desconto`
--
ALTER TABLE `cupons_desconto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `enderecos`
--
ALTER TABLE `enderecos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `itens_pedido`
--
ALTER TABLE `itens_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `mensagens_suporte`
--
ALTER TABLE `mensagens_suporte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `tickets_suporte`
--
ALTER TABLE `tickets_suporte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `avaliacoes`
--
ALTER TABLE `avaliacoes`
  ADD CONSTRAINT `avaliacoes_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`),
  ADD CONSTRAINT `avaliacoes_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `avaliacoes_ibfk_3` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`);

--
-- Restrições para tabelas `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `enderecos`
--
ALTER TABLE `enderecos`
  ADD CONSTRAINT `enderecos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `funcionarios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `itens_pedido`
--
ALTER TABLE `itens_pedido`
  ADD CONSTRAINT `itens_pedido_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `itens_pedido_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`);

--
-- Restrições para tabelas `mensagens_suporte`
--
ALTER TABLE `mensagens_suporte`
  ADD CONSTRAINT `mensagens_suporte_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets_suporte` (`id`),
  ADD CONSTRAINT `mensagens_suporte_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `produtos_ibfk_2` FOREIGN KEY (`marca_id`) REFERENCES `marcas` (`id`);

--
-- Restrições para tabelas `tickets_suporte`
--
ALTER TABLE `tickets_suporte`
  ADD CONSTRAINT `tickets_suporte_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `tickets_suporte_ibfk_2` FOREIGN KEY (`funcionario_responsavel`) REFERENCES `funcionarios` (`id`);

--
-- Restrições para tabelas `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
