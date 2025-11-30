use organizacao;
select * from departamento;
select * from empregado;
select * from projeto;
select * from dependente;
select * from participa;

select nome, cpf from empregado;
select nome ,orcamento from departamento;
select nome, salario from empregado where sexo = 'F' and salario > 4200;
select nome from departamento where GCPF is null;
select E.nome as Nome_empregado, D.nome as Nome_Parente from empregado E join dependente D on E.CPF = D.ECPF WHERE parentesco = 'Cônjuge';
select E.nome as Nome_empregado, D.nome as Nome_Departamento from departamento D join empregado E on D.Cod = E.Depto;
select D.nome, E.nome, D.inicio from Departamento D join empregado E on D.GCPF= E.cpf;
select P.nome as nome_projeto, D.nome as nome_departamento from projeto P join departamento D on P.depto = D.cod;
select E.nome  as Empregado, D.nome as Parente , D.parentesco from empregado E join dependente D on e.cpf = D.ecpf; 
select D.nome
	from dependente D 
    join  empregado E on e.cpf = D.ecpf 
    join participa P on P.empregado- E.cpf 
    join projeto K on P.projeto =  K.cod
    where K.nome = 'Alfa';
    
select  K.nome AS nome_projeto, E.nome as nome_empregado, P.horas 
	from empregado E 
    join participa P on  E.cpf= P.empregado
    join projeto K on P.projeto = K.cod;
    
select D.nome 
	from dependente D 
    join empregado E on E.cpf = D.ecpf
	join participa P on  E.cpf= P.empregado
    join projeto K on P.projeto = K.cod
    where K.nome in ('Informatica','Financeiro');
select  K.nome AS nome_projeto, E.nome as nome_empregado, P.horas 
	from empregado E 
    join participa P on  E.cpf= P.empregado
    join projeto K on P.projeto = K.cod;
    
select D.nome 
	from dependente D 
    join empregado E on E.cpf = D.ecpf
	join participa P on  E.cpf= P.empregado
    join projeto K on P.projeto = K.cod
    where K.nome = ('Informatica') and D.parentesco ='Filho';
    
select E.nome, E.salario from empregado E left join dependente D on E.cpf = D.ecpf where D.ecpf  is null;

select D.nome 
	from departamento D
	left join projeto P on D.cod= P.depto
    where P.depto is null;
    
select count(*) from empregado; 

select sum(salario) as gasto_em_salario from empregado;

select max(salario) as maior_salario from empregado;

select min(salario) as menor_salario from empregado;

select round(avg(salario), 2) as media_salarial from empregado;

select min(Orcamento) as menor_orcamento from projeto;

select nome from empregado where salario =(  select max(salario) from empregado );

select D.nome as nome_departamento, E.nome as nome_funcionario 
	from empregado E 
    join departamento D on E.depto = D.cod
    where E.salario < (select AVG(salario) from empregado);

select count(*) 
	from empregado E
    join participa P on P.empregado = E.cpf 
    join projeto K on K.cod = P.projeto
	where K.nome ='Informatica' and E.salario = (select MAX(salario)from empregado);

select E.nome 
	from empregado E
    join Departamento D on E.cpf= D.gcpf
    where E.salario > (select avg(salario) from empregado);
    
select nome 
	from projeto 
    where orcamento = (select min(orcamento) from projeto);

select E.nome, count(P.empregado) 
	from Empregado E
	join Participa P on  E.cpf = P.empregado
	GROUP BY E.cpf, E.nome;
    
select E.nome , sum(P.horas) as soma_horas
	from   Empregado E
	join Participa P on  E.cpf = P.empregado
	GROUP BY E.cpf, E.nome;
    
select K.nome ,sum(P.horas) 
	from Projeto K
    join Participa P on K.cod = P.projeto
    group by K.cod, P.projeto;
    
select E.nome, E.salario
	from Empregado E 
    join Participa P on E.cpf = P.empregado
    group by  E.cpf, E.nome, E.salario
	having count(P.empregado) >= 2;
    
    
SELECT 
    D.nome AS nome_departamento, 
    E.nome AS nome_funcionario, 
    COUNT(P.ecpf) AS qtd_dependentes
FROM departamento D
JOIN Empregado E ON E.cpf = D.gcpf
LEFT JOIN Dependente P ON E.cpf = P.ecpf
GROUP BY 
    D.nome, 
    E.nome;

select D.nome, count(E.depto)
	from Departamento D 
     join Empregado E on E.depto= D.cod
    group by D.cod, E.depto;

select D.nome, CONCAT(D.bairro,' ', D.numero,' ',D.rua,' ',D.cidade,' ',D.estado)  as Endereco
	from Departamento D where orcamento = (select max(orcamento) from departamento);

select E.nome, E.salario, count(D.ecpf) 
	from Empregado E 
    left join Dependente D on E.cpf = D.ecpf
    group by D.ecpf, E.cpf
    order by E.salario desc;
    
select E.nome, E.salario, count(D.ecpf) 
	from Empregado E 
    join Departamento K on K.gcpf = E.cpf 
    left join Dependente D on E.cpf = D.ecpf
    group by D.ecpf, E.cpf
    order by E.salario desc;
    
SELECT 
    D.nome AS departamento,
    G.nome AS gerente,
    COUNT(E.cpf) AS qtd_empregados
	FROM Departamento D
	JOIN Empregado G ON D.gcpf = G.cpf              
	LEFT JOIN Empregado E ON D.cod = E.depto        
	GROUP BY D.cod, D.nome, G.nome
	HAVING COUNT(E.cpf) >= 50; 
    
SELECT 
    D.nome AS departamento,
    D.orcamento AS orcamento_departamento,
    SUM(P.orcamento) AS soma_orcamentos_projetos,
    G.nome AS gerente
	FROM Departamento D
	JOIN Projeto P ON D.cod = P.depto            
	JOIN Empregado G ON D.gcpf = G.cpf             
	GROUP BY D.cod, D.nome, D.orcamento, G.nome
	ORDER BY D.nome;                              

    