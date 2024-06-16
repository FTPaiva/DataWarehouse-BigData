SELECT
    P.Nome AS NomePatio,
    V.Marca,
    V.Modelo,
    COUNT(*) AS QuantidadeReservas,
    C.Endereco AS CidadeOrigemCliente,
    DATEPART(WEEK, R.DataPrevistaRetirada) AS SemanaReserva,
    DATEPART(MONTH, R.DataPrevistaRetirada) AS MesReserva
FROM
    FatoReserva R
    JOIN DimVeiculo V ON R.VeiculoID = V.VeiculoID
    JOIN DimPatio P ON R.PatioID = P.PatioID
    JOIN DimCliente C ON R.ClienteID = C.ClienteID
GROUP BY
    P.Nome, V.Marca, V.Modelo, C.Endereco, DATEPART(WEEK, R.DataPrevistaRetirada), DATEPART(MONTH, R.DataPrevistaRetirada);
