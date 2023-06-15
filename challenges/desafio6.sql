SELECT
  FORMAT(ROUND(MIN(valor_assinatura), 2), 2) AS faturamento_minimo,
  FORMAT(ROUND(MAX(valor_assinatura), 2), 2) AS faturamento_maximo,
  FORMAT(ROUND(AVG(valor_assinatura), 2), 2) AS faturamento_medio,
  FORMAT(ROUND(SUM(valor_assinatura), 2), 2) AS faturamento_total
FROM
  SpotifyClone.Assinatura;
