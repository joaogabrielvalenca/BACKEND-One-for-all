SELECT
    s.artistas_seguindo AS artista,
    al.nome_album AS album,
    COUNT(DISTINCT s.id_pessoa) AS pessoas_seguidoras
FROM
    SpotifyClone.Album al
    JOIN SpotifyClone.Seguindo s ON al.artista = s.artistas_seguindo
GROUP BY
    s.artistas_seguindo,
    al.nome_album
ORDER BY
    pessoas_seguidoras DESC,
    artista ASC,
    album ASC;
