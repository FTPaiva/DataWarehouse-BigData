/*
GRUPO:
Antonny Silva DRE: 120031917
Bernardo Cunha DRE: 120036446
Frederico Lisbôa DRE: 120059054
Laura Daflon DRE: 120053993
Felipe Paiva DRE: 120017769
*/

-- Carga dos dados de reservas
INSERT INTO FatoReserva (ReservaID, ClienteID, VeiculoID, PatioID, DataReserva, DataPrevistaRetirada, DataPrevistaDevolucao, CarroRetirado, ValorReserva)
SELECT ReservaID, ClienteID, VeiculoID, PatioID, DataReserva, DataPrevistaRetirada, DataPrevistaDevolucao, FALSE, 0.00
FROM Stage.Reserva;

-- Carga dos dados de locações
INSERT INTO FatoLocacao (LocacaoID, ClienteID, VeiculoID, PatioRetiradoID, PatioDevolucaoID, DataRetirada, DataDevolucao, Devolvido, ProtecoesAdicionais, EstadoEntrega, EstadoDevolucao)
SELECT LocacaoID, ClienteID, VeiculoID, PatioRetiradoID, PatioDevolucaoID, DataRetirada, DataDevolucao, Devolvido, '', '', ''
FROM Stage.Locacao;
