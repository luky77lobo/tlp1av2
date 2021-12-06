-----------CRUD LOCALIZACAO------------
create table localizacao(
id serial not null,
nome varchar(50),
valor_aluguel numeric(10,2),
primary key(id)
);

INSERT INTO localizacao(nome, valor_aluguel) VALUES ('São Paulo', 5000);
INSERT INTO localizacao(nome, valor_aluguel) VALUES ('Florinapólis', 240.369);
INSERT INTO localizacao(nome, valor_aluguel) VALUES ('Brasília', 675.369);
INSERT INTO localizacao(nome, valor_aluguel) VALUES ('padaria_não_vai_tá_no_id4', 215.34769);
INSERT INTO localizacao(id,nome, valor_aluguel) VALUES (90,'teste', 204);
select * from localizacao l order by l.id 
select l.valor_aluguel from localizacao l where  l.nome ilike '%S%'
update localizacao set valor_aluguel = valor_aluguel * 1/10 where id = 5;

delete from localizacao where id = 5

------------- CRUD PADARIA -------------
create table padaria(
id serial not null,
nome varchar(50),
avaliacao varchar(50),
id_localizacao int,
primary key(id),
foreign key(id_localizacao) references localizacao(id)
);

--- No CRUD da padaria, o seu programa deve apresentar um relatório informando: O nome da padaria, a sua localização e todos os produtos vendidos pela padaria. (Utilize junção)--
INSERT INTO padaria(nome, avaliacao, id_localizacao) VALUES ('Fina Farina','3 estrelas', 6);
INSERT INTO padaria(nome, avaliacao, id_localizacao) VALUES ('Café François','5 estrelas', 7);
INSERT INTO padaria(nome, avaliacao, id_localizacao) VALUES ('Bäckerei','4 estrelas e meia', 8);
select l.nome,pa.nome ,pr.nome from padaria pa join localizacao l on pa.id_localizacao = l.id join produto pr on pr.id_padaria = pa.id  

------------- CRUD PRODUTO -------------
create table produto(
id serial not null,
nome varchar(50),
descricao varchar(256),
valor numeric(12,2),
id_padaria int,
primary key(id),
foreign key(id_padaria) references padaria(id)
);
select * from produto;
delete  from produto;
INSERT INTO produto(nome, descricao, valor, id_padaria) VALUES ('pão de açúcar', 'açúcar fors','20', 2);
INSERT INTO produto(nome, descricao, valor, id_padaria) VALUES ('pão branco', '0 glutén', '10', 1);
INSERT INTO produto(nome, descricao, valor, id_padaria) VALUES ('pão branco', '0 glutén', '8.50', 2);
INSERT INTO produto(nome, descricao, valor, id_padaria) VALUES ('torta holandesa', 'creme de leite nestlé', '12.4', 3)

SELECT ROUND(AVG(valor),2)    
FROM produto