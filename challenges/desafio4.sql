SELECT
  p.nome_pessoa AS pessoa_usuaria,
  CASE
    WHEN MAX(r.data_reproducao) >= '2021-01-01' THEN 'Ativa'
    ELSE 'Inativa'
  END AS status_pessoa_usuaria
FROM
  SpotifyClone.Pessoa p
  JOIN SpotifyClone.Reproducao r ON p.id_pessoa = r.id_pessoa
GROUP BY
  p.nome_pessoa
ORDER BY
  p.nome_pessoa ASC;
