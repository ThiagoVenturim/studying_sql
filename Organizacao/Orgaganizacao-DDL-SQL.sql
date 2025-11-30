use organizacao;

CREATE TABLE Departamento(
	Cod INT NOT NULL,
    Nome VARCHAR(50) NOT NULL,
	Rua  VARCHAR(50),
    Numero INT,
    Bairro  VARCHAR(50),
    Cidade VARCHAR(50),
    Estado  VARCHAR(50),
    Orcamento REAL,
    GCPF VARCHAR(50),
    Inicio DATE,
    CONSTRAINT pk_departamento PRIMARY KEY (Cod) 
);

CREATE TABLE Empregado(
	CPF VARCHAR(50) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Sexo CHAR(1) CHECK (Sexo IN('M','F')),
	Salario REAL,
    Depto INT NOT NULL,
	CONSTRAINT pk_empregado PRIMARY KEY (CPF),
    CONSTRAINT fk_departamento_empregado FOREIGN KEY (Depto) REFERENCES Departamento(Cod)
);
ALTER TABLE Departamento ADD CONSTRAINT fk_empregado_departamento FOREIGN KEY (GCPF) REFERENCES Empregado(CPF);

CREATE TABLE Projeto(
	Cod INT NOT NULL,
    Nome varchar(50),
    Rua  VARCHAR(50),
    Numero INT,
    Bairro  VARCHAR(50),
    Cidade VARCHAR(50),
    Estado  VARCHAR(50),
    Orcamento REAL,
    Depto INT NOT NULL,
    CONSTRAINT pk_projeto PRIMARY KEY (Cod),
    CONSTRAINT fk_departamento FOREIGN KEY (Depto) REFERENCES Departamento(Cod)
);

CREATE TABLE Dependente(
	ECPF VARCHAR(50) NOT NULL,
    Nome  VARCHAR(50) NOT NULL,
	Parentesco  VARCHAR(50),
	Sexo CHAR(1) CHECK (Sexo IN('M','F')),
    CONSTRAINT pk_dependente PRIMARY KEY (Nome),
	CONSTRAINT fk_dependente_empregado FOREIGN KEY (ECPF) REFERENCES Empregado(CPF)
);

CREATE TABLE Participa(
	empregado VARCHAR(50) NOT NULL,  
    projeto  INT NOT NULL,
    horas INT,
    CONSTRAINT fk_participa_empregado FOREIGN KEY (empregado) REFERENCES Empregado(CPF), 
    CONSTRAINT fk_participa_projeto  FOREIGN KEY (projeto) REFERENCES Projeto(Cod)
);
