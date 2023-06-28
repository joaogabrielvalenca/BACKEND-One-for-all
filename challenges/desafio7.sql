SELECT
  a.artista AS artista,
  al.nome_album AS album,
  COUNT(DISTINCT s.id_pessoa) AS pessoas_seguidoras
FROM
  SpotifyClone.Artista a
  JOIN SpotifyClone.Album al ON a.id_artista = al.id_artista
  LEFT JOIN SpotifyClone.Seguindo s ON a.id_artista = s.id_artista
GROUP BY
  a.artista,
  al.nome_album
ORDER BY
  pessoas_seguidoras DESC,
  a.artista,
  album;
