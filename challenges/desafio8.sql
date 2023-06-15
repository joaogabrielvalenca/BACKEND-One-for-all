SELECT
    'Elis Regina' AS artista,
    album.nome_album AS album
FROM
    SpotifyClone.Album album
WHERE
    album.artista = 'Elis Regina'
ORDER BY
    album.nome_album ASC;
