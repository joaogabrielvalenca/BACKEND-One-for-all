CREATE TABLE SpotifyClone.Favoritas(
  id_pessoa INT NOT NULL,
  id_cancao INT NOT NULL,
  FOREIGN KEY (id_pessoa) REFERENCES Pessoa (id_pessoa),
  FOREIGN KEY (id_cancao) REFERENCES Cancoes (id_cancao),
  CONSTRAINT PRIMARY KEY (id_pessoa, id_cancao)
) engine = InnoDB;

INSERT INTO SpotifyClone.Favoritas (id_pessoa, id_cancao)
VALUES
  (1, 3),
  (1, 6),
  (1, 10),
  (2, 4),
  (3, 1),
  (3, 3),
  (4, 7),
  (4, 4),
  (5, 10),
  (5, 2),
  (8, 4),
  (9, 7),
  (10, 3);

