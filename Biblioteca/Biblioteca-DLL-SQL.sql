CREATE DATABASE E_commerce;
USE E_commerce;

CREATE TABLE Cliente (
    cpf BIGINT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    rua VARCHAR(50),
    numero VARCHAR(20),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado VARCHAR(2)
);

CREATE TABLE Telefone (
    id_telefone INT AUTO_INCREMENT PRIMARY KEY,
    cpf_cliente BIGINT,
    telefone VARCHAR(25) NOT NULL,
    FOREIGN KEY (cpf_cliente) REFERENCES Cliente(cpf)
);

CREATE TABLE Livro (
    isbn BIGINT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    ano_publicado INT,
    preco DECIMAL(10,2)
);


CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    cpf_cliente BIGINT NOT NULL,
    data_pedido DATETIME DEFAULT NOW(),
    FOREIGN KEY (cpf_cliente) REFERENCES Cliente(cpf)
);

CREATE TABLE ItemPedido (
    id_pedido INT,
    isbn BIGINT,
    quantidade INT DEFAULT 1,
    
    PRIMARY KEY (id_pedido, isbn),

    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (isbn) REFERENCES Livro(isbn)
);


