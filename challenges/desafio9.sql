SELECT COUNT(*) AS musicas_no_historico
FROM SpotifyClone.Reproducao
WHERE id_pessoa = (
    SELECT id_pessoa
    FROM SpotifyClone.Pessoa
    WHERE nome_pessoa = 'Barbara Liskov'
);
