SELECT
  (SELECT COUNT(*) FROM SpotifyClone.Cancoes) AS cancoes,
  (SELECT COUNT(*) FROM SpotifyClone.Artista) AS artistas,
  (SELECT COUNT(*) FROM SpotifyClone.Album) AS albuns;
