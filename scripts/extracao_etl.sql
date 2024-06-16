-- Extração dos dados do Banco 1 para a área de stage
INSERT INTO Stage.Cliente (ClienteID, Nome, Tipo, CNPJ_CPF, Endereco, Telefone, Email, CNH, Validade_CNH)
SELECT ID_Cliente, Nome, Tipo_Cliente, Documento, CONCAT(Rua, ', ', Numero, ' ', Bairro, ', ', Cidade, ' - ', Estado), Telefone, Email, CNH, Data_Validade_CNH
FROM Banco1.Clientes JOIN Banco1.Endereco ON Clientes.ID_Endereco = Endereco.ID_Endereco;

INSERT INTO Stage.Veiculo (VeiculoID, Marca, Modelo, Cor, Ar_Condicionado, Mecanizacao, Cadeirinha, Foto, Placa, Chassi, Combustivel, Altura, Tamanho, Largura, CategoriaID)
SELECT ID_Veículo, Marca, Modelo, Cor, Ar_Condicionado, Mecanização, Cadeirinha, Link_Fotos, Placa, NULL, NULL, NULL, Tamanho_Mala, Carga_Maxima, ID_Grupo
FROM Banco1.Veículos;

INSERT INTO Stage.Patio (PatioID, Nome, Endereco)
SELECT ID_Pátio, NULL, CONCAT(Rua, ', ', Numero, ' ', Bairro, ', ', Cidade, ' - ', Estado)
FROM Banco1.Pátios JOIN Banco1.Endereco ON Pátios.ID_Endereco = Endereco.ID_Endereco;

INSERT INTO Stage.Reserva (ReservaID, ClienteID, VeiculoID, PatioID, DataReserva, DataPrevistaRetirada, DataPrevistaDevolucao)
SELECT ID_Reserva, ID_Cliente, ID_Veículo, Pátio_Retirada, Data_Reserva, Data_Início, Data_Fim
FROM Banco1.Reservas;

INSERT INTO Stage.Locacao (LocacaoID, ClienteID, VeiculoID, PatioRetiradoID, PatioDevolucaoID, DataRetirada, DataDevolucao, Devolvido)
SELECT ID_Locação, ID_Cliente, ID_Veículo, Pátio_Retirada, Pátio_Devolução, Data_Retirada, Data_Devolução_Realizada, CASE Status_Locação WHEN 'Concluída' THEN TRUE ELSE FALSE END
FROM Banco1.Locações;


-- Extração dos dados do Banco 1 para a área de stage
INSERT INTO Stage.Cliente (ClienteID, Nome, Tipo, CNPJ_CPF, Endereco, Telefone, Email, CNH, Validade_CNH)
SELECT Cd_Cliente, Nm_Nome, Ds_Tipo, Cd_CNPJ_CPF, Ds_Endereco, Nu_Telefone, Ds_Email, Nu_CNH, Dt_Validade_CNH
FROM Banco2.Cliente;

INSERT INTO Stage.Veiculo (VeiculoID, Marca, Modelo, Cor, Ar_Condicionado, Mecanizacao, Cadeirinha, Foto, Placa, Chassi, Combustivel, Altura, Tamanho, Largura, CategoriaID)
SELECT Cd_Carro, Nm_Marca, Nm_Modelo, Nm_Cor, Ds_Ar_Condicionado, Ds_Mecanizacao, NULL, Ds_Foto, Nu_Placa, Nu_Chassi, Nm_Combustivel, Nu_Altura, Nu_Tamanho, Nu_Largura, Cd_Categoria
FROM Banco2.Veiculo;

INSERT INTO Stage.Patio (PatioID, Nome, Endereco)
SELECT Cd_Patio, Nm_Patio, NULL
FROM Banco2.Patio;

INSERT INTO Stage.Reserva (ReservaID, ClienteID, VeiculoID, PatioID, DataReserva, DataPrevistaRetirada, DataPrevistaDevolucao)
SELECT Cd_Reserva, Cd_Cliente, Cd_Carro, Cd_Patio, Dt_Reserva, Dt_Entrega, Dt_Devolucao
FROM Banco2.Reserva;

