SELECT
  P.nome_pessoa AS pessoa_usuaria,
  CASE WHEN MAX(R.data_reproducao) >= '2021-01-01' THEN 'Ativa' ELSE 'Inativa' END AS status_pessoa_usuaria
FROM
  SpotifyClone.Pessoa P
  LEFT JOIN SpotifyClone.Reproducao R ON P.id_pessoa = R.id_pessoa
GROUP BY
  P.id_pessoa, P.nome_pessoa
ORDER BY
  P.nome_pessoa ASC;
