-- Execute depois de 01_base_simulada.sql.
USE portfolio_fraudes;

-- Conte as compras do mesmo cartão em cada janela, incluindo a compra atual.
-- Para horários iguais, o ID determina a ordem na simulação.
WITH contagens AS (
    SELECT
        atual.id,
        SUM(CASE
            WHEN anterior.horario >= atual.horario - INTERVAL 5 MINUTE
            THEN 1 ELSE 0
        END) AS compras_5_min,
        COUNT(*) AS compras_10_min
    FROM transacoes AS atual
    JOIN transacoes AS anterior
        ON anterior.cartao_id = atual.cartao_id
        AND anterior.horario >= atual.horario - INTERVAL 10 MINUTE
        AND (
            anterior.horario < atual.horario
            OR (anterior.horario = atual.horario AND anterior.id <= atual.id)
        )
    GROUP BY atual.id
)
SELECT
    t.id,
    t.cartao_id,
    t.horario,
    t.valor,
    c.compras_5_min,
    c.compras_10_min,
    CASE WHEN c.compras_5_min >= 3 THEN 1 ELSE 0 END AS alerta_5_min,
    CASE WHEN c.compras_10_min >= 3 THEN 1 ELSE 0 END AS alerta_10_min,
    t.fraude_simulada
FROM transacoes AS t
JOIN contagens AS c ON c.id = t.id
ORDER BY t.id;
