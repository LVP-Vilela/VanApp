-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Nov-2024 às 00:20
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

--
-- Extraindo dados da tabela `bairros`
--

INSERT INTO `bairros` (`ID`, `descricao`) VALUES
(1, 'Chácara Planalto'),
(2, 'Chácara Recreio Alvorada'),
(3, 'Chácara Reymar'),
(4, 'Chácaras Acaraí'),
(5, 'Chácaras Assay'),
(6, 'Chácaras de Recreio - 2000'),
(7, 'Chácaras Fazenda Coelho'),
(8, 'Chácaras Havaí'),
(9, 'Chácaras Luzitana'),
(10, 'Chácaras Nova Boa Vista'),
(11, 'Chácaras Panaino'),
(12, 'Condomínio Chácara Grota Azul'),
(13, 'Conjunto Habitacional Jardim Primavera'),
(14, 'Jardim Adelaide'),
(15, 'Jardim Aline'),
(16, 'Jardim Amanda I'),
(17, 'Jardim Amanda II'),
(18, 'Jardim Boa Esperança'),
(19, 'Jardim Boa Vista'),
(20, 'Jardim Brasil'),
(21, 'Jardim Campos Verdes'),
(22, 'Jardim Carmen Cristina'),
(23, 'Jardim Conceição'),
(24, 'Jardim das Colinas'),
(25, 'Jardim das Figueiras I'),
(26, 'Jardim das Figueiras II'),
(27, 'Jardim das Laranjeiras'),
(28, 'Jardim das Paineiras'),
(29, 'Jardim do Bosque'),
(30, 'Jardim do Brás'),
(31, 'Jardim do Lago'),
(32, 'Jardim Estefânia'),
(33, 'Jardim Estrela'),
(34, 'Jardim Everest'),
(35, 'Jardim Flamboyant'),
(36, 'Jardim Girassol'),
(37, 'Jardim Golden Park Residence'),
(38, 'Jardim Green Park Residence'),
(39, 'Jardim Interlagos'),
(40, 'Jardim Ipê'),
(41, 'Jardim Lírio'),
(42, 'Jardim Malta'),
(43, 'Jardim Minda'),
(44, 'Jardim Mirante de Sumaré'),
(45, 'Jardim Nossa Senhora Auxiliadora'),
(46, 'Jardim Nossa Senhora da Penha'),
(47, 'Jardim Nossa Senhora de Fátima'),
(48, 'Jardim Nossa Senhora de Lourdes'),
(49, 'Jardim Nova Alvorada'),
(50, 'Jardim Nova América'),
(51, 'Jardim Nova Boa Vista'),
(52, 'Jardim Nova Europa'),
(53, 'Jardim Nova Hortolândia I'),
(54, 'Jardim Nova Hortolândia II'),
(55, 'Jardim Novo Ângulo'),
(56, 'Jardim Novo Cambuí'),
(57, 'Jardim Novo Estrela'),
(58, 'Jardim Novo Horizonte'),
(59, 'Jardim Paulistinha'),
(60, 'Jardim Residencial Firenze'),
(61, 'Jardim Ricardo'),
(62, 'Jardim Rosolém'),
(63, 'Jardim Santa Amélia'),
(64, 'Jardim Santa Cândida'),
(65, 'Jardim Santa Clara do Lago I'),
(66, 'Jardim Santa Clara do Lago II'),
(67, 'Jardim Santa Emília'),
(68, 'Jardim Santa Esmeralda'),
(69, 'Jardim Santa Fé'),
(70, 'Jardim Santa Izabel'),
(71, 'Jardim Santa Luzia'),
(72, 'Jardim Santa Rita de Cássia'),
(73, 'Jardim Santana'),
(74, 'Jardim Santiago'),
(75, 'Jardim Santo André'),
(76, 'Jardim Santo Antônio'),
(77, 'Jardim São Benedito'),
(78, 'Jardim São Bento'),
(79, 'Jardim São Camilo'),
(80, 'Jardim São Jorge'),
(81, 'Jardim São Pedro'),
(82, 'Jardim São Sebastião'),
(83, 'Jardim Stella'),
(84, 'Jardim Sumarezinho'),
(85, 'Jardim Terras de Santo Antônio'),
(86, 'Jardim Viagem'),
(87, 'Jardim Villagio Ghiraldelli'),
(88, 'Loteamento Adventista Campineiro'),
(89, 'Loteamento Recanto do Sol'),
(90, 'Loteamento Remanso Campineiro'),
(91, 'Núcleo Santa Isabel'),
(92, 'Paraíso Novo Ângulo'),
(93, 'Parque do Horto'),
(94, 'Parque dos Pinheiros'),
(95, 'Parque Gabriel'),
(96, 'Parque Horizonte'),
(97, 'Parque Odimar'),
(98, 'Parque Orestes Ôngaro'),
(99, 'Parque Ortolândia'),
(100, 'Parque Perón'),
(101, 'Parque Residencial João Luiz'),
(102, 'Parque Residencial Maria de Lourdes'),
(103, 'Parque São Miguel'),
(104, 'Parque Terras de Santa Maria'),
(105, 'Residencial Anauá'),
(106, 'Residencial Jardim de Mônaco'),
(107, 'Residencial Jardim do Jatobá'),
(108, 'Sítio Panorama'),
(109, 'Vila América'),
(110, 'Vila Conquista'),
(111, 'Vila Guedes'),
(112, 'Vila Inema'),
(113, 'Vila Real'),
(114, 'Vila Real Continuaçao'),
(115, 'Vila Real Santista'),
(116, 'Vila São Francisco'),
(117, 'Vila São Pedro'),
(118, 'Villa Flora');

