/*Atividade Prática (EVENTO)
Objetivo: Crie eventos automáticos para simular tarefas do dia a dia de um sistema.

Desafio
*/
/*1.Crie uma tabela chamada tarefas com os campos:
 id (INT, chave primária)
 descricao (VARCHAR)
 status (VARCHAR)
 */
 create database evento;
 use evento;
 -- drop database evento;
 create table tarefas (
	id int auto_increment primary key,
    descricao varchar(100),
    status varchar(100)
    );
#2.Insira 5 registros com status 'Pendente'.
insert into tarefas (descricao, status) value
('Verificar folha de pagamento', 'Pendente'),
('Arrumar Estoque', 'Pendente'),
('Calcular Contas', 'Pendente'),
('Fazer Apresentação', 'Pendente'),
('Bater Ponto', 'Pendente');
/*3.Crie um evento que:
Muda o status de todas as tarefas para 'Em andamento' a cada 5 minutos.
*/
create event mudar_status_tarefa
on schedule every 5 minute
do
	update tarefas
    set status = 'Pendente'
	where status = 'Em Andamento';

-- drop event mudar_status_tarefa;
select * from tarefas;
    
/*4.Crie outro evento que:
Após 15 minutos, mude o status das tarefas para 'Finalizado'.
*/
create event mudar_status_tarefa_finalizado
on schedule every 15 minute
do
	update tarefas
    set status = 'Em Andamento'
    where status = 'Finalizado';
-- drop event mudar_status_tarefa_finalizado
select * from tarefas;

/*5.Mostre como visualizar e excluir esses eventos.
*/
show events;
drop event mudar_status_tarefa;
drop event mudar_status_tarefa_finalizado;
/*
Perguntas 
•O que aconteceria se o event_scheduler estivesse desativado?
R: Nada seria executado, mesmo o código feito corretamente, não seria executado no tempo determinado. 

•Por que eventos são úteis em um sistema real?
R: Para a automação das tarefas repetidas. Será feito tudo automático.

•Qual a diferença entre evento único e evento recorrente?
R: 
O evento unico executamos apenas uma vez em um momento específico.

Evento recorrente: Executa de forma repetida em um intervalo definido.

*/


