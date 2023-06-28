SELECT
  'Elis Regina' AS artista,
  nome_album AS album
FROM
  SpotifyClone.Album
WHERE
  id_artista = (
    SELECT id_artista FROM SpotifyClone.Artista WHERE artista = 'Elis Regina'
  )
ORDER BY
  album ASC;
