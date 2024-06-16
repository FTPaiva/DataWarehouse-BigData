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
    COUNT(*) AS QuantidadeAlugados,
    C.Endereco AS CidadeOrigemCliente
FROM
    FatoLocacao L
    JOIN DimVeiculo V ON L.VeiculoID = V.VeiculoID
    JOIN DimCliente C ON L.ClienteID = C.ClienteID
GROUP BY
    V.Marca, V.Modelo, C.Endereco
ORDER BY
    QuantidadeAlugados DESC;
