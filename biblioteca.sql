CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

CREATE TABLE Autor (
    autor_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Categoria (
    categoria_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Livro (
    livro_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    fk_autor_id INT NOT NULL,
    fk_categoria_id INT NOT NULL,
    ano_publicacao DATE,
    CONSTRAINT fk_livro_autor FOREIGN KEY (fk_autor_id) REFERENCES Autor(autor_id) ON DELETE CASCADE,
    CONSTRAINT fk_livro_categoria FOREIGN KEY (fk_categoria_id) REFERENCES Categoria(categoria_id) ON DELETE CASCADE
);

CREATE TABLE Estudante (
    estudante_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);

--loan (id, book_id, student_id, data_retirada, data_prevista, data_devolucao)
CREATE TABLE Locacao (
    locacao_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    data_retirada DATE NOT NULL,
    data_prevista DATE GENERATED ALWAYS AS (DATE_ADD(data_retirada, INTERVAL 21 DAY)) STORED,
    data_devolucao DATE,
    livro_id INT NOT NULL,
    estudante_id INT NOT NULL,
    FOREIGN KEY (livro_id) REFERENCES Livro(livro_id),
    FOREIGN KEY (estudante_id) REFERENCES Estudante(estudante_id)
);

-- exemplos ignorar:

-- Tabela de álbuns
CREATE TABLE album (
  id INT AUTO_INCREMENT,
  title VARCHAR(128) UNIQUE,
  artist_id INT,
  PRIMARY KEY(id),
  CONSTRAINT fk_album_artist FOREIGN KEY (artist_id)
    REFERENCES artist(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Criar tabela pai 1
CREATE TABLE tabela_pai1 (
    id_pai1 NUMBER PRIMARY KEY,
    nome_pai1 VARCHAR2(50)
);

-- Criar tabela pai 2
CREATE TABLE tabela_pai2 (
    id_pai2 NUMBER PRIMARY KEY,
    nome_pai2 VARCHAR2(50)
);

-- Criar tabela filha com duas chaves estrangeiras
CREATE TABLE tabela_filha (
    id_filha NUMBER PRIMARY KEY,
    id_pai1_fk NUMBER, -- Coluna que será chave estrangeira para tabela_pai1
    id_pai2_fk NUMBER, -- Coluna que será chave estrangeira para tabela_pai2
    descricao VARCHAR2(100),
    -- Definir as chaves estrangeiras
    CONSTRAINT fk_tabela_filha_pai1 FOREIGN KEY (id_pai1_fk) REFERENCES tabela_pai1(id_pai1),
    CONSTRAINT fk_tabela_filha_pai2 FOREIGN KEY (id_pai2_fk) REFERENCES tabela_pai2(id_pai2)
);
