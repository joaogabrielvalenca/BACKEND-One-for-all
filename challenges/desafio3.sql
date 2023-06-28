SELECT
  P.nome_pessoa AS pessoa_usuaria,
  COUNT(R.id_cancao) AS musicas_ouvidas,
  ROUND(SUM(C.duracao_cancoes) / 60, 2) AS total_minutos
FROM
  SpotifyClone.Pessoa P
  JOIN SpotifyClone.Reproducao R ON P.id_pessoa = R.id_pessoa
  JOIN SpotifyClone.Cancoes C ON R.id_cancao = C.id_cancao
GROUP BY
  P.nome_pessoa
ORDER BY
  P.nome_pessoa ASC;
