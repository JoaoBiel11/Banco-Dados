CREATE TABLE produtos(
 id int auto_increment primary key,
 nome varchar(32),
 categoria varchar(16),
 quantidade int,
 atualizado_em datetime

 );

INSERT INTO produtos (nome, categoria, quantidade, atualizado_em) VALUES
('Caneta', 'Papelaria', 50, NOW()),
('Lápis', 'Papelaria', 0, NOW()),
('Borracha', 'Papelaria', 30, NOW()),
('Notebook', 'Eletrônicos', 5, NOW()),
('Mouse', 'Eletrônicos', 0, NOW());

create index idx_categoria on produtos(categoria);
select * from produtos where categoria = 'Papelaria' ;

create view produtos_em_falta as
select id, nome, categoria from produtos where quantidade = 0;

select * from produtos_em_falta;

DELIMITER //
create trigger atualizar_data_do_produto
before update on produtos
for each row 
begin 
	set new.atualizado_em = now();
    end;
//
DELIMITER ;

SELECT * FROM produtos where id = 2;

update produtos set quantidade = 100 where id = 2;

create view estoque_baixo as
select id, nome, categoria from produtos where quantidade <5;

update produtos set quantidade = 10 where id = 5;

SELECT * FROM produtos where id = 5;



select * from estoque_baixo;