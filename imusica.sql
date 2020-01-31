-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 31/01/2020 às 15:33
-- Versão do servidor: 10.4.11-MariaDB
-- Versão do PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `imusica`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `arma_raca`
--

CREATE TABLE `arma_raca` (
  `id` int(11) NOT NULL,
  `id_raca` int(11) NOT NULL,
  `ataque` int(11) NOT NULL,
  `defesa` int(11) NOT NULL,
  `faces_dado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `arma_raca`
--

INSERT INTO `arma_raca` (`id`, `id_raca`, `ataque`, `defesa`, `faces_dado`) VALUES
(1, 1, 2, 1, 6),
(2, 2, 1, 0, 8);

-- --------------------------------------------------------

--
-- Estrutura para tabela `habilidades_raca`
--

CREATE TABLE `habilidades_raca` (
  `id` int(11) NOT NULL,
  `id_raca` int(11) NOT NULL,
  `forca` int(11) NOT NULL,
  `agilidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `habilidades_raca`
--

INSERT INTO `habilidades_raca` (`id`, `id_raca`, `forca`, `agilidade`) VALUES
(1, 1, 1, 2),
(2, 2, 2, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pontos_vida`
--

CREATE TABLE `pontos_vida` (
  `id` int(11) NOT NULL,
  `id_raca` int(11) NOT NULL,
  `vida` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `pontos_vida`
--

INSERT INTO `pontos_vida` (`id`, `id_raca`, `vida`) VALUES
(1, 1, -2),
(2, 2, -8);

-- --------------------------------------------------------

--
-- Estrutura para tabela `raca`
--

CREATE TABLE `raca` (
  `id` int(11) NOT NULL,
  `nome` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `raca`
--

INSERT INTO `raca` (`id`, `nome`) VALUES
(1, 'humano'),
(2, 'orc');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `arma_raca`
--
ALTER TABLE `arma_raca`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `habilidades_raca`
--
ALTER TABLE `habilidades_raca`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pontos_vida`
--
ALTER TABLE `pontos_vida`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_raca` (`id_raca`);

--
-- Índices de tabela `raca`
--
ALTER TABLE `raca`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `arma_raca`
--
ALTER TABLE `arma_raca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `habilidades_raca`
--
ALTER TABLE `habilidades_raca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `pontos_vida`
--
ALTER TABLE `pontos_vida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `raca`
--
ALTER TABLE `raca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `pontos_vida`
--
ALTER TABLE `pontos_vida`
  ADD CONSTRAINT `fk_raca` FOREIGN KEY (`id_raca`) REFERENCES `raca` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
