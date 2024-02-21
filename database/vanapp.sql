-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21-Fev-2024 às 02:02
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `vanapp`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `bairros`
--

CREATE TABLE `bairros` (
  `ID` int(11) NOT NULL,
  `descricao` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bairros_linhas`
--

CREATE TABLE `bairros_linhas` (
  `ID_Bairros` int(11) NOT NULL,
  `ID_Linhas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `celular`
--

CREATE TABLE `celular` (
  `CNH` varchar(10) NOT NULL,
  `Celular` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `condutores`
--

CREATE TABLE `condutores` (
  `CNH` varchar(10) NOT NULL,
  `Name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `email`
--

CREATE TABLE `email` (
  `CNH` varchar(10) NOT NULL,
  `Email` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `escolas`
--

CREATE TABLE `escolas` (
  `ID` int(11) NOT NULL,
  `Descricao` varchar(60) NOT NULL,
  `Bairro` varchar(60) NOT NULL,
  `Rua` varchar(60) NOT NULL,
  `Numero` int(11) NOT NULL,
  `Complemento` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `escolas_linhas`
--

CREATE TABLE `escolas_linhas` (
  `ID_Escolas` int(11) NOT NULL,
  `ID_Linhas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `linhas`
--

CREATE TABLE `linhas` (
  `ID` int(11) NOT NULL,
  `PossuiVagas` int(11) NOT NULL,
  `descricao` varchar(40) NOT NULL,
  `Periodo` varchar(40) NOT NULL,
  `CNH_Condutor` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `bairros`
--
ALTER TABLE `bairros`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `bairros_linhas`
--
ALTER TABLE `bairros_linhas`
  ADD PRIMARY KEY (`ID_Bairros`,`ID_Linhas`),
  ADD KEY `ID_Linhas` (`ID_Linhas`);

--
-- Índices para tabela `celular`
--
ALTER TABLE `celular`
  ADD PRIMARY KEY (`CNH`,`Celular`);

--
-- Índices para tabela `condutores`
--
ALTER TABLE `condutores`
  ADD PRIMARY KEY (`CNH`);

--
-- Índices para tabela `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`CNH`,`Email`);

--
-- Índices para tabela `escolas`
--
ALTER TABLE `escolas`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `escolas_linhas`
--
ALTER TABLE `escolas_linhas`
  ADD PRIMARY KEY (`ID_Escolas`,`ID_Linhas`),
  ADD KEY `ID_Linhas` (`ID_Linhas`);

--
-- Índices para tabela `linhas`
--
ALTER TABLE `linhas`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CNH_Condutor` (`CNH_Condutor`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `bairros`
--
ALTER TABLE `bairros`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `escolas`
--
ALTER TABLE `escolas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `linhas`
--
ALTER TABLE `linhas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `bairros_linhas`
--
ALTER TABLE `bairros_linhas`
  ADD CONSTRAINT `bairros_linhas_ibfk_1` FOREIGN KEY (`ID_Bairros`) REFERENCES `bairros` (`ID`),
  ADD CONSTRAINT `bairros_linhas_ibfk_2` FOREIGN KEY (`ID_Linhas`) REFERENCES `linhas` (`ID`);

--
-- Limitadores para a tabela `celular`
--
ALTER TABLE `celular`
  ADD CONSTRAINT `fk_CNHCelular` FOREIGN KEY (`CNH`) REFERENCES `condutores` (`CNH`);

--
-- Limitadores para a tabela `email`
--
ALTER TABLE `email`
  ADD CONSTRAINT `fk_CNHEmail` FOREIGN KEY (`CNH`) REFERENCES `condutores` (`CNH`);

--
-- Limitadores para a tabela `escolas_linhas`
--
ALTER TABLE `escolas_linhas`
  ADD CONSTRAINT `escolas_linhas_ibfk_1` FOREIGN KEY (`ID_Escolas`) REFERENCES `escolas` (`ID`),
  ADD CONSTRAINT `escolas_linhas_ibfk_2` FOREIGN KEY (`ID_Linhas`) REFERENCES `linhas` (`ID`);

--
-- Limitadores para a tabela `linhas`
--
ALTER TABLE `linhas`
  ADD CONSTRAINT `linhas_ibfk_1` FOREIGN KEY (`CNH_Condutor`) REFERENCES `condutores` (`CNH`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
