-- Descomente e altere as linhas abaixo:

-- DROP DATABASE IF EXISTS SpotifyClone;
-- CREATE DATABASE IF NOT EXISTS SpotifyClone;
-- CREATE TABLE SpotifyClone.tabela1(
--     coluna1 tipo restricoes,
--     coluna2 tipo restricoes,
--     colunaN tipo restricoes,
-- ) engine = InnoDB;
-- CREATE TABLE SpotifyClone.tabela2(
--     coluna1 tipo restricoes,
--     coluna2 tipo restricoes,
--     colunaN tipo restricoes,
-- ) engine = InnoDB;
-- INSERT INTO SpotifyClone.tabela1 (coluna1, coluna2)
-- VALUES
--   ('exemplo de dados 1', 'exemplo de dados A'),
--   ('exemplo de dados 2', 'exemplo de dados B'),
--   ('exemplo de dados 3', 'exemplo de dados C');
-- INSERT INTO SpotifyClone.tabela2 (coluna1, coluna2)
-- VALUES
--   ('exemplo de dados 1', 'exemplo de dados X'),
--   ('exemplo de dados 2', 'exemplo de dados Y');

DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.Album(
  	id_album INT PRIMARY KEY AUTO_INCREMENT,
    nome_album VARCHAR(45) NOT NULL,
    artista VARCHAR(45) NOT NULL,
    cancoes VARCHAR(128) NOT NULL,
    duracao_cancoes VARCHAR(45),
    ano_lancamento INT
) engine = InnoDB;

CREATE TABLE SpotifyClone.Pessoa(
	  id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome_pessoa VARCHAR(100) NOT NULL,
    idade_pessoa INT NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.Assinatura (
    id_pessoa INT PRIMARY KEY NOT NULL,
    plano_assinatura VARCHAR(45),
    data_assinatura DATE,
    valor_assinatura VARCHAR(45),
    FOREIGN KEY (id_pessoa) REFERENCES Pessoa (id_pessoa)
) engine = InnoDB;

CREATE TABLE SpotifyClone.Reproducao (
    id_pessoa INT NOT NULL,
    id_album INT NOT NULL,
    historico_reproducao VARCHAR(200) NOT NULL,
    data_reproducao DATETIME NOT NULL,
    artistas_seguindo VARCHAR(100),
    PRIMARY KEY (id_pessoa, id_album),
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
  
INSERT INTO SpotifyClone.Album (nome_album, artista, cancoes, duracao_cancoes, ano_lancamento)
VALUES 
	('Renaissance', 'Beyoncé', 'Break my Soul' "Virgo's Groove" 'Alien Superstar', '279, 369, 116', 2022),
    ('Jazz', 'Queen',  "Don't Stop Me Now", '203', 1978),
    ('Hot Space', 'Queen', 'Under Pressure','152', 1982),
    ('Falso Brilhante', 'Elis Regina', 'Como Nossos Pais', '105', 1998),
    ('Vento de Maio', 'Elis Regina', 'O Medo de Amar é o Medo de Ser Livre', '207', 2001),
    ('QVVJFA', 'Baco Exu do Blues', 'Samba em Paris', '267', 2003),
    ('Somewhere Far Beyond', 'Blind Guardian', "The Bard's Song", '244', 2007),
    ('I Put A Spell On You', 'Nina Simone', 'Feeling Good', '100', 2012);
    
INSERT INTO SpotifyClone.Assinatura (plano_assinatura, data_assinatura, valor_assinatura)
VALUES
	('gratuito', '2019-10-20', '0'),
	('gratuito', '2017-01-06', '0'),
	('familiar', '2017-12-30', '7,99'),
	('familiar', '2017-01-17', '7,99'),
	('familiar', '2018-04-29', '7,99'),
	('universitário', '2018-02-14', '5,99'),
	('universitário', '2018-01-05', '5,99'),
	('pessoal', '2019-06-05', '6,99'),
	('pessoal', '2020-05-13', '6,99'),
	('pessoal', '2017-02-17', '6,99');

INSERT INTO SpotifyClone.Reproducao (historico_reproducao, data_reproducao, artistas_seguindo)
VALUES
	("Samba em Paris" "VIRGO'S GROOVE" "Feeling Good", "2022-02-28 10:45:55" "2020-05-02 05:30:35" "2020-03-06 11:22:33", 'Beyoncé' 'Queen' 'Elis Regina'),    
	("Feeling Good" "O Medo de Amar é o Medo de Ser Livre", "2022-08-05 08:05:17" "2020-01-02 07:40:33", 'Beyoncé' 'Elis Regina'),
	("Feeling Good" "VIRGO'S GROOVE", "2020-11-13 16:55:13" "2020-12-05 18:38:30", 'Queen'),
	("Samba em Paris", "2021-08-15 17:10:10", 'Baco Exu do Blues'),
	("Samba em Paris" "Under Pressure", "2022-01-09 01:44:33" "2020-08-06 15:23:43", 'Blind Guardian' 'Nina Simone'),
	("O Medo de Amar é o Medo de Ser Livre" "BREAK MY SOUL", "2017-01-24 00:31:17" "2017-10-12 12:35:20", 'Nina Simone' 'Beyoncé'),
	("Don't Stop Me Now", "2011-12-15 22:30:49", 'Nina Simone'),
	("Don't Stop Me Now", "2012-03-17 14:56:41", NULL),
	("The Bard's Song", "2022-02-24 21:14:22", 'Elis Regina'),
	("ALIEN SUPERSTAR", "2015-12-13 08:30:22", 'Queen');
