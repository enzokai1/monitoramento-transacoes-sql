-- Execute como script no MariaDB para criar e preencher a base fictícia.
CREATE DATABASE IF NOT EXISTS portfolio_fraudes;
USE portfolio_fraudes;

CREATE TABLE IF NOT EXISTS transacoes (
    id INT PRIMARY KEY,
    cartao_id CHAR(1) NOT NULL,
    horario DATETIME NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    fraude_simulada TINYINT NOT NULL
);

INSERT IGNORE INTO transacoes (id, cartao_id, horario, valor, fraude_simulada)
VALUES
    (1,  'A', '2026-11-08 10:00:00',  12.00, 0),
    (2,  'A', '2026-11-08 10:02:00',  25.00, 0),
    (3,  'A', '2026-11-08 10:05:00', 350.00, 1),
    (4,  'B', '2026-11-08 11:00:00',  20.00, 0),
    (5,  'B', '2026-11-08 11:04:00',  35.00, 0),
    (6,  'B', '2026-11-08 11:08:00',  18.00, 0),
    (7,  'C', '2026-11-08 12:00:00',   8.00, 0),
    (8,  'C', '2026-11-08 12:01:00',  16.00, 0),
    (9,  'C', '2026-11-08 12:02:00',  24.00, 0),
    (10, 'D', '2026-11-08 13:00:00', 500.00, 1),
    (11, 'E', '2026-11-08 14:00:00',  10.00, 0),
    (12, 'E', '2026-11-08 14:04:00',  30.00, 0),
    (13, 'E', '2026-11-08 14:09:00', 400.00, 1);

SELECT * FROM transacoes ORDER BY id;