INSERT INTO Stage.Locacao (LocacaoID, ClienteID, VeiculoID, PatioRetiradoID, PatioDevolucaoID, DataRetirada, DataDevolucao, Devolvido)
SELECT Cd_Locacao, Cd_Cliente, Cd_Carro, Cd_Patio_Saida, Cd_Patio_Entrada, Dt_Data_Retirada_Realizada, Dt_Data_Devolucao_Realizada, FALSE
FROM Banco2.Locacao;

-- Extração dos dados do Banco 3 para a área de stage
INSERT INTO Stage.Cliente (ClienteID, Nome, Tipo, CNPJ_CPF, Endereco, Telefone, Email, CNH, Validade_CNH)
SELECT ID_Cliente, Nome, Tipo, CPF_CNPJ, Endereco, Telefone, Email, Numero_CNH, Validade_CNH
FROM Banco3.Cliente;

INSERT INTO Stage.Veiculo (VeiculoID, Marca, Modelo, Cor, Ar_Condicionado, Mecanizacao, Cadeirinha, Foto, Placa, Chassi, Combustivel, Altura, Tamanho, Largura, CategoriaID)
SELECT ID_Veiculo, Marca, Modelo, Cor, Ar_Condicionado, NULL, NULL, Foto_URL, Placa, NULL, NULL, NULL, Dimensoes, NULL, Grupo_Categoria
FROM Banco3.Veiculo;

INSERT INTO Stage.Patio (PatioID, Nome, Endereco)
SELECT ID_Patio, Nome, Endereco
FROM Banco3.Patio;

INSERT INTO Stage.Reserva (ReservaID, ClienteID, VeiculoID, PatioID, DataReserva, DataPrevistaRetirada, DataPrevistaDevolucao)
SELECT ID_Reserva, ID_Cliente, ID_Veiculo, NULL, Data_Reserva, Data_Retirada, Data_Devolucao
FROM Banco3.Reserva;

INSERT INTO Stage.Locacao (LocacaoID, ClienteID, VeiculoID, PatioRetiradoID, PatioDevolucaoID, DataRetirada, DataDevolucao, Devolvido)
SELECT ID_Locacao, R.ID_Cliente, R.ID_Veiculo, L.Patio_Saida, L.Patio_Chegada, L.Data_Retirada, L.Data_Devolucao, FALSE
FROM Banco3.Locacao L JOIN Banco3.Reserva R ON L.ID_Reserva = R.ID_Reserva;

-- Extração dos dados do Banco 4 para a área de stage
INSERT INTO Stage.Cliente (ClienteID, Nome, Tipo, CNPJ_CPF, Endereco, Telefone, Email, CNH, Validade_CNH)
SELECT ID, Nome, CASE WHEN PessoaFisica THEN 'Pessoa Física' ELSE 'Pessoa Jurídica' END, CPF_CNPJ, Endereco, Telefone, Email, CNH, ExpiracaoCNH
FROM Banco4.Clientes;

INSERT INTO Stage.Veiculo (VeiculoID, Marca, Modelo, Cor, Ar_Condicionado, Mecanizacao, Cadeirinha, Foto, Placa, Chassi, Combustivel, Altura, Tamanho, Largura, CategoriaID)
SELECT ID, Marca, Modelo, Cor, ArCondicionado, CASE WHEN MecanizacaoAutomatica THEN 'Automática' ELSE 'Manual' END, Cadeirinha, Foto, Placa, Chassis, NULL, NULL, NULL, NULL, NULL
FROM Banco4.Veiculo;

INSERT INTO Stage.Patio (PatioID, Nome, Endereco)
SELECT ID, Nome, Localizacao
FROM Banco4.Patio;

INSERT INTO Stage.Reserva (ReservaID, ClienteID, VeiculoID, PatioID, DataReserva, DataPrevistaRetirada, DataPrevistaDevolucao)
SELECT ID, ClienteId, VeiculoId, PatioId, DataReserva, DataPrevistaRetirada, DataPrevistaDevolucao
FROM Banco4.Reservas;

INSERT INTO Stage.Locacao (LocacaoID, ClienteID, VeiculoID, PatioRetiradoID, PatioDevolucaoID, DataRetirada, DataDevolucao, Devolvido)
SELECT ID, ClienteId, VeiculoId, PatioRetiradoId, PatioDevolucaoId, DataRetirada, DataDevolucao, Devolvido
FROM Banco4.Locacao;
