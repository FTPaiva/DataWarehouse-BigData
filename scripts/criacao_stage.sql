/*
GRUPO:
Antonny Silva DRE: 120031917
Bernardo Cunha DRE: 120036446
Frederico Lisbôa DRE: 120059054
Laura Daflon DRE: 120053993
Felipe Paiva DRE: 120017769
*/

CREATE TABLE Categoria (
    Cd_Categoria INT PRIMARY KEY,
    Nm_Categoria VARCHAR(50),
    Vl_Valor_por_Dia DECIMAL(10, 2)
);

CREATE TABLE Cliente (
    Cd_Cliente INT PRIMARY KEY,
    Nm_Nome VARCHAR(255),
    Ds_Tipo VARCHAR(20),
    Cd_CNPJ_CPF VARCHAR(20),
    Ds_Endereco VARCHAR(255),
    Nu_Telefone VARCHAR(20),
    Ds_Email VARCHAR(255),
    Nu_CNH VARCHAR(20),
    Dt_Validade_CNH DATE
);

CREATE TABLE Veiculo (
    Cd_Carro INT PRIMARY KEY,
    Nm_Marca VARCHAR(50),
    Nm_Modelo VARCHAR(50),
    Nm_Cor VARCHAR(20),
    Ds_Ar_Condicionado BOOLEAN,
    Ds_Mecanizacao VARCHAR(20),
    Ds_Cadeirinha BOOLEAN,
    Ds_Foto VARCHAR(255),
    Nu_Placa VARCHAR(15),
    Nu_Chassi VARCHAR(50),
    Nm_Combustivel VARCHAR(20),
    Nu_Altura DECIMAL(5,1),
    Nu_Tamanho DECIMAL(10,1),
    Nu_Largura DECIMAL(5,1),
    Cd_Categoria INT,
    Nu_Pressao_Pneu INT,
    FOREIGN KEY (Cd_Categoria) REFERENCES Categoria(Cd_Categoria)
);

CREATE TABLE Patio (
    Cd_Patio INT PRIMARY KEY,
    Nm_Patio VARCHAR(50),
    Ds_Endereco VARCHAR(255)
);

CREATE TABLE Reserva (
    Cd_Reserva INT PRIMARY KEY,
    Dt_Reserva DATE,
    Dt_Entrega DATE,
    Dt_Devolucao DATE,
    Cd_Cliente INT,
    Cd_Carro INT,
    Cd_Situacao VARCHAR(20),
    FOREIGN KEY (Cd_Cliente) REFERENCES Cliente(Cd_Cliente),
    FOREIGN KEY (Cd_Carro) REFERENCES Veiculo(Cd_Carro)
);

CREATE TABLE Locacao (
    Cd_Locacao INT PRIMARY KEY,
    Dt_Data_Retirada_Prevista DATE,
    Dt_Data_Devolucao_Prevista DATE,
    Dt_Data_Devolucao_Realizada DATE,
    Dt_Data_Retirada_Realizada DATE,
    Cd_Patio_Saida INT,
    Cd_Patio_Entrada INT,
    Cd_Cliente INT,
    Ds_Protecao_de_Farol BOOLEAN,
    Ds_Protecao_de_Vidro BOOLEAN,
    FOREIGN KEY (Cd_Cliente) REFERENCES Cliente(Cd_Cliente),
    FOREIGN KEY (Cd_Patio_Saida) REFERENCES Patio(Cd_Patio),
    FOREIGN KEY (Cd_Patio_Entrada) REFERENCES Patio(Cd_Patio)
);
