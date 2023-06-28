SELECT a.artista, 
  CASE
      WHEN COUNT(f.id_cancao) >= 5 THEN 'A'
      WHEN COUNT(f.id_cancao) BETWEEN 3 AND 4 THEN 'B'
      WHEN COUNT(f.id_cancao) BETWEEN 1 AND 2 THEN 'C'
      ELSE '-'
  END AS ranking
FROM SpotifyClone.Artista AS a
LEFT JOIN SpotifyClone.Album AS al ON a.id_artista = al.id_artista
LEFT JOIN SpotifyClone.Cancoes AS c ON al.id_album = c.id_album
LEFT JOIN SpotifyClone.Favoritas AS f ON c.id_cancao = f.id_cancao
GROUP BY a.id_artista
ORDER BY COUNT(f.id_cancao) DESC, a.artista ASC;
