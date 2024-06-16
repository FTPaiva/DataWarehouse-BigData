/*
GRUPO:
Antonny Silva DRE: 120031917
Bernardo Cunha DRE: 120036446
Frederico Lisbôa DRE: 120059054
Laura Daflon DRE: 120053993
Felipe Paiva DRE: 120017769
*/

WITH Movimentacao AS (
    SELECT
        L.PatioRetiradoID,
        L.PatioDevolucaoID,
        COUNT(*) AS QuantidadeMovimentacoes
    FROM
        FatoLocacao L
    GROUP BY
        L.PatioRetiradoID, L.PatioDevolucaoID
),
TotalMovimentacao AS (
    SELECT
        PatioRetiradoID,
        SUM(QuantidadeMovimentacoes) AS TotalMovimentacoes
    FROM
        Movimentacao
    GROUP BY
        PatioRetiradoID
)
SELECT
    M.PatioRetiradoID,
    M.PatioDevolucaoID,
    (CAST(M.QuantidadeMovimentacoes AS FLOAT) / T.TotalMovimentacoes) * 100 AS PercentualMovimentacao
FROM
    Movimentacao M
    JOIN TotalMovimentacao T ON M.PatioRetiradoID = T.PatioRetiradoID;
