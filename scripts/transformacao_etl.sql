/*
GRUPO:
Antonny Silva DRE: 120031917
Bernardo Cunha DRE: 120036446
Frederico Lisbôa DRE: 120059054
Laura Daflon DRE: 120053993
Felipe Paiva DRE: 120017769
*/

-- Transformação e integração dos dados dos clientes
INSERT INTO DimCliente (ClienteID, Nome, Tipo, CNPJ_CPF, Endereco, Telefone, Email, CNH, Validade_CNH)
SELECT DISTINCT ClienteID, Nome, Tipo, CNPJ_CPF, Endereco, Telefone, Email, CNH, Validade_CNH
FROM Stage.Cliente;

-- Transformação e integração dos dados dos veículos
INSERT INTO DimVeiculo (VeiculoID, Marca, Modelo, Cor, Ar_Condicionado, Mecanizacao, Cadeirinha, Foto, Placa, Chassi, Combustivel, Altura, Tamanho, Largura, CategoriaID)
SELECT DISTINCT VeiculoID, Marca, Modelo, Cor, Ar_Condicionado, Mecanizacao, Cadeirinha, Foto, Placa, Chassi, Combustivel, Altura, Tamanho, Largura, CategoriaID
FROM Stage.Veiculo;

-- Transformação e integração dos dados dos pátios
INSERT INTO DimPatio (PatioID, Nome, Endereco)
SELECT DISTINCT PatioID, Nome, Endereco
FROM Stage.Patio;
