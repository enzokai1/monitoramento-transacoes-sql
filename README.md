# Monitoramento de transações simuladas com SQL

## Objetivo

Avaliar o que acontece quando uma regra de alerta passa a considerar
as compras dos últimos 10 minutos em vez dos últimos 5.

## Como funciona

A consulta no MariaDB gera um alerta quando o mesmo cartão tem três
ou mais compras dentro da janela, incluindo a compra atual. Usei o
DBeaver para executar a consulta e o LibreOffice Calc para comparar
os alertas em uma tabela dinâmica.

## Resultados

| Indicador | 5 minutos | 10 minutos |
|---|---:|---:|
| Alertas gerados | 2 | 4 |
| Fraudes simuladas sinalizadas | 1 | 2 |
| Compras legítimas sinalizadas | 1 | 2 |
| Fraudes simuladas sem alerta | 2 | 1 |

A janela de 10 minutos sinalizou uma fraude simulada adicional,
mas também sinalizou uma compra legítima a mais. Uma fraude simulada
passou pelas duas regras porque foi uma compra isolada.

A base contém 13 transações fictícias, criadas para testar a lógica
da regra. Os resultados descrevem apenas essa simulação.

## Como reproduzir

1. Execute `01_base_simulada.sql` no MariaDB para criar e preencher a tabela.
2. Execute `02_regras_de_alerta.sql` para comparar as duas janelas.
3. Abra `analise_alertas.ods` no LibreOffice Calc para ver o resumo.
