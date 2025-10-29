-- create
CREATE DATABASE IF NOT EXISTS restaurante;
USE restaurante;


CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE mesas (
    id_mesa INT AUTO_INCREMENT PRIMARY KEY,
    numero_mesa INT NOT NULL UNIQUE,
    capacidade INT NOT NULL,
    status ENUM('disponivel', 'reservada', 'inativa') DEFAULT 'disponivel'
);

CREATE TABLE reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_mesa INT NOT NULL,
    id_usuario INT NOT NULL,
    data_reserva DATE NOT NULL,
    horario_inicio TIME NOT NULL,
    horario_fim TIME NOT NULL,
    status ENUM('pendente', 'confirmada', 'cancelada', 'concluida') DEFAULT 'pendente',
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_mesa) REFERENCES mesas(id_mesa)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT ck_horario CHECK (horario_fim > horario_inicio)
);


-- insert
-- insert em usuarios:
INSERT INTO usuarios (nome, email, senha, telefone) VALUES
('Ana Souza', 'ana.souza@email.com', '123456', '(11) 99991-1001'),
('Carlos Pereira', 'carlos.pereira@email.com', '123456', '(11) 98882-2033'),
('Mariana Oliveira', 'mariana.oliveira@email.com', '123456', '(11) 97773-4402'),
('Lucas Martins', 'lucas.martins@email.com', '123456', '(11) 96661-1009'),
('Fernanda Alves', 'fernanda.alves@email.com', '123456', '(11) 95555-2203'),
('Bruno Costa', 'bruno.costa@email.com', '123456', '(11) 94444-6006'),
('Patrícia Mendes', 'patricia.mendes@email.com', '123456', '(11) 93333-7007'),
('João Ribeiro', 'joao.ribeiro@email.com', '123456', '(11) 92222-8008'),
('Cláudia Nunes', 'claudia.nunes@email.com', '123456', '(11) 91111-9009'),
('Rafael Teixeira', 'rafael.teixeira@email.com', '123456', '(11) 90000-1111');

-- insert em mesas:
INSERT INTO mesas (numero_mesa, capacidade, status) VALUES
(1, 2, 'disponivel'),
(2, 2, 'disponivel'),
(3, 4, 'disponivel'),
(4, 4, 'disponivel'),
(5, 6, 'disponivel'),
(6, 6, 'disponivel'),
(7, 8, 'disponivel'),
(8, 4, 'disponivel'),
(9, 2, 'inativa'),
(10, 10, 'disponivel');

-- insert em reservas:
INSERT INTO reservas (id_mesa, id_usuario, data_reserva, horario_inicio, horario_fim, status) VALUES
(1, 1, '2025-10-30', '19:00:00', '20:30:00', 'confirmada'),
(2, 2, '2025-10-30', '20:00:00', '21:30:00', 'pendente'),
(3, 3, '2025-10-31', '18:30:00', '20:00:00', 'confirmada'),
(4, 4, '2025-10-31', '19:00:00', '20:30:00', 'cancelada'),
(5, 5, '2025-11-01', '20:00:00', '22:00:00', 'confirmada'),
(6, 6, '2025-11-01', '19:30:00', '21:00:00', 'pendente'),
(7, 7, '2025-11-02', '12:00:00', '13:30:00', 'confirmada'),
(8, 8, '2025-11-02', '13:00:00', '14:30:00', 'concluida'),
(10, 9, '2025-11-03', '18:00:00', '20:00:00', 'pendente'),
(1, 10, '2025-11-03', '20:30:00', '22:00:00', 'confirmada'),
(2, 1, '2025-11-04', '19:00:00', '20:00:00', 'concluida'),
(3, 2, '2025-11-04', '21:00:00', '22:30:00', 'cancelada'),
(4, 3, '2025-11-05', '19:00:00', '20:30:00', 'confirmada'),
(5, 4, '2025-11-05', '21:00:00', '22:00:00', 'confirmada'),
(6, 5, '2025-11-06', '12:00:00', '13:30:00', 'pendente'),
(7, 6, '2025-11-06', '13:30:00', '15:00:00', 'confirmada'),
(8, 7, '2025-11-06', '19:00:00', '20:00:00', 'concluida'),
(10, 8, '2025-11-07', '20:00:00', '22:00:00', 'cancelada'),
(1, 9, '2025-11-07', '18:30:00', '20:00:00', 'confirmada'),
(2, 10, '2025-11-07', '20:00:00', '21:30:00', 'pendente');


SELECT 
    r.id_reserva,
    r.data_reserva,
    r.horario_inicio,
    r.horario_fim,
    r.status,
    m.numero_mesa
FROM reservas r
JOIN mesas m ON r.id_mesa = m.id_mesa
WHERE r.id_usuario = 1 -- ID do cliente desejado
ORDER BY r.data_reserva DESC;
