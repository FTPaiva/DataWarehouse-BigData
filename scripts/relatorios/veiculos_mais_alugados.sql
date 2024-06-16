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
