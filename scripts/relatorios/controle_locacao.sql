/*
GRUPO:
Antonny Silva DRE: 120031917
Bernardo Cunha DRE: 120036446
Frederico Lisbôa DRE: 120059054
Laura Daflon DRE: 120053993
Felipe Paiva DRE: 120017769
*/

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
