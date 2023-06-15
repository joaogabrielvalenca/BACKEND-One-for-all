
SELECT
  p.nome_pessoa AS pessoa_usuaria,
  COUNT(r.historico_reproducao) AS musicas_ouvidas,
  ROUND(SUM(c.duracao_cancoes) / 60, 2) AS total_minutos
FROM
  SpotifyClone.Pessoa p
  JOIN SpotifyClone.Reproducao r ON p.id_pessoa = r.id_pessoa
  JOIN SpotifyClone.Cancoes c ON r.historico_reproducao = c.cancao
GROUP BY
  p.nome_pessoa
ORDER BY
  p.nome_pessoa ASC;
