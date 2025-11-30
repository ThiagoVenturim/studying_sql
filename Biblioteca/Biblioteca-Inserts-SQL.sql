USE E_commerce;

INSERT INTO Cliente (cpf, nome, rua, numero, bairro, cidade, estado) VALUES
(11111111111, 'Thiago Santos', 'Rua das Flores', '100', 'Centro', 'Belo Horizonte', 'MG'),
(22222222222, 'Bruno Lima', 'Av Brasil', '2000', 'Funcionários', 'Belo Horizonte', 'MG'),
(33333333333, 'Santos Bruno', 'Rua das Palmeiras', '50', 'Savassi', 'Belo Horizonte', 'MG');

INSERT INTO Telefone (cpf_cliente, telefone) VALUES
(11111111111, '(31) 99999-1111'),
(11111111111, '(31) 98888-2222'),
(22222222222, '(31) 97777-3333'),
(33333333333, '(31) 96666-4444'),
(33333333333, '(31) 95555-5555');


INSERT INTO Livro (isbn, titulo, ano_publicado, preco) VALUES
(9788576082675, 'O Senhor dos Anéis', 2000, 89.90),
(9788547001086, 'Harry Potter e a Pedra Filosofal', 1997, 39.90),
(9788520938044, 'Dom Casmurro', 1899, 24.50),
(9788535933926, 'Sapiens: Uma Breve História da Humanidade', 2014, 59.90);


INSERT INTO Pedido (cpf_cliente) VALUES
(11111111111),  
(22222222222),  
(33333333333);  


INSERT INTO ItemPedido (id_pedido, isbn, quantidade) VALUES
(1, 9788576082675, 1),
(1, 9788547001086, 2),
(2, 9788520938044, 1),
(2, 9788535933926, 1),
(3, 9788547001086, 1),
(3, 9788535933926, 3);
