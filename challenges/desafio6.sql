SELECT
  CONCAT(CAST(ROUND(MIN(pn.valor_plano), 2) AS CHAR), '.00') AS faturamento_minimo,
  CAST(ROUND(MAX(pn.valor_plano), 2) AS CHAR) AS faturamento_maximo,
  CAST(ROUND(AVG(pn.valor_plano), 2) AS CHAR) AS faturamento_medio,
  CAST(ROUND(SUM(pn.valor_plano), 2) AS CHAR) AS faturamento_total
FROM
  SpotifyClone.Pessoa p
  JOIN SpotifyClone.Planos pn ON p.id_plano = pn.id_plano;
