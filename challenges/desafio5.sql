SELECT
  C.cancao,
  COUNT(*) AS reproducoes
FROM
  SpotifyClone.Cancoes C
  INNER JOIN SpotifyClone.Reproducao R ON C.id_cancao = R.id_cancao
GROUP BY
  C.id_cancao, C.cancao
ORDER BY
  reproducoes DESC, C.cancao ASC
LIMIT 2;
