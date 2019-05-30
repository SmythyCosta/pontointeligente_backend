
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
(1, '07067536000173', '2019-04-24 08:57:40', '2019-04-24 08:57:40', '123456');

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
(1, '28450358027', '2019-04-24 08:57:41', '2019-04-24 08:57:41', 'admin@email.com', 'admin', 'ROLE_ADMIN', NULL, NULL, '$2a$10$SrhZwA/AmVKUa6Veq5GcB.vS0g3fxzmcIa38UQJI.bxH62diqYyEW', NULL, 1),
(2, '42020617056', '2019-04-24 09:00:44', '2019-04-24 09:00:44', 'pf1@email.com', 'pf1', 'ROLE_USUARIO', NULL, NULL, '$2a$10$mhajnSEMcxjwwZlz00BZCeY1fgdYziw8VRNXNeRwFUgp6LIHvZWR.', '50.00', 1),
(3, '74073684060', '2019-04-24 09:04:07', '2019-04-24 09:04:07', 'pf2@email.com', 'pf2', 'ROLE_USUARIO', NULL, NULL, '$2a$10$L6xTFCtsP8QYx1n/uXl3OeFNkbisj6tPs2PwgLRIjmTCE1pLRQ8Qu', '55.00', 1);

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
(1, '2019-10-10 08:00:00', '2019-04-24 09:54:26', '2019-04-24 09:54:26', 'INICIO de trabalho', '1.12121.121212', 'INICIO_TRABALHO', 2),
(2, '2019-10-10 12:00:00', '2019-04-24 09:54:26', '2019-04-24 09:54:26', 'INICIO de ALMOCO', '1.12121.121212', 'INICIO_ALMOCO', 2),
(3, '2019-10-10 14:00:00', '2019-04-24 09:55:05', '2019-04-24 09:55:05', 'TERMINO de ALMOCO', '1.12121.121212', 'TERMINO_ALMOCO', 2),
(4, '2019-10-10 18:00:00', '2019-04-24 09:55:44', '2019-04-24 09:55:44', 'TERMINO de TRABALHO', '1.12121.121212', 'TERMINO_TRABALHO', 2);

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
