SELECT
  historico_reproducao AS cancao,
  COUNT(DISTINCT id_pessoa) AS reproducoes
FROM
  SpotifyClone.Reproducao
GROUP BY
  historico_reproducao
ORDER BY
  reproducoes DESC, cancao ASC
LIMIT 2;
