use organizacao;
INSERT INTO Departamento (Cod, Nome, Rua, Numero, Bairro, Cidade, Estado, Orcamento, GCPF, Inicio) VALUES
(1, 'Administrativo', 'Rua Central', 100, 'Centro', 'Belo Horizonte', 'MG', 500000, NULL, '2020-01-01'),
(2, 'TI', 'Av Brasil', 200, 'Funcionários', 'Belo Horizonte', 'MG', 800000, NULL, '2019-03-10');


INSERT INTO Empregado (CPF, Nome, Sexo, Salario, Depto) VALUES
('111', 'Carlos Silva', 'M', 4500, 1),
('222', 'Ana Souza',   'F', 5200, 2),
('333', 'Marcos Lima', 'M', 6100, 2);

UPDATE Departamento SET GCPF = '111' WHERE Cod = 1;
UPDATE Departamento SET GCPF = '222' WHERE Cod = 2;


INSERT INTO Projeto (Cod, Nome, Rua, Numero, Bairro, Cidade, Estado, Orcamento, Depto) VALUES
(10, 'Sistema Interno', 'Av Amazonas', 500, 'Centro', 'Belo Horizonte', 'MG', 150000, 2),
(20, 'Reforma Predial', 'Rua Goiás', 300, 'Centro', 'Belo Horizonte', 'MG', 200000, 1);

INSERT INTO Dependente (ECPF, Nome, Parentesco, Sexo) VALUES
('111', 'João Silva', 'Filho', 'M'),
('222', 'Maria Souza', 'Filha', 'F'),
('333', 'Paulo Lima', 'Cônjuge', 'M');

INSERT INTO Participa (empregado, projeto, horas) VALUES
('111', 10, 20),
('111', 20, 12),
('222', 10, 30),
('333', 10, 25),
('333', 20, 10);
