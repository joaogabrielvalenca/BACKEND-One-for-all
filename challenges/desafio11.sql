SELECT a.nome_album AS album, COUNT(f.id_cancao) AS favoritadas
FROM SpotifyClone.Album AS a
INNER JOIN SpotifyClone.Cancoes AS c ON a.id_album = c.id_album
LEFT JOIN SpotifyClone.Favoritas AS f ON c.id_cancao = f.id_cancao
GROUP BY a.id_album
ORDER BY favoritadas DESC, album ASC
LIMIT 3;
