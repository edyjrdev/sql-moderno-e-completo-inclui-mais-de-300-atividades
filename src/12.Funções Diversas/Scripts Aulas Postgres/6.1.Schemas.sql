SELECT d.nome AS departamento, SUM(de.valor) AS total_despesas
FROM contabilidade.despesas de
JOIN rh.departamentos d ON de.departamento_id = d.departamento_id
GROUP BY d.nome;
