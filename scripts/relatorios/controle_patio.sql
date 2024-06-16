SELECT
    P.Nome AS NomePatio,
    V.Marca,
    V.Modelo,
    V.Mecanizacao,
    COUNT(*) AS Quantidade
FROM
    FatoLocacao L
    JOIN DimVeiculo V ON L.VeiculoID = V.VeiculoID
    JOIN DimPatio P ON L.PatioRetiradoID = P.PatioID
WHERE
    L.Devolvido = FALSE
GROUP BY
    P.Nome, V.Marca, V.Modelo, V.Mecanizacao;
