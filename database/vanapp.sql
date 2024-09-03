-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03-Set-2024 às 03:05
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
  `Descricao` varchar(200) NOT NULL,
  `Bairro` varchar(200) NOT NULL,
  `Rua` varchar(200) NOT NULL,
  `Complemento` varchar(200) NOT NULL,
  `Numero` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `escolas`
--

INSERT INTO `escolas` (`ID`, `Descricao`, `Bairro`, `Rua`, `Complemento`, `Numero`) VALUES
(1, 'ADVENTISTA DE HORTOLANDIA COLEGIO', 'Parque Hortolândia', 'Rua Rodrigo Carvalho', '', '200'),
(2, 'ALTERNATIVO COLEGIO', 'Jardim Amanda I', 'Oswald de Andrade', '', '4'),
(3, 'ALTERNATIVO DE HORTOLANDIA COLEGIO', 'Jardim Amanda I', 'Isabel Princesa', 'Av', '403'),
(4, 'ANA JOSE BODINI JANUARIO DONA EMEF', 'Jardim Amanda', 'Avenida Santana', '999', 'Av'),
(5, 'ANTONIO ZANLUCHI PROFESSOR', 'Parque do Horto', 'Rua Primavera', '', '450'),
(6, 'ARMELINDA ESPURIO DA SILVA EMEF', 'Jardim Nossa Senhora de Fatima', 'Avenida João Coelho', 'Rua', '10'),
(7, 'BAIRRO TAQUARA BRANCA EMEIEF', 'Jardim Novo Horizonte', 'Rua Lazaro Quintino de Camargo', '', 'SN'),
(8, 'BAIRRO TRES CASAS EMEI', 'Bairro Chácaras Assay', 'Estrada Cinco', '', '69'),
(9, 'CAIO FERNANDO GOMES PEREIRA EMEF', 'Jardim Nossa Senhora Auxiliadora', 'Rua Aurora Prado Tanacchi', '', '995'),
(10, 'CARAMELO COLEGIO', 'Parque Gabriel', 'Avenida Fermino Maltarollo', '', '440'),
(11, 'CEL JTO A EE HEDY MADALENA BOCCHI PROFESSORA', 'Jardim Everest', 'Pico do Itatiaia', '', '333'),
(12, 'CEL JTO A EE LIOMAR FREITAS CAMARA PROFA', 'Vila Real Continuacao', 'Edna Aparecida Bampa Fonseca', 'Rua', '29'),
(13, 'CENTRO DE PROGRESSAO PENITENCIARIA DE HORTOLANDIA', 'Parque Peron', 'De Velha Campinas-Monte Mor', 'KM 5', ''),
(14, 'CENTRO INTEGRADO DE EDUCACAO E REABILITACAO MUNICIPAL', 'Parque Santo Andre', 'Rua Olivio Franceschini', '', '200'),
(15, 'CHACARA ACARAI EMEI', 'Chacaras Acarai', 'Ambrosina Dias de Campos Baranski', 'Caminho', '95/113'),
(16, 'CLAUDIO ROBERTO MARQUES PROFESSOR EMEF', 'Jardim Santana', 'Rua Fabiano Pinheiro da Silva', '', '100'),
(17, 'CLEMENTE PAVAN COLEGIO', 'Jardim Santa Isabel', 'Rua Benedito Leite', '', '180'),
(18, 'COLEGIO ADVENTISTA UNASP - UNIDADE HORTOLANDIA', 'Parque Ortolândia', 'Hugo Gegembauer Pastor', 'Rua', '265'),
(19, 'COLEGIO ANGLO UNIDADE HORTOLANDIA', 'Jardim Rosolem', 'Orlando Pavan', '', '635'),
(20, 'COLEGIO PRIMEIRO MUNDO', 'Chacaras Acarai', 'Willi Paul Baranski', 'Caminho', '236'),
(21, 'COLEGIO TRILHA DAS LETRAS', 'Loteamento Remanso Campineiro', 'Rua Capitão Lourival Mey', '', '300'),
(22, 'CONCEICAO APARECIDA TERZA GOMES CARDINALES PROFESSORA', 'Jardim Amanda II', 'Rua Visconde do Rio Branco', '', '100'),
(23, 'CRBALBINO ESCOLA DE EDUCACAO INFANTIL LTDA ME', 'Loteamento Remanso Campineiro', 'Alda Lourenco Francisco', '', '502'),
(24, 'CRISTIANE CHAVES MOREIRA BRAGA PROFESSORA', 'Jardim Santana', 'Fabiano Pinheiro da Silva', '', '40'),
(25, 'EDUCANDARIO SILVINO FARIA', 'Jardim Santa Izabel', 'Circular do Sítio de Recreio II', '', '243'),
(26, 'ELISEO MARSON PROFESSOR', 'Jardim Amanda', 'Rua Oswald de Andrade', '', '255'),
(27, 'EMEF DAYLA CRISTINA SOUZA DE AMORIM', 'Jardim Santiago', 'Rua Salvador', '', '500'),
(28, 'EMEF SAMUEL DA SILVA MENDONCA', 'Jardim Nova Europa', 'Rua São Luiz', '', '276'),
(29, 'EMEI OLINDA MARIA DE JESUS SOUZA', 'Jardim Sumarezinho', 'Rua Antonio Bairral', '', '160'),
(30, 'EMEI PROFESSORA IZABEL SOSTENA DE SOUZA', 'Jardim Novo Angulo', 'Avenida Sabina Baptista de Camargo', '', 'SN'),
(31, 'EMEIEF JARDIM SANTA AMELIA HUMBERTO DE AMORIM LOPES', 'Jardim Santa Amelia', 'Rua dos Curios', '', '42'),
(32, 'EMEIEF LUIZA VITORIA OLIVEIRA CRUZ', 'Parque Orestes Ongaro', 'Domingos Batista de Souza', '', '455'),
(33, 'EMILIANO SANCHEZ EMEI', 'Jardim Santa Clara do Lago II', 'Canada', '', '100'),
(34, 'ESCOLA DE EDUCACAO INFANTIL LITTERA VIVA EIRELI', 'Parque Hortolândia', 'Pastor Hugo Gegembauer', '', '686'),
(35, 'ESCOLA DE EDUCACAO INFANTIL MUNDO TRAVESSO', '', 'sem dados de endereço', '', ''),
(36, 'ESCOLA ESATEC EDUCACIONAL UNIDADE HORTOLANDIA', 'Loteamento Adventista Campineiro', 'Ernesto Roth Pastor', 'Rua', '385'),
(37, 'ESCOLA MUNICIPAL DE ED INFANTIL MIGUEL CAMILLO', 'Jardim Terras de Santo Antonio', 'Rua Antonio Gazetta', '', '53'),
(38, 'ESCOLA MUNICIPAL DE EDUCACAO BASICA JOSIAS DA SILVA MACEDO', 'Jardim Nossa Senhora de Fatima', 'Manoel Antonio da Silva', '', '365'),
(39, 'ESCOLA MUNICIPAL DE EDUCACAO INFANTIL JARDIM INTERLAGOS', 'Jardim Interlagos', 'Rio Corumba', '', 'S/N'),
(40, 'ESCOLA MUNICIPAL DE EDUCACAO INFANTIL JARDIM NOVO CAMBUI', 'Jardim Novo Cambui', 'Rua Nair Ferreira Coelho', '', '725'),
(41, 'ESCOLA MUNICIPAL DE EDUCACAO INFANTIL JARDIM NOVO ESTRELA', 'Jardim Novo Estrela', '', '2', ''),
(42, 'ETEC DE HORTOLANDIA', 'Jardim Santana', 'Rua Capitão Lourival Mey', '', '750'),
(43, 'ETEC FUTURO', '', 'sem dados de endereço', '', ''),
(44, 'ETEP ESCOLA TECNICA DE ENSINO PROFISSIONALIZANTE', 'Jardim Mirante', 'Rua Pedro Pereira dos Santos', '', '296'),
(45, 'EUZEBIO ANTONIO RODRIGUES PROFESSOR', 'Jardim Amanda II', 'Avenida Brasil', '', 'SN'),
(46, 'FERNANDA D PERISSINOTTO S FARIA EDUCACAO INFANTIL', 'Jardim Residencial Firenze', 'Rua Napoli', '', '331'),
(47, 'FERNANDA GRAZIELLE RESENDE COVRE EMEF', 'Jardim Adelaide', 'Rua João Gastaldi', '', '430'),
(48, 'GABER EMPREENDIMENTOS EDUCACIONAIS', 'Jardim Santa Isabel', 'Rua Ercilio Antonio Meira', '', '74'),
(49, 'GIRASSOL RECREACAO E EDUCACAO INFANTIL LTDA ME', '', 'Rua Delmira Antonia de Jesus', '', '475'),
(50, 'GUIDO ROSOLEN', 'Jardim Rosolem', 'Guido Rosolem', '', '201'),
(51, 'HEDY MADALENA BOCCHI PROFESSORA', 'Jardim Everest', 'Rua Pico do Itatiaia', '', '333'),
(52, 'HELENA FUTAVA TAKAHASHI PROFESSORA EMEF', 'Jardim Campos Verdes', 'Rua da Confibra', '', '55'),
(53, 'HONORINO FABBRI DOUTOR', 'Jardim Sumarezinho', 'Rua Osorio Candido da Silva', '', '179'),
(54, 'HORTOLANDIA DEPARTAMENTO DE EDUCACAO DE', 'Bairro Terra Preta', 'Rodovia Jornalista Francisco de Aguirre Proenca', 'KM 13', ''),
(55, 'IFSP - CAMPUS HORTOLANDIA', 'Vila Sao Pedro', 'Avenida Thereza Ana Cecon Breda', '', 'SN'),
(56, 'INOVACAO ESCOLA EDUCACAO INFANTIL FUNDAMENTAL E MEDIO', 'Remanso Campineiro', 'Rua Zacarias Costa Camargo', '', '65'),
(57, 'INSTITUTO BATISTA BOAS NOVAS DE EDUCACAO E ASSISTENCIA', 'Jardim Rosolem', 'Rua Orlando Pavan', '', '67'),
(58, 'INSTITUTO EDUCACIONAL CREPALDI', 'Remanso Campineiro', 'Rua Zacharias Costa Camargo', '', '310'),
(59, 'JANILDE FLORES GABY DO VALE PROFA ESC MUN DE ENS FUNDAMENTAL', 'Vila Real', 'Avenida Professora Edna Aparecida Pampa da Fonseca', '', '115'),
(60, 'JARDIM ADELAIDE EMEIEF', 'Jardim Adelaide', 'Rua Julio Cesar Nascimento', '', '355'),
(61, 'JARDIM ALINE', 'Jardim Santiago', 'Benedita Teodoro da Silva', '', '848'),
(62, 'JARDIM AMANDA I EMEF- CAIC', 'Jardim Amanda', 'Rua Graciliano Ramos', '', '698'),
(63, 'JARDIM AMANDA I EMEI', 'Jardim Amanda', 'Rua Graciliano Ramos', '', '698'),
(64, 'JARDIM AMANDA II EMEI', 'Jardim Amanda', 'Rua Brigadeiro Faria Lima', '', '280'),
(65, 'JARDIM AMANDA III EMEI', 'Jardim Amanda I', 'Rua Jose Bonifacio', '', '130'),
(66, 'JARDIM BOA ESPERANCA JOSE ROQUE DE MOURA EMEF', 'Jardim Boa Esperanca', 'Rua do Canario', '', '400'),
(67, 'JARDIM INTERLAGOS ESCOLA MUNCIPAL DE EDUCACAO BASICA', 'Jardim Interlagos', 'Rua Joaquim Marcelino Leite', '', '26'),
(68, 'JARDIM NOSSA SENHORA AUXILIADORA EMEI', 'Jardim Nossa Senhora Auxiliadora', 'Rua Izadia Fabricio da Silva', '', '228'),
(69, 'JARDIM NOSSA SENHORA DE FATIMA EMEI', 'Nucleo Santa Isabel', 'Rua Antonio Viegas', '', '45'),
(70, 'JARDIM NOVA EUROPA EMEI', 'Jardim Nova Europa', 'Rua Sao Luiz', '', '276'),
(71, 'JARDIM PRIMAVERA EMEF', 'Jardim Boa Esperanca', 'Rua da Currueira', '', '350'),
(72, 'JARDIM PRIMAVERA EMEF', 'Jardim Boa Esperanca', 'Rua da Currueira', '', '350'),
(73, 'JARDIM PRIMAVERA EMEF', 'Jardim Boa Esperanca', 'Rua da Currueira', '', '350'),
(74, 'JARDIM PRIMAVERA EMEF', 'Jardim Boa Esperanca', 'Rua da Currueira', '', '350');

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

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
