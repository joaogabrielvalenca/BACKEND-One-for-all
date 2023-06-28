DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.Planos(
  id_plano INT PRIMARY KEY AUTO_INCREMENT,
  plano_assinatura VARCHAR(45),
  valor_plano FLOAT
) engine = InnoDB;

CREATE TABLE SpotifyClone.Artista(
	id_artista INT PRIMARY KEY AUTO_INCREMENT,
  artista VARCHAR(45) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.Pessoa(
	id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
  nome_pessoa VARCHAR(100) NOT NULL,
  idade_pessoa INT NOT NULL,
  id_plano INT,
  data_assinatura DATE,
  FOREIGN KEY (id_plano) REFERENCES Planos (id_plano)
) engine = InnoDB;

CREATE TABLE SpotifyClone.Seguindo (
	id_artista INT NOT NULL,
  id_pessoa INT NOT NULL,
  CONSTRAINT PRIMARY KEY (id_artista, id_pessoa),
  artistas_seguindo VARCHAR(100),
  FOREIGN KEY (id_pessoa) REFERENCES Pessoa (id_pessoa),
  FOREIGN KEY (id_artista) REFERENCES Artista (id_artista)
) engine = InnoDB;

CREATE TABLE SpotifyClone.Album (
    id_album INT PRIMARY KEY AUTO_INCREMENT,
    nome_album VARCHAR(45) NOT NULL,
    id_artista INT,
    ano_lancamento INT,
    FOREIGN KEY (id_artista) REFERENCES Artista(id_artista),
    INDEX idx_id_artista (id_artista)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.Cancoes (
    id_cancao INT PRIMARY KEY AUTO_INCREMENT,
    cancao VARCHAR(45),
    duracao_cancoes INT,
    id_album INT,
    FOREIGN KEY (id_album) REFERENCES Album (id_album)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.Reproducao (
    id_pessoa INT NOT NULL,
    id_cancao INT NOT NULL,
    CONSTRAINT PRIMARY KEY (id_pessoa, id_cancao),
    data_reproducao DATETIME NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES Pessoa (id_pessoa),
    FOREIGN KEY (id_cancao) REFERENCES Cancoes (id_cancao)
) engine = InnoDB;

  INSERT INTO SpotifyClone.Planos (plano_assinatura, valor_plano)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);
  
INSERT INTO SpotifyClone.Artista (artista)
VALUES
	  ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

  
INSERT INTO SpotifyClone.Pessoa (nome_pessoa, idade_pessoa, id_plano, data_assinatura)
VALUES
  ('Barbara Liskov', 82, 1, '2019-10-20'),
  ('Robert Cecil Martin', 58, 1, '2017-01-06'),
  ('Ada Lovelace', 37, 2, '2017-12-30'),
  ('Martin Fowler', 46, 2, '2017-01-17'),
  ('Sandi Metz', 58, 2, '2018-04-29'),
  ('Paulo Freire', 19, 3, '2018-02-14'),
  ('Bell Hooks', 26, 3, '2018-01-05'),
  ('Christopher Alexander', 85, 4, '2019-06-05'),
  ('Judith Butler', 45, 4, '2020-05-13'),
  ('Jorge Amado', 58, 4, '2017-02-17');

INSERT INTO SpotifyClone.Album (nome_album, ano_lancamento, id_artista)
VALUES 
  ('Renaissance', 2022, 1),
  ('Jazz', 1978, 2),
  ('Hot Space', 1982, 2),
  ('Falso Brilhante', 1998, 3),
  ('Vento de Maio', 2001, 3),
  ('QVVJFA?', 2003, 4),
  ('Somewhere Far Beyond', 2007, 5),
  ('I Put A Spell On You', 2012, 6);
    
INSERT INTO SpotifyClone.Cancoes (cancao, duracao_cancoes, id_album)
VALUES
	  ('BREAK MY SOUL', 279, 1),
    ("VIRGO'S GROOVE", 369, 1),
    ('ALIEN SUPERSTAR', 116,1),
    ("Don't Stop Me Now", 203, 2),
    ('Under Pressure', 152, 3),
    ('Como Nossos Pais', 105, 4),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
    ('Samba em Paris', 267, 6),
    ("The Bard's Song", 244, 7),
    ('Feeling Good', 100, 8);

INSERT INTO SpotifyClone.Seguindo (id_artista, id_pessoa, artistas_seguindo)
VALUES
  (1, 1, 'Beyoncé'),
  (2, 1, 'Queen'),
  (3, 1, 'Elis Regina'),
  (1, 2, 'Beyoncé'),
  (3, 2, 'Elis Regina'),
  (2, 3, 'Queen'),
  (4, 4, 'Baco Exu do Blues'),
  (5, 5, 'Blind Guardian'),
  (6, 5, 'Nina Simone'),
  (6, 6, 'Nina Simone'),
  (1, 6, 'Beyoncé'),
  (6, 7, 'Nina Simone'),
  (3, 9, 'Elis Regina'),
  (2, 10, 'Queen');

INSERT INTO SpotifyClone.Reproducao (id_pessoa, id_cancao, data_reproducao)
VALUES
  (1, 2, "2020-05-02 05:30:35" ),
	(1, 8, "2022-02-28 10:45:55"),
  (1, 10, "2020-03-06 11:22:33"),    
	(2, 10, "2022-08-05 08:05:17"),
  (2, 7, "2020-01-02 07:40:33"),
	(3, 10, "2020-11-13 16:55:13"),
  (3, 2, "2020-12-05 18:38:30"),
	(4, 8, "2021-08-15 17:10:10"),
	(5, 8, "2022-01-09 01:44:33"),
  (5, 5, "2020-08-06 15:23:43"),
	(6, 7, "2017-10-12 12:35:20"),
  (6, 1, "2017-01-24 00:31:17"),
	(7, 4, "2011-12-15 22:30:49"),
	(8, 4, "2012-03-17 14:56:41"),
	(9, 9, "2022-02-24 21:14:22"),
	(10, 3,"2015-12-13 08:30:22");
