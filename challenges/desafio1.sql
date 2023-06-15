DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.Pessoa(
	id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
  nome_pessoa VARCHAR(100) NOT NULL,
  idade_pessoa INT NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.Artista(
	id_artista INT PRIMARY KEY AUTO_INCREMENT,
  artista VARCHAR(45) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.Assinatura (
  id_assinatura INT PRIMARY KEY AUTO_INCREMENT,
  id_pessoa INT,
  plano_assinatura VARCHAR(45),
  data_assinatura DATE,
  valor_assinatura DECIMAL,
  FOREIGN KEY (id_pessoa) REFERENCES Pessoa (id_pessoa)
) engine = InnoDB;

CREATE TABLE SpotifyClone.Seguindo (
	id_seguindo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  id_pessoa INT NOT NULL,
  artistas_seguindo VARCHAR(100),
  FOREIGN KEY (id_pessoa) REFERENCES Pessoa (id_pessoa)
) engine = InnoDB;

CREATE TABLE SpotifyClone.Cancoes (
  id_cancao INT PRIMARY KEY AUTO_INCREMENT,
  cancao VARCHAR(45),
  duracao_cancoes INT,
  id_artista INT,
  artista VARCHAR(45) NOT NULL,
  FOREIGN KEY (id_artista) REFERENCES Artista (id_artista),
  INDEX idx_id_artista (id_artista) 
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.Album (
  id_album INT PRIMARY KEY AUTO_INCREMENT,
  nome_album VARCHAR(45) NOT NULL,
  id_artista INT,
  artista VARCHAR(45) NOT NULL,
  ano_lancamento INT,
  id_cancao INT, 
  FOREIGN KEY (id_artista) REFERENCES Artista(id_artista),
  INDEX idx_artista (artista),
  INDEX idx_id_artista (id_artista),
  FOREIGN KEY (id_cancao) REFERENCES Cancoes(id_cancao)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.Reproducao (
	id_reproducao INT PRIMARY KEY AUTO_INCREMENT,
  id_pessoa INT NOT NULL,
  id_album INT NOT NULL,
  historico_reproducao VARCHAR(200) NOT NULL,
  data_reproducao DATETIME NOT NULL,
  artistas_seguindo VARCHAR(100),
  FOREIGN KEY (id_pessoa) REFERENCES Pessoa (id_pessoa),
  FOREIGN KEY (id_album) REFERENCES Album (id_album)
) engine = InnoDB;



INSERT INTO SpotifyClone.Pessoa (nome_pessoa, idade_pessoa)
VALUES
  ('Barbara Liskov', 82),
  ('Robert Cecil Martin', 58),
  ('Ada Lovelace', 37),
  ('Martin Fowler', 46),
  ('Sandi Metz', 58),
  ('Paulo Freire', 19),
  ('Bell Hooks', 26),
  ('Christopher Alexxander', 85),
  ('Judith Butler', 45),
  ('Jorge Amado', 58);
  
  
INSERT INTO SpotifyClone.Artista (artista)
VALUES
	('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');
    
INSERT INTO SpotifyClone.Cancoes (cancao, duracao_cancoes, artista)
VALUES
	('BREAK MY SOUL', 279, 'Beyoncé'),
  ("VIRGO'S GROOVE", 369, 'Beyoncé'),
  ('ALIEN SUPERSTAR', 116, 'Beyoncé'),
  ("Don't Stop Me Now", 203, 'Queen'),
  ('Under Pressure', 152, 'Queen'),
  ('Como Nossos Pais', 105, 'Elis Regina'),
  ('O Medo de Amar é o Medo de Ser Livre', 207, 'Elis Regina'),
  ('Samba em Paris', 267, 'Baco Exu do Blues'),
  ("The Bard's Song", 244, 'Blind Guardian'),
  ('Feeling Good', 100, 'Nina Simone');



INSERT INTO SpotifyClone.Seguindo (id_pessoa, artistas_seguindo)
VALUES
  (1, 'Beyoncé'),
  (1, 'Queen'),
  (1, 'Elis Regina'),
  (2, 'Beyoncé'),
  (2, 'Elis Regina'),
  (3, 'Queen'),
  (4, 'Baco Exu do Blues'),
  (5, 'Blind Guardian'),
  (5, 'Nina Simone'),
  (6, 'Nina Simone'),
  (6, 'Beyoncé'),
  (7, 'Nina Simone'),
  (8, NULL),
  (9, 'Elis Regina'),
  (10, 'Queen');

INSERT INTO SpotifyClone.Album (nome_album, ano_lancamento, artista)
VALUES 
  ('Renaissance', 2022, 'Beyoncé'),
  ('Jazz', 1978, 'Queen'),
  ('Hot Space', 1982, 'Queen'),
  ('Falso Brilhante', 1998, 'Elis Regina'),
  ('Vento de Maio', 2001, 'Elis Regina'),
  ('QVVJFA', 2003, 'Baco Exu do Blues'),
  ('Somewhere Far Beyond', 2007, 'Blind Guardian'),
  ('I Put A Spell On You', 2012, 'Nina Simone');

INSERT INTO SpotifyClone.Assinatura (id_pessoa, plano_assinatura, data_assinatura, valor_assinatura)
VALUES
	(1, 'gratuito', '2019-10-20', 0),
	(2, 'gratuito', '2017-01-06', 0),
	(3, 'familiar', '2017-12-30', 7.99),
	(4, 'familiar', '2017-01-17', 7.99),
	(5, 'familiar', '2018-04-29', 7.99),
	(6, 'universitário', '2018-02-14', 5.99),
	(7, 'universitário', '2018-01-05', 5.99),
	(8, 'pessoal', '2019-06-05', 6.99),
	(9, 'pessoal', '2020-05-13', 6.99),
	(10, 'pessoal', '2017-02-17', 6.99);

INSERT INTO SpotifyClone.Reproducao (id_pessoa, id_album, historico_reproducao, data_reproducao, artistas_seguindo)
VALUES
	(1, 6, "Samba em Paris", "2022-02-28 10:45:55", 'Beyoncé'),
  (1, 1, "VIRGO'S GROOVE", "2020-05-02 05:30:35", 'Queen'),
  (1, 8, "Feeling Good", "2020-03-06 11:22:33", 'Elis Regina'),    
	(2, 8, "Feeling Good", "2022-08-05 08:05:17", 'Beyoncé'),
  (2, 5, "O Medo de Amar é o Medo de Ser Livre",  "2020-01-02 07:40:33",  'Elis Regina'),
	(3, 8,"Feeling Good", "2020-11-13 16:55:13", 'Queen'),
  (3, 1,"VIRGO'S GROOVE", "2020-12-05 18:38:30", 'Queen'),
	(4, 6, "Samba em Paris", "2021-08-15 17:10:10", 'Baco Exu do Blues'),
	(5, 6, "Samba em Paris", "2022-01-09 01:44:33", 'Blind Guardian'),
  (5, 3, "Under Pressure",  "2020-08-06 15:23:43",  'Nina Simone'),
	(6, 5, "O Medo de Amar é o Medo de Ser Livre", "2017-10-12 12:35:20", 'Nina Simone'),
  (6, 1, "BREAK MY SOUL", "2017-01-24 00:31:17" ,  'Beyoncé'),
	(7, 2, "Don't Stop Me Now", "2011-12-15 22:30:49", 'Nina Simone'),
	(8, 2, "Don't Stop Me Now", "2012-03-17 14:56:41", NULL),
	(9, 7, "The Bard's Song", "2022-02-24 21:14:22", 'Elis Regina'),
	(10, 1, "ALIEN SUPERSTAR", "2015-12-13 08:30:22", 'Queen');
