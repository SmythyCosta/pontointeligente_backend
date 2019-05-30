-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 30-Maio-2019 às 19:16
-- Versão do servidor: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ponto_inteligente`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_empresa`
--

CREATE TABLE `tbl_empresa` (
  `id` bigint(20) NOT NULL,
  `cnpj` varchar(255) NOT NULL,
  `data_atualizacao` datetime NOT NULL,
  `data_criacao` datetime NOT NULL,
  `razao_social` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbl_empresa`
--

INSERT INTO `tbl_empresa` (`id`, `cnpj`, `data_atualizacao`, `data_criacao`, `razao_social`) VALUES
(1, '28331847000178', '2019-05-29 11:57:54', '2019-05-29 11:57:54', '123456');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_funcionario`
--

CREATE TABLE `tbl_funcionario` (
  `id` bigint(20) NOT NULL,
  `cpf` varchar(255) NOT NULL,
  `data_atualizacao` datetime NOT NULL,
  `data_criacao` datetime NOT NULL,
  `email` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `perfil` varchar(255) NOT NULL,
  `qtd_horas_almoco` float DEFAULT NULL,
  `qtd_horas_trabalho_dia` float DEFAULT NULL,
  `senha` varchar(255) NOT NULL,
  `valor_hora` decimal(19,2) DEFAULT NULL,
  `empresa_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbl_funcionario`
--

INSERT INTO `tbl_funcionario` (`id`, `cpf`, `data_atualizacao`, `data_criacao`, `email`, `nome`, `perfil`, `qtd_horas_almoco`, `qtd_horas_trabalho_dia`, `senha`, `valor_hora`, `empresa_id`) VALUES
(1, '46018492091', '2019-05-29 11:57:55', '2019-05-29 11:57:55', 'pj1@email.com', 'pj-1', 'ROLE_ADMIN', NULL, NULL, '$2a$10$Hj0ylBDxbp5dAh/DtonFQOzRPkuqHbPiTbyA0wOqOL4xEOaf6x2Nm', NULL, 1),
(2, '791.471.090-33', '2019-05-29 12:36:13', '2019-05-29 12:36:13', 'pf-2@email.com', 'pf-2', 'ROLE_USUARIO', NULL, NULL, '$2a$10$QQynj/45fTOfXC71DYxp/umvR/y67NJiQoyccV.Lkt6j929yj87yy', '50.00', 1),
(3, '386.380.100-87', '2019-05-29 14:42:54', '2019-05-29 12:36:57', 'pf-3@email.com', 'pf-33', 'ROLE_USUARIO', NULL, 8.5, '$2a$10$ubwrozuuJe1W7GAAqvvDLudiieH3AkCz/3j8ly8kRrNAMI2ZnqYgy', '80.00', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_lancamento`
--

CREATE TABLE `tbl_lancamento` (
  `id` bigint(20) NOT NULL,
  `data` datetime NOT NULL,
  `data_atualizacao` datetime NOT NULL,
  `data_criacao` datetime NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `localizacao` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) NOT NULL,
  `funcionario_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tbl_lancamento`
--

INSERT INTO `tbl_lancamento` (`id`, `data`, `data_atualizacao`, `data_criacao`, `descricao`, `localizacao`, `tipo`, `funcionario_id`) VALUES
(1, '0029-10-10 08:00:00', '2019-05-29 15:04:59', '2019-05-29 14:59:48', 'INICIO de TRABALHO', '1.12121.121212', 'INICIO_TRABALHO', 2),
(2, '0029-10-10 01:06:00', '2019-05-29 15:00:56', '2019-05-29 15:00:56', 'INICIO de TRABALHO', '1.12121.121212', 'INICIO_ALMOCO', 2),
(3, '0029-10-10 01:06:00', '2019-05-29 15:01:07', '2019-05-29 15:01:07', 'INICIO de TRABALHO', '1.12121.121212', 'TERMINO_ALMOCO', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_empresa`
--
ALTER TABLE `tbl_empresa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_funcionario`
--
ALTER TABLE `tbl_funcionario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKrwysro6cpdvstayo69mr3ve11` (`empresa_id`);

--
-- Indexes for table `tbl_lancamento`
--
ALTER TABLE `tbl_lancamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKb6hvj9vk5mpm88sdljvonveqr` (`funcionario_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_empresa`
--
ALTER TABLE `tbl_empresa`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_funcionario`
--
ALTER TABLE `tbl_funcionario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_lancamento`
--
ALTER TABLE `tbl_lancamento`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tbl_funcionario`
--
ALTER TABLE `tbl_funcionario`
  ADD CONSTRAINT `FKrwysro6cpdvstayo69mr3ve11` FOREIGN KEY (`empresa_id`) REFERENCES `tbl_empresa` (`id`);

--
-- Limitadores para a tabela `tbl_lancamento`
--
ALTER TABLE `tbl_lancamento`
  ADD CONSTRAINT `FKb6hvj9vk5mpm88sdljvonveqr` FOREIGN KEY (`funcionario_id`) REFERENCES `tbl_funcionario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
