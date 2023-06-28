SELECT 
  CASE
    WHEN idade_pessoa <= 30 THEN 'Até 30 anos'
    WHEN idade_pessoa <= 60 THEN 'Entre 31 e 60 anos'
    ELSE 'Maior de 60 anos'
  END AS faixa_etaria,
  COUNT(DISTINCT p.id_pessoa) AS total_pessoas_usuarias,
  COUNT(f.id_pessoa) AS total_favoritadas
FROM SpotifyClone.Pessoa AS p
LEFT JOIN SpotifyClone.Favoritas AS f ON p.id_pessoa = f.id_pessoa
GROUP BY faixa_etaria
ORDER BY 
  CASE faixa_etaria
    WHEN 'Até 30 anos' THEN 1
    WHEN 'Entre 31 e 60 anos' THEN 2
    ELSE 3
  END;
