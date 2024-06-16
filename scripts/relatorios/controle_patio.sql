/*
GRUPO:
Antonny Silva DRE: 120031917
Bernardo Cunha DRE: 120036446
Frederico Lisbôa DRE: 120059054
Laura Daflon DRE: 120053993
Felipe Paiva DRE: 120017769
*/

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