-- --------------------------------------------------------

--
-- Estrutura da tabela `bairros_linhas`
--

CREATE TABLE `bairros_linhas` (
  `ID_Bairros` int(11) NOT NULL,
  `ID_Linhas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `bairros_linhas`
--

INSERT INTO `bairros_linhas` (`ID_Bairros`, `ID_Linhas`) VALUES
(24, 1),
(24, 2),
(24, 3),
(24, 4),
(43, 1),
(43, 2),
(53, 1),
(53, 2),
(53, 3),
(53, 4),
(54, 1),
(54, 2),
(54, 3),
(54, 4),
(113, 3),
(113, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `celular`
--

CREATE TABLE `celular` (
  `CNH` varchar(10) NOT NULL,
  `Celular` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `celular`
--

INSERT INTO `celular` (`CNH`, `Celular`) VALUES
('0000000000', '(01)10000-1000'),
('0000000000', '(02)20000-2000'),
('1111111111', '(03)30000-3000'),
('1111111111', '(04)40000-4000'),
('2222222222', '(05)50000-5000'),
('2222222222', '(06)60000-6000'),
('3333333333', '(07)70000-7000'),
('3333333333', '(08)80000-8000'),
('4444444444', '(09)90000-9000'),
('5555555555', '(10)00000-0000'),
('6666666666', '(11)11000-1100'),
('7777777777', '(12)12000-1200'),
('7777777777', '(13)13000-1300'),
('8888888888', '(14)14000-1400');

-- --------------------------------------------------------

--
-- Estrutura da tabela `condutores`
--

CREATE TABLE `condutores` (
  `CNH` varchar(10) NOT NULL,
  `Name` varchar(60) NOT NULL,
  `imgPath` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `condutores`
--

INSERT INTO `condutores` (`CNH`, `Name`, `imgPath`) VALUES
('0000000000', 'Fabiana Escolar', 'tia-fabi.jpg'),
('1111111111', 'Jorge Escolar', 'tio-jorge.jpg'),
('2222222222', 'Vanessa Escolar', 'tia-van.jpg'),
('3333333333', 'Fabio Escolar', 'volare-v6.jpg'),
('4444444444', 'Dilma Escolar', 'volare-w8.jpg'),
('5555555555', 'Jefferson Escolar', 'ducato.jpg'),
('6666666666', 'Zilda Escolar', 'sprinter.jpg'),
('7777777777', 'Fernanda Escolar', 'Master.jpg'),
('8888888888', 'Amaucir Escolar', 'Besta.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `email`
--

CREATE TABLE `email` (
  `CNH` varchar(10) NOT NULL,
  `Email` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `email`
--

INSERT INTO `email` (`CNH`, `Email`) VALUES
('0000000000', 'teste1@teste.gmail.com'),
('1111111111', 'teste2@teste.gmail.com'),
('1111111111', 'teste3@teste.gmail.com'),
('2222222222', 'teste4@teste.gmail.com'),
('2222222222', 'teste5@teste.gmail.com'),
('3333333333', 'teste6@teste.gmail.com'),
('3333333333', 'teste7@teste.gmail.com'),
('4444444444', 'teste8@teste.gmail.com'),
('5555555555', 'teste9@teste.gmail.com'),
('6666666666', 'teste10@teste.gmail.com'),
('7777777777', 'teste11@teste.gmail.com'),
('7777777777', 'teste12@teste.gmail.com'),
('8888888888', 'teste13@teste.gmail.com');

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
(1, 'ADVENTISTA DE HORTOLANDIA COLEGIO', 'PARQUE HORTOLANDIA', 'RUA RODRIGO CARVALHO', 'RUA', '200'),
(2, 'ALTERNATIVO COLEGIO', 'JARDIM AMANDA I', 'OSWALD DE ANDRADE', '', '4'),
(3, 'ALTERNATIVO DE HORTOLANDIA COLEGIO', 'JARDIM AMANDA I', 'ISABEL PRINCESA', 'AVENIDA', '403'),
(4, 'ANA JOSE BODINI JANUARIO DONA EMEF', 'JARDIM AMANDA', 'AVENIDA SANTANA', 'AVENIDA', '999'),
(5, 'ANTONIO ZANLUCHI PROFESSOR', 'PARQUE DO HORTO', 'RUA PRIMAVERA', 'RUA', '450'),
(6, 'ARMELINDA ESPURIO DA SILVA EMEF', 'JARDIM NOSSA SENHORA DE FATIMA', 'AVENIDA JOAO COELHO', 'RUA', '10'),
(7, 'BAIRRO TAQUARA BRANCA EMEIEF', 'JARDIM NOVO HORIZONTE', 'RUA LAZARO QUINTINO DE CAMARGO', 'RUA', 'SN'),
(8, 'BAIRRO TRES CASAS EMEI', 'BAIRRO CHACARAS ASSAY', 'ESTRADA CINCO', 'ESTRADA', '69'),
(9, 'CAIO FERNANDO GOMES PEREIRA EMEF', 'JARDIM NOSSA SENHORA AUXILIADORA', 'RUA AURORA PRADO TANACCHI', 'JARDIM', '995'),
(10, 'CARAMELO COLEGIO', 'PARQUE GABRIEL', 'AVENIDA FERMINO MALTAROLLO', '', '440'),
(11, 'CEL JTO A EE HEDY MADALENA BOCCHI PROFESSORA', 'JARDIM EVEREST', 'PICO DO ITATIAIA', 'RUA', '333'),
(12, 'CEL JTO A EE LIOMAR FREITAS CAMARA PROFA', 'VILA REAL CONTINUACAO', 'EDNA APARECIDA BAMPA FONSECA', 'RUA', '29'),
(13, 'CENTRO DE PROGRESSAO PENITENCIARIA DE HORTOLANDIA', 'PARQUE PERON', 'DE VELHA CAMPINAS-MONTE MOR', 'KM 5', 'SN'),
(14, 'CENTRO INTEGRADO DE EDUCACAO E REABILITACAO MUNICIPAL', 'PARQUE SANTO ANDRE', 'RUA OLIVIO FRANCESCHINI', 'RUA', '200'),
(15, 'CHACARA ACARAI EMEI', 'CHACARAS ACARAI', 'AMBROSINA DIAS DE CAMPOS BARANSKI', 'CAMINHO', '95/113'),
(16, 'CLAUDIO ROBERTO MARQUES PROFESSOR EMEF', 'JARDIM SANTANA', 'RUA FABIANO PINHEIRO DA SILVA', 'RUA', '100'),
(17, 'CLEMENTE PAVAN COLEGIO', 'JARDIM SANTA ISABEL', 'RUA BENEDITO LEITE', 'RUA', '180'),
(18, 'COLEGIO ADVENTISTA UNASP - UNIDADE HORTOLANDIA', 'PARQUE ORTOLANDIA', 'HUGO GEGEMBAUER PASTOR', 'RUA', '265'),
(19, 'COLEGIO ANGLO UNIDADE HORTOLANDIA', 'JARDIM ROSOLEM', 'ORLANDO PAVAN', 'RUA', '635'),
(20, 'COLEGIO PRIMEIRO MUNDO', 'CHACARAS ACARAI', 'WILLI PAUL BARANSKI', 'CAMINHO', '236'),
(21, 'COLEGIO TRILHA DAS LETRAS', 'LOTEAMENTO REMANSO CAMPINEIRO', 'RUA CAPITAO LOURIVAL MEY', 'RUA', '300'),
(22, 'CONCEICAO APARECIDA TERZA GOMES CARDINALES PROFESSORA', 'JARDIM AMANDA II', 'RUA VISCONDE DO RIO BRANCO', 'RUA', '100'),
(23, 'CRBALBINO ESCOLA DE EDUCACAO INFANTIL LTDA ME', '', 'ALDA LOURENCO FRANCISCO', '', '502'),
(24, 'CRISTIANE CHAVES MOREIRA BRAGA PROFESSORA', 'JARDIM SANTANA', 'FABIANO PINHEIRO DA SILVA', 'RUA', '40'),
(25, 'EDUCANDARIO SILVINO FARIA', 'JARDIM SANTA IZABEL', 'CIRCULAR DO SITIO DE RECREIO II', '', '243'),
(26, 'ELISEO MARSON PROFESSOR', 'JARDIM AMANDA', 'RUA OSWALD DE ANDRADE', 'RUA', '255'),
(27, 'EMEF DAYLA CRISTINA SOUZA DE AMORIM', 'JARDIM SANTIAGO', 'RUA SALVADOR', 'RUA', '500'),
(28, 'EMEF SAMUEL DA SILVA MENDONCA', 'JARDIM NOVA EUROPA', 'RUA SAO LUIZ', 'RUA', '276'),
(29, 'EMEI OLINDA MARIA DE JESUS SOUZA', 'JARDIM SUMAREZINHO', 'RUA ANTONIO BAIRRAL', 'RUA', '160'),
(30, 'EMEI PROFESSORA IZABEL SOSTENA DE SOUZA', 'JARDIM NOVO ANGULO', 'AVENIDA SABINA BAPTISTA DE CAMARGO', '', 'SN'),
(31, 'EMEIEF JARDIM SANTA AMELIA HUMBERTO DE AMORIM LOPES', 'JARDIM SANTA AMELIA', 'RUA DOS CURIOS', 'RUA', '42'),
(32, 'EMEIEF LUIZA VITORIA OLIVEIRA CRUZ', 'PARQUE ORESTES ONGARO', 'DOMINGOS BATISTA DE SOUZA', 'RUA', '455'),
(33, 'EMILIANO SANCHEZ EMEI', 'JARDIM SANTA CLARA DO LAGO II', 'CANADA', '', '100'),
(34, 'ESCOLA DE EDUCACAO INFANTIL LITTERA VIVA EIRELI', 'PARQUE HORTOLANDIA', 'PASTOR HUGO GEGEMBAUER', '', '686'),
(35, 'ESCOLA ESATEC EDUCACIONAL UNIDADE HORTOLANDIA', 'LOTEAMENTO ADVENTISTA CAMPINEIRO', 'ERNESTO ROTH PASTOR', 'RUA', '385'),
(36, 'ESCOLA MUNICIPAL DE ED INFANTIL MIGUEL CAMILLO', 'JARDIM TERRAS DE SANTO ANTONIO', 'RUA ANTONIO GAZETTA', 'RUA', '53'),
(37, 'ESCOLA MUNICIPAL DE EDUCACAO BASICA JOSIAS DA SILVA MACEDO', 'JARDIM NOSSA SENHORA DE FATIMA', 'MANOEL ANTONIO DA SILVA', 'RUA', '365'),
(38, 'ESCOLA MUNICIPAL DE EDUCACAO INFANTIL JARDIM INTERLAGOS', 'JARDIM INTERLAGOS', 'RIO CORUMBA', 'ANEXO A EMEB JARDIM', 'SN'),
(39, 'ESCOLA MUNICIPAL DE EDUCACAO INFANTIL JARDIM NOVO CAMBUI', 'JARDIM NOVO CAMBUI', 'RUA NAIR FERREIRA COELHO', 'RUA', '725'),
(40, 'ESCOLA MUNICIPAL DE EDUCACAO INFANTIL JARDIM NOVO ESTRELA', 'JARDIM NOVO ESTRELA', '', '2', ''),
(41, 'ETEC DE HORTOLANDIA', 'JARDIM SANTANA', 'RUA CAPITAO LOURIVAL MEY', 'RUA', '750'),
(42, 'ETEP ESCOLA TECNICA DE ENSINO PROFISSIONALIZANTE', 'JARDIM MIRANTE', 'RUA PEDRO PEREIRA DOS SANTOS', 'RUA', '296'),
(43, 'EUZEBIO ANTONIO RODRIGUES PROFESSOR', 'JARDIM AMANDA II', 'AVENIDA BRASIL', 'AVENIDA', 'SN'),
(44, 'FERNANDA D PERISSINOTTO S FARIA EDUCACAO INFANTIL', 'JARDIM RESIDENCIAL FIRENZE', 'FRANCISCO GLICERIO', '', '331'),
(45, 'FERNANDA GRAZIELLE RESENDE COVRE EMEF', 'JARDIM ADELAIDE', 'RUA JOAO GASTALDI', 'RUA', '430'),
(46, 'GABER EMPREENDIMENTOS EDUCACIONAIS', 'JARDIM SANTA IZABEL', 'RUA ERCILIO ANTONIO MEIRA', 'RUA', '74'),
(47, 'GIRASSOL RECREACAO E EDUCACAO INFANTIL LTDA ME', '', 'RUA DELMIRA ANTONIA DE JESUS', '', '475'),
(48, 'GUIDO ROSOLEN', 'JARDIM ROSOLEM', 'GUIDO ROSOLEM', 'RUA', '201'),
(49, 'HEDY MADALENA BOCCHI PROFESSORA', 'JARDIM EVEREST', 'RUA PICO DO ITATIAIA', 'RUA', '333'),
(50, 'HELENA FUTAVA TAKAHASHI PROFESSORA EMEF', 'JARDIM CAMPOS VERDES', 'RUA DA CONFIBRA', '', '55'),
(51, 'HONORINO FABBRI DOUTOR', 'JARDIM SUMAREZINHO', 'RUA OSORIO CANDIDO DA SILVA', 'RUA', '179'),
(52, 'HORTOLANDIA DEPARTAMENTO DE EDUCACAO DE', 'TERRA PRETA', 'RODOVIA JORNALISTA FRANCISCO DE AGUIRRE PROENCA', '', 'KM 13'),
(53, 'IFSP - CAMPUS HORTOLANDIA', 'VILA SAO PEDRO', 'AVENIDA THEREZA ANA CECON BREDA', '', 'SN'),
(54, 'INOVACAO ESCOLA EDUCACAO INFANTIL FUNDAMENTAL E MEDIO', 'REMANSO CAMPINEIRO', 'RUA ZACARIAS COSTA CAMARGO', 'RUA', '65'),
(55, 'INSTITUTO BATISTA BOAS NOVAS DE EDUCACAO E ASSISTENCIA', 'JARDIM ROSOLEM', 'RUA ORLANDO PAVAN', 'RUA', '67'),
(56, 'INSTITUTO EDUCACIONAL CREPALDI', 'REMANSO CAMPINEIRO', 'RUA ZACHARIAS COSTA CAMARGO', '', '310'),
(57, 'JANILDE FLORES GABY DO VALE PROFA ESC MUN DE ENS FUNDAMENTAL', 'VILA REAL', 'AVENIDA PROFESSORA EDNA APARECIDA PAMPA DA FONSECA', 'RUA', '115'),
(58, 'JARDIM ADELAIDE EMEIEF', 'JARDIM ADELAIDE', 'RUA JULIO CESAR NASCIMENTO', 'RUA', '355'),
(59, 'JARDIM ALINE', 'JARDIM SANTIAGO', 'BENEDITA TEODORO DA SILVA', 'RUA', '848'),
(60, 'JARDIM AMANDA I EMEF- CAIC', 'JARDIM AMANDA', 'RUA GRACILIANO RAMOS', 'RUA', '698'),
(61, 'JARDIM AMANDA I EMEI', 'JARDIM AMANDA', 'RUA GRACILIANO RAMOS', 'RUA', '698'),
(62, 'JARDIM AMANDA II EMEI', 'JARDIM AMANDA', 'RUA BRIGADEIRO FARIA LIMA', 'RUA', '280'),
(63, 'JARDIM AMANDA III EMEI', 'JARDIM AMANDA I', 'JOSE BONIFACIO', 'RUA', '130'),
(64, 'JARDIM BOA ESPERANCA JOSE ROQUE DE MOURA EMEF', 'JARDIM BOA ESPERANCA', 'RUA DO CANARIO', 'RUA', '400'),
(65, 'JARDIM INTERLAGOS ESCOLA MUNCIPAL DE EDUCACAO BASICA', 'JARDIM INTERLAGOS', 'JOAQUIM MARCELINO LEITE', 'RUA', '26'),
(66, 'JARDIM NOSSA SENHORA AUXILIADORA EMEI', 'JARDIM NOSSA SENHORA AUXILIADORA', 'RUA IZADIA FABRICIO DA SILVA', 'RUA', '228'),
(67, 'JARDIM NOSSA SENHORA DE FATIMA EMEI', 'NUCLEO SANTA ISABEL', 'ANTONIO VIEGAS', 'RUA', '45'),
(68, 'JARDIM NOVA EUROPA EMEI', 'JARDIM NOVA EUROPA', 'RUA SAO LUIZ', 'RUA', '276'),
(69, 'JARDIM PRIMAVERA EMEF', 'JARDIM BOA ESPERANCA', 'RUA DA CURRUIRA', 'RUA', '350'),
(70, 'JARDIM SANTA CLARA DO LAGO', 'JARDIM SANTA CLARA LAGO', 'RUA LUIZ DA COSTA CAMARGO', 'RUA', '55'),
(71, 'JARDIM SANTA CLARA DO LAGO I EMEI', 'JARDIM MIRANTE DE SUMARE', 'PRIMEIRO DE MAIO', 'RUA', '15'),
(72, 'JARDIM SANTA EMILIA EMEI', 'JARDIM SUMAREZINHO', 'DOMICIANO MARCELINO DE FARIA', 'RUA', '100'),
(73, 'JARDIM SANTA ESMERALDA EMEI', 'JARDIM SANTA ESMERALDA', 'RUA HELIO MARCELINO', 'RUA', '60'),
(74, 'JARDIM SANTIAGO ESCOLA MUNICIPAL DE EDUCACAO INFANTIL', 'JARDIM SANTIAGO', 'RUA PROJETADA', 'RUA', '500'),
(75, 'JARDIM SAO PEDRO EMEI', 'JARDIM SAO PEDRO', 'RUA DO CARTOLA', '161', 'Numero'),
(76, 'JOAO CALIXTO DA SILVA EMEF', 'JARDIM NOVA BOA VISTA', 'MIGUEL VIEIRA FERREIRA DOUTOR', 'RUA', '454'),
(77, 'JOAO CARLOS DO AMARAL SOARES EMEIF', 'JARDIM NOVA HORTOLANDIA', 'RUA JOSE MARTINS DOS ANJOS', 'RUA', '55'),
(78, 'JONATAS DAVI VISEL DOS SANTOS', 'ADVENTISTA CAMPINEIRO', 'RUA TEREZA LUIZA GONCALVES', 'RUA', '130'),
(79, 'JOSE CLARET DIONISIO PROFESSOR', 'RESIDENCIAL JOAO LUIZ', 'RUA JOSE ALVES PEREIRA', 'RUA', '202'),
(80, 'JOSE NATALINO FONSECA EMEI', 'JARDIM BOA ESPERANCA', 'RUA GARIBALDE', 'RUA', '450'),
(81, 'LENI PEREIRA PRATA EMEIF', 'JARDIM NOVO ANGULO', 'RUA FRANCISCO BERETA', 'RUA', '350'),
(82, 'LIDERANCA ESCOLA TECNICA DE ENSINO EM SAUDE', 'VILA REAL', 'FRANCISCO DE ASSIS SAO', 'AVENIDA', '425'),
(83, 'LILIAN CRISTIANE MARTINS DE ARAUJO PROFESSORA EMEF', 'JARDIM ESTEFANIA', 'RUA ROSENO PEREIRA ANTIGA RUA DOIS', 'RUA', '325'),
(84, 'LIOMAR FREITAS CAMARA PROFESSORA', 'VILA REAL CONTINUACAO', 'RUA EDINA APARECIDA BAMPA FONSECA', 'RUA', '29'),
(85, 'MANOEL IGNACIO DA SILVA', 'VILA SAO FRANCISCO', 'RUA LUIZ CAMILO DE CAMARGO', 'RUA', '355'),
(86, 'MARIA ANTONIETTA GARNERO LA FORTEZZA PROFESSORA', 'JARDIM NOVO ANGULO', 'RUA OSWALDO SOUZA', 'AVENIDA', '355'),
(87, 'MARIA CELIA CABRAL AMARAL PROFA EMEF', 'JARDIM AMANDA', 'RUA AUGUSTO DOS ANJOS', 'RUA', '1275'),
(88, 'MARIA CRISTINA DE SOUZA LOBO PROFESSORA', 'JARDIM NOVA EUROPA', 'ANGRA DOS REIS', 'RUA', '130'),
(89, 'MARIA RITA ARAUJO COSTA PROFESSORA', 'VILA SAO PEDRO', 'RUA ERNESTO BERGAMASCO', 'RUA', '665'),
(90, 'MARISTELA CAROLINA MELLIN', 'JARDIM MINDA', 'RUA VALDEVINO ISIDORO MARCIANO', 'RUA', '174'),
(91, 'MARLECIENE PRISCILA PRESTA BONFIM PROFESSORA EMEF', 'REMANSO CAMPINEIRO', 'RUA MARIA LOURDES CANGLERIANE CANCIAN', 'RUA', '92'),
(92, 'NICOLAS THIAGO DOS SANTOS LOFRANI EMEF', 'JARDIM SUMAREZINHO', 'RUA LEALDO JOSE DOS SANTOS', 'RUA', '170'),
(93, 'PATOTINHA FELIZ ESCOLA DE EDUCACAO INFANTIL', 'JARDIM AMANDA I', 'FRANCISCO GLICERIO', 'RUA', '155'),
(94, 'PATRICIA MARIA CAPELLATO BASSO PROFESSORA EMEF', 'RESIDENCIAL SAO SEBASTIAO', 'RUA LIRIO DO CAMPO', 'RUA', '155'),
(95, 'PAULINA ROSA PROFESSORA', 'JARDIM SANTA RITA DE CASSIA', 'RUA RENE DESCARTES', 'RUA', '75'),
(96, 'PAULO CAMILO DE CAMARGO', 'JARDIM SAO BENTO', 'RUA CATULO DA PAIXAO CEARENSE', 'RUA', '110'),
(97, 'PECTRUS COLEGIO', 'RESIDENCIAL SAO SEBASTIAO', 'RUA DAS CAMELIAS', 'RUA', '71'),
(98, 'PENITENCIARIA HORTOLANDIA III', 'JARDIM NOVO ANGULO', 'LISANTO', '', 'SN'),
(99, 'PENITENCIARIA ODETE LEITE DE CAMPOS CRITTER HORTOLANDIA II', 'JARDIM NOVO ANGULO', 'LISANTO', 'RUA', 'SN'),
(100, 'PIRILUMI RECREACAO E EDUCACAO INFANTIL PRE ESCOLA LTDA', 'JARDIM AMANDA II', 'RUA AUGUSTO DOS ANJOS', '', '775'),
(101, 'PIRILUMI RECREACAO E EDUCACAO INFANTIL PRE-ESCOLA', 'JARDIM AMANDA II', 'LEILA DINIZ', 'RUA', '229'),
(102, 'PRISCILA FERNANDES DA ROCHA', 'JARDIM AMANDA', 'RUA DANTE DE OLIVEIRA', '', 'SN'),
(103, 'RAQUEL SAES MELHADO DA SILVA PROFESSORA', 'JARDIM NOVA HORTOLANDIA', 'RUA WALDOMIRO CARLOS DA SILVA', 'RUA', '228'),
(104, 'RECREIO ALVORADA', 'PARQUE ORESTES ONGARO', 'RUA RIO MISSISSIPI', 'RUA', '150'),
(105, 'REINO DA ALEGRIA UNIDADE I ESCOLA DE EDUCACAO INFANTIL', 'JARDIM AMANDA I', 'VINICIUS DE MORAES', 'RUA', '725'),
(106, 'RENATO DA COSTA LIMA EMEF', 'JARDIM AMANDA', 'RUA SANTOS DUMONT', 'RUA', '45'),
(107, 'RESIDENCIAL SAO SEBASTIAO II EMEI', 'RESIDENCIAL SAO SEBASTIAO', 'RUA LIRIO', '', ''),
(108, 'ROBERTO RODRIGUES DE AZEVEDO PASTOR', 'CHACARAS FAZENDA COELHO', 'RUA TIBURTINO RODRIGUES NASCIMENTO', 'RUA', 'SN'),
(109, 'ROSIMAR BERTAO GOMES PROFESSORA EMEI', 'JARDIM MINDA', 'RUA GISELE FRANCA GOMES', 'RUA', '78'),
(110, 'SALVADOR ZACHARIAS PEREIRA JUNIOR EMEF', 'JARDIM NOVO ANGULO', 'AVENIDA ADAIL ALVES SILVA', 'AVENIDA', '525'),
(111, 'SESI 437 CENTRO EDUCACIONAL', 'VILA SAO FRANCISCO', 'RUA ANTONIA MANCINI PINELLI', 'RUA', '755'),
(112, 'SF PEREIRA RECREACAO ESTRELINHA DO FUTURO ME', 'JARDIM AMANDA II', 'RUA PADRE FEIJO', 'RUA', '381'),
(113, 'TAQUARA BRANCA AGENOR MIRANDA DA SILVA EMEF', 'JARDIM NOVO HORIZONTE', 'MOACIR DE SOUZA CAMPOS', 'RUA', 'SN'),
(114, 'TARSILA DO AMARAL ESCOLA MUN DE ENSINO FUNDAMENTAL', 'JARDIM AMANDA II', 'RUA VISCONDE DE RIO BRANCO', 'RUA', '160'),
(115, 'TIM-DO-LE-LETRA ESCOLA DE EDUCACAO INFANTIL', 'JARDIM AMANDA I', 'ISABEL PRINCESA', 'AVENIDA', '1470'),
(116, 'VILA REAL SEBASTIANA DAS DORES EMEIF', 'VILA REAL', 'RUA ORLANDO CAVALCANTI', 'RUA', '200'),
(117, 'VILLAGIO GUIRALDELLI EMEF', 'VILLAGIO GHIRALDELLI', 'RUA GABRIEL COSTA CAMARGO', 'RUA', '60'),
(118, 'VIVA MAIS ESCOLA MUNICIPAL DE ENSINO FUNDAMENTAL', 'JARDIM SANTA CLARA DO LAGO II', 'PARAGUAI', 'RUA', '152'),
(119, 'YASUO SASAKI', 'JARDIM SANTA ESMERALDA', 'RUA TURMALINA', 'RUA', '499'),
(120, 'ZENAIDE FERREIRA DE LIRA SEORLIM PROFA EMEI', 'LOTEAMENTO REMANSO CAMPINEIRO', 'JOSE CAMILO DE CAMARGO', 'RUA', '333'),
(121, 'ZILDA ARNS NEUMANN EMEF', 'JARDIM STELLA', 'PORTO VELHO', 'RUA', '249');

-- --------------------------------------------------------

--
-- Estrutura da tabela `escolas_linhas`
--

CREATE TABLE `escolas_linhas` (
  `id_escolas` int(11) NOT NULL,
  `id_linhas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `escolas_linhas`
--

INSERT INTO `escolas_linhas` (`id_escolas`, `id_linhas`) VALUES
(5, 1),
(5, 2),
(18, 3),
(41, 4),
(53, 3),
(53, 4),
(57, 1),
(57, 2),
(84, 1),
(84, 2),
(85, 1),
(85, 2),
(111, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `linhas`
--

CREATE TABLE `linhas` (
  `ID` int(11) NOT NULL,
  `Possui_Vagas` int(11) NOT NULL,
  `Periodo` varchar(40) NOT NULL,
  `CNH_Condutor` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `linhas`
--

INSERT INTO `linhas` (`ID`, `Possui_Vagas`, `Periodo`, `CNH_Condutor`) VALUES
(1, 1, 'Período da Manhã', '0000000000'),
(2, 1, 'Período da Tarde', '0000000000'),
(3, 0, 'Período da Noite', '0000000000'),
(4, 0, 'Período Integral', '0000000000'),
(5, 0, 'Período da Manhã', '1111111111'),
(6, 0, 'Período da Tarde', '1111111111'),
(7, 0, 'Período da Noite', '1111111111'),
(8, 0, 'Período Integral', '1111111111'),
(9, 0, 'Período da Manhã', '2222222222'),
(10, 0, 'Período da Tarde', '2222222222'),
(11, 0, 'Período da Noite', '2222222222'),
(12, 0, 'Período Integral', '2222222222'),
(13, 0, 'Período da Manhã', '3333333333'),
(14, 0, 'Período da Tarde', '3333333333'),
(15, 0, 'Período da Noite', '3333333333'),
(16, 0, 'Período Integral', '3333333333'),
(17, 0, 'Período da Manhã', '4444444444'),
(18, 0, 'Período da Tarde', '4444444444'),
(19, 0, 'Período da Noite', '4444444444'),
(20, 0, 'Período Integral', '4444444444'),
(21, 0, 'Período da Manhã', '5555555555'),
(22, 0, 'Período da Tarde', '5555555555'),
(23, 0, 'Período da Noite', '5555555555'),
(24, 0, 'Período Integral', '5555555555'),
(25, 0, 'Período da Manhã', '6666666666'),
(26, 0, 'Período da Tarde', '6666666666'),
(29, 0, 'Período da Manhã', '7777777777'),
(30, 0, 'Período da Tarde', '7777777777'),
(31, 0, 'Período da Noite', '7777777777'),
(32, 0, 'Período Integral', '7777777777'),
(33, 0, 'Período da Manhã', '8888888888'),
(34, 0, 'Período da Tarde', '8888888888'),
(35, 0, 'Período da Noite', '8888888888'),
(36, 0, 'Período Integral', '8888888888');

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
  ADD PRIMARY KEY (`id_escolas`,`id_linhas`),
  ADD KEY `IdLinhas` (`id_linhas`) USING BTREE;

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT de tabela `escolas`
--
ALTER TABLE `escolas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT de tabela `linhas`
--
ALTER TABLE `linhas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

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
  ADD CONSTRAINT `escolas_linhas_ibfk_1` FOREIGN KEY (`id_escolas`) REFERENCES `escolas` (`ID`),
  ADD CONSTRAINT `escolas_linhas_ibfk_2` FOREIGN KEY (`id_linhas`) REFERENCES `linhas` (`ID`);

--
-- Limitadores para a tabela `linhas`
--
ALTER TABLE `linhas`
  ADD CONSTRAINT `linhas_ibfk_1` FOREIGN KEY (`CNH_Condutor`) REFERENCES `condutores` (`CNH`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
