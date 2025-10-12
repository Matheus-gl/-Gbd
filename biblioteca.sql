CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

-- criacao de tabelas
-- autor (id, nome)
CREATE TABLE Autor (
    autor_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- categoria (id, nome)
CREATE TABLE Categoria (
    categoria_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- livro (id, título, ano_publicacao, autor_id, categoria_id)
CREATE TABLE Livro (
    livro_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    autor_id INT NOT NULL,
    categoria_id INT NOT NULL,
    ano_publicacao DATE,
    FOREIGN KEY (autor_id) REFERENCES Autor(autor_id) ON DELETE CASCADE,
    FOREIGN KEY (categoria_id) REFERENCES Categoria(categoria_id) ON DELETE CASCADE
);

-- estudante (id, nome, email)
CREATE TABLE Estudante (
    estudante_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);

-- loan (id, book_id, student_id, data_retirada, data_prevista, data_devolucao)
CREATE TABLE Locacao (
    locacao_id INT AUTO_INCREMENT PRIMARY KEY,
    data_retirada DATE NOT NULL,
    data_prevista DATE GENERATED ALWAYS AS (DATE_ADD(data_retirada, INTERVAL 21 DAY)) STORED,
    data_devolucao DATE,
    livro_id INT NOT NULL,
    estudante_id INT NOT NULL,
    FOREIGN KEY (livro_id) REFERENCES Livro(livro_id) ON DELETE CASCADE,
    FOREIGN KEY (estudante_id) REFERENCES Estudante(estudante_id) ON DELETE CASCADE
);

-- inserção

-- ======================
-- AUTORES (10 autores)
-- ======================
INSERT INTO Autor (nome) VALUES
('Machado de Assis'),
('J. K. Rowling'),
('George Orwell'),
('J. R. R. Tolkien'),
('Gabriel García Márquez'),
('Clarice Lispector'),
('Agatha Christie'),
('Stephen King'),
('José Saramago'),
('Haruki Murakami');

-- ======================
-- CATEGORIAS (5 categorias)
-- ======================
INSERT INTO Categoria (nome) VALUES
('Romance'),
('Fantasia'),
('Distopia'),
('Suspense'),
('Ciências');

-- ======================
-- LIVROS (30 livros)
-- cada um com autor_id e categoria_id
-- ======================
INSERT INTO Livro (titulo, autor_id, categoria_id, ano_publicacao) VALUES
('Dom Casmurro', 1, 1, '1899-01-01'),
('Memórias Póstumas de Brás Cubas', 1, 1, '1881-01-01'),
('Quincas Borba', 1, 1, '1891-01-01'),

('Harry Potter e a Pedra Filosofal', 2, 2, '1997-06-26'),
('Harry Potter e a Câmara Secreta', 2, 2, '1998-07-02'),
('Harry Potter e o Prisioneiro de Azkaban', 2, 2, '1999-07-08'),

('1984', 3, 3, '1949-06-08'),
('A Revolução dos Bichos', 3, 3, '1945-08-17'),

('O Senhor dos Anéis: A Sociedade do Anel', 4, 2, '1954-07-29'),
('O Senhor dos Anéis: As Duas Torres', 4, 2, '1954-11-11'),
('O Senhor dos Anéis: O Retorno do Rei', 4, 2, '1955-10-20'),

('Cem Anos de Solidão', 5, 1, '1967-05-30'),
('O Amor nos Tempos do Cólera', 5, 1, '1985-09-05'),

('A Hora da Estrela', 6, 1, '1977-10-01'),
('Perto do Coração Selvagem', 6, 1, '1943-01-01'),

('Assassinato no Expresso do Oriente', 7, 4, '1934-01-01'),
('O Caso dos Dez Negrinhos', 7, 4, '1939-01-01'),

('O Iluminado', 8, 4, '1977-01-28'),
('It - A Coisa', 8, 4, '1986-09-15'),

('Ensaio sobre a Cegueira', 9, 3, '1995-01-01'),
('Memorial do Convento', 9, 1, '1982-01-01'),

('Kafka à Beira-Mar', 10, 1, '2002-09-12'),
('Norwegian Wood', 10, 1, '1987-09-04'),

('A Torre Negra: O Pistoleiro', 8, 2, '1982-06-10'),
('Misery', 8, 4, '1987-06-08'),

('A Metamorfose', 3, 3, '1915-01-01'),
('O Hobbit', 4, 2, '1937-09-21'),

('Crônica de uma Morte Anunciada', 5, 1, '1981-01-01'),
('A Paixão Segundo G.H.', 6, 1, '1964-01-01'),
('O Evangelho Segundo Jesus Cristo', 9, 1, '1991-01-01');

-- ======================
-- ESTUDANTES (30 estudantes)
-- ======================
INSERT INTO Estudante (nome, email) VALUES
('Ana Silva', 'ana.silva@email.com'),
('Bruno Souza', 'bruno.souza@email.com'),
('Carla Pereira', 'carla.pereira@email.com'),
('Daniel Oliveira', 'daniel.oliveira@email.com'),
('Eduardo Lima', 'eduardo.lima@email.com'),
('Fernanda Costa', 'fernanda.costa@email.com'),
('Gabriel Santos', 'gabriel.santos@email.com'),
('Helena Rocha', 'helena.rocha@email.com'),
('Igor Fernandes', 'igor.fernandes@email.com'),
('Juliana Mendes', 'juliana.mendes@email.com'),
('Kleber Martins', 'kleber.martins@email.com'),
('Larissa Almeida', 'larissa.almeida@email.com'),
('Marcelo Barbosa', 'marcelo.barbosa@email.com'),
('Natália Ribeiro', 'natalia.ribeiro@email.com'),
('Otávio Cardoso', 'otavio.cardoso@email.com'),
('Patrícia Nunes', 'patricia.nunes@email.com'),
('Rafael Gomes', 'rafael.gomes@email.com'),
('Sofia Carvalho', 'sofia.carvalho@email.com'),
('Tiago Freitas', 'tiago.freitas@email.com'),
('Vanessa Moreira', 'vanessa.moreira@email.com'),
('Wagner Azevedo', 'wagner.azevedo@email.com'),
('Xavier Pires', 'xavier.pires@email.com'),
('Yara Duarte', 'yara.duarte@email.com'),
('Zeca Furtado', 'zeca.furtado@email.com'),
('Beatriz Lima', 'beatriz.lima@email.com'),
('Caio Torres', 'caio.torres@email.com'),
('Diego Castro', 'diego.castro@email.com'),
('Elaine Moraes', 'elaine.moraes@email.com'),
('Fábio Ramos', 'fabio.ramos@email.com'),
('Gustavo Teixeira', 'gustavo.teixeira@email.com');

-- ======================
-- LOCAÇÕES (20 empréstimos)
-- alguns com devolução, outros ainda em aberto
-- ======================
INSERT INTO Locacao (data_retirada, data_devolucao, livro_id, estudante_id) VALUES
('2025-09-01', '2025-09-25', 1, 1),   -- Ana pegou Dom Casmurro e devolveu ATRASADO
('2025-09-05', NULL, 4, 2),           -- Bruno pegou Harry Potter 1 (não devolveu ainda)
('2025-09-07', '2025-09-20', 7, 3),   -- Carla pegou 1984 e devolveu
('2025-09-08', NULL, 12, 4),          -- Daniel pegou Cem Anos de Solidão
('2025-09-10', NULL, 17, 5),          -- Eduardo pegou Assassinato no Expresso do Oriente
('2025-09-11', '2025-09-25', 18, 6),  -- Fernanda pegou O Caso dos Dez Negrinhos
('2025-09-12', NULL, 19, 7),          -- Gabriel pegou O Iluminado
('2025-09-13', '2025-09-26', 20, 8),  -- Helena pegou It - A Coisa
('2025-09-14', NULL, 21, 9),          -- Igor pegou Ensaio sobre a Cegueira
('2025-09-15', NULL, 22, 10),         -- Juliana pegou Memorial do Convento
('2025-09-16', NULL, 23, 11),         -- Kleber pegou Kafka à Beira-Mar
('2025-09-17', '2025-09-28', 24, 12), -- Larissa pegou Norwegian Wood
('2025-09-18', NULL, 25, 13),         -- Marcelo pegou A Torre Negra: O Pistoleiro
('2025-09-19', '2025-09-30', 26, 14), -- Natália pegou Misery
('2025-09-20', NULL, 27, 15),         -- Otávio pegou A Metamorfose
('2025-09-21', NULL, 28, 16),         -- Patrícia pegou O Hobbit
('2025-09-22', NULL, 29, 17),         -- Rafael pegou Crônica de uma Morte Anunciada
('2025-09-23', NULL, 30, 18),         -- Sofia pegou A Paixão Segundo G.H.
('2025-09-24', '2025-09-30', 5, 19),  -- Tiago pegou Harry Potter e a Câmara Secreta
('2025-09-25', NULL, 6, 20);          -- Vanessa pegou Harry Potter e o Prisioneiro de Azkaban



-- consultas

-- Liste todos os livros com seus autores e categorias.
select 
	l.titulo as titulo,
	a.nome as autor,
	c.nome as categoria
from Livro l
join Autor a on l.autor_id = a.autor_id
join Categoria c on l.categoria_id = c.categoria_id


-- Liste os empréstimos mostrando: aluno, título do livro e datas.
select
	e.nome as nome,
	lv.titulo as titulo,
	l.data_retirada as retirada,
	l.data_prevista as prevista,
	l.data_devolucao as devolucao
from Locacao l
join Estudante e on l.estudante_id = e.estudante_id
join Livro lv on l.livro_id = lv.livro_id


-- Liste apenas os empréstimos atrasados (onde data_devolucao > data_prevista).
select
	e.nome as nome,
	lv.titulo as titulo,
	l.data_retirada as retirada,
	l.data_prevista as prevista,
	l.data_devolucao as devolucao
from Locacao l
join Estudante e on l.estudante_id = e.estudante_id
join Livro lv on l.livro_id = lv.livro_id
where l.data_devolucao > l.data_prevista
	or l.data_devolucao is null and l.data_prevista < CURDATE();

-- Liste autores que têm mais de um livro na biblioteca.
select
	a.nome as autor,
	COUNT(lv.livro_id) as total_livros
from Autor a
join Livro lv on a.autor_id = lv.autor_id
group by a.autor_id
having COUNT(lv.livro_id) > 1
order by total_livros desc


-- updates

-- atualizar categoria
select * from livro
where titulo = 'Dom Casmurro';

update Livro lv
join Categoria c on c.nome = 'Fantasia'
set lv.categoria_id = c.categoria_id
where lv.titulo = 'Dom Casmurro';


-- atualizar email
update Estudante
set email = 'ana2.silva2@updated.com'
where nome = 'Ana Silva';

select * from Estudante
where nome = 'Ana Silva';


-- Excluir autor 

select * from autor;
select * from livro;

delete from Autor
where autor_id = 3;
-- os livros tambem sao excluidos

-- criar view que mostre: título do livro, aluno, data prevista e status (Em dia ou Atrasado).
CREATE VIEW vw_loans AS
SELECT 
    lv.titulo AS livro,
    e.nome AS aluno,
    l.data_prevista,
    CASE 
        WHEN l.data_devolucao IS NULL AND l.data_prevista < CURDATE() THEN 'Atrasado'
        WHEN l.data_devolucao > l.data_prevista THEN 'Atrasado'
        ELSE 'Em dia'
    END AS status
FROM Locacao l
JOIN Estudante e ON l.estudante_id = e.estudante_id
JOIN Livro lv ON l.livro_id = lv.livro_id;

-- visualizar a view
select * from vw_loans;


-- consulta que mostre a quantidade de livros emprestados por categoria
SELECT 
    c.nome AS categoria,
    COUNT(lv.livro_id) AS total_emprestimos
FROM Categoria c
JOIN Livro lv ON lv.categoria_id = c.categoria_id
JOIN Locacao l ON l.livro_id = lv.livro_id
GROUP BY c.categoria_id, c.nome
ORDER BY total_emprestimos DESC;


