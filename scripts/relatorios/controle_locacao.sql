SELECT
    V.Marca,
    V.Modelo,
    V.Mecanizacao,
    COUNT(*) AS QuantidadeAlugados,
    AVG(DATEDIFF(DAY, L.DataRetirada, L.DataDevolucao)) AS TempoMedioLocacao,
    AVG(DATEDIFF(DAY, GETDATE(), L.DataDevolucao)) AS TempoRestanteDevolucao
FROM
    FatoLocacao L
    JOIN DimVeiculo V ON L.VeiculoID = V.VeiculoID
WHERE
    L.Devolvido = FALSE
GROUP BY
    V.Marca, V.Modelo, V.Mecanizacao;
