/*
GRUPO:
Antonny Silva DRE: 120031917
Bernardo Cunha DRE: 120036446
Frederico Lisbôa DRE: 120059054
Laura Daflon DRE: 120053993
Felipe Paiva DRE: 120017769
*/

-- Tabelas dimensionais
CREATE TABLE DimCliente (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(255),
    Tipo VARCHAR(20),
    CNPJ_CPF VARCHAR(20),
    Endereco VARCHAR(255),
    Telefone VARCHAR(20),
    Email VARCHAR(255),
    CNH VARCHAR(20),
    Validade_CNH DATE
);

CREATE TABLE DimVeiculo (
    VeiculoID INT PRIMARY KEY,
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Cor VARCHAR(20),
    Ar_Condicionado BOOLEAN,
    Mecanizacao VARCHAR(20),
    Cadeirinha BOOLEAN,
    Foto VARCHAR(255),
    Placa VARCHAR(15),
    Chassi VARCHAR(50),
    Combustivel VARCHAR(20),
    Altura DECIMAL(5,1),
    Tamanho DECIMAL(10,1),
    Largura DECIMAL(5,1),
    CategoriaID INT
);

CREATE TABLE DimPatio (
    PatioID INT PRIMARY KEY,
    Nome VARCHAR(50),
    Endereco VARCHAR(255)
);

CREATE TABLE DimTempo (
    TempoID INT PRIMARY KEY,
    Data DATE,
    Dia INT,
    Mes INT,
    Ano INT,
    Trimestre INT
);

-- Tabelas de fatos
CREATE TABLE FatoReserva (
    ReservaID INT PRIMARY KEY,
    ClienteID INT,
    VeiculoID INT,
    PatioID INT,
    DataReserva DATE,
    DataPrevistaRetirada DATE,
    DataPrevistaDevolucao DATE,
    CarroRetirado BOOLEAN,
    ValorReserva DECIMAL(10,2),
    FOREIGN KEY (ClienteID) REFERENCES DimCliente(ClienteID),
    FOREIGN KEY (VeiculoID) REFERENCES DimVeiculo(VeiculoID),
    FOREIGN KEY (PatioID) REFERENCES DimPatio(PatioID),
    FOREIGN KEY (DataReserva) REFERENCES DimTempo(TempoID)
);

CREATE TABLE FatoLocacao (
    LocacaoID INT PRIMARY KEY,
    ClienteID INT,
    VeiculoID INT,
    PatioRetiradoID INT,
    PatioDevolucaoID INT,
    DataRetirada DATE,
    DataDevolucao DATE,
    Devolvido BOOLEAN,
    ProtecoesAdicionais TEXT,
    EstadoEntrega TEXT,
    EstadoDevolucao TEXT,
    FOREIGN KEY (ClienteID) REFERENCES DimCliente(ClienteID),
    FOREIGN KEY (VeiculoID) REFERENCES DimVeiculo(VeiculoID),
    FOREIGN KEY (PatioRetiradoID) REFERENCES DimPatio(PatioID),
    FOREIGN KEY (PatioDevolucaoID) REFERENCES DimPatio(PatioID),
    FOREIGN KEY (DataRetirada) REFERENCES DimTempo(TempoID),
    FOREIGN KEY (DataDevolucao) REFERENCES DimTempo(TempoID)
);
