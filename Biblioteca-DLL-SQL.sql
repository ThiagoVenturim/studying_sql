CREATE DATABASE E_commerce;
USE E_commerce;
CREATE TABLE Contato(
	id_contato INT ,
    telefone VARCHAR(25),
    constraint pk_contato PRIMARY KEY (id_contato)
);

CREATE TABLE Cliente(
	cpf INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    rua VARCHAR(50),
    bairro VARCHAR(50),
    numero VARCHAR(50),
    cidade VARCHAR(50),
    estado VARCHAR(50),
    id_contato INT,
    CONSTRAINT pk_cliente PRIMARY KEY (cpf),
    CONSTRAINT fK_contato FOREIGN KEY (id_contato) REFERENCES Contato (id_contato)
);

CREATE TABLE Livro(
	isbn INT NOT NULL,
    titulo varchar(50) NOT NULL,
    autor varchar(50),
    ano_publicado int,
    preco REAL,
    CONSTRAINT pk_livro PRIMARY KEY (isbn)
);

CREATE TABLE Pedido(
	isbn int,
	id_cliente int,
    quantidade int default 1,
    CONSTRAINT fk_cliente  FOREIGN KEY (id_cliente) REFERENCES Cliente (cpf),
    CONSTRAINT fK_livro FOREIGN KEY (isbn) REFERENCES Livro (isbn)
);