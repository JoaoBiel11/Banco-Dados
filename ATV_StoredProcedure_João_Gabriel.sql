
/*Atividade Stored Procedure

Objetivo: Crie e execute procedures para simular ações de um sistema de vendas.
Desafio
1. Criar uma tabela estoque com os campos:
 id (INT, chave primária)
 produto (VARCHAR)
 quantidade (INT)
 */
 create table estoque(
	id int auto_increment primary key,
    produto varchar(100),
    quantidade int
);
/*2.Inserir 3 produtos com diferentes quantidades.
*/
insert into estoque (produto, quantidade) values
('Mostarda', 3),
('Ketchup', 2),
('Maionese', 5);

/*3.Criar uma procedure chamada registrar_saida que:
 Receba como entrada o nome do produto e a quantidade a retirar.
 Atualize o estoque. Se não houver estoque suficiente, mostre uma mensagem de erro.
 */
 
 DELIMITER //
 CREATE PROCEDURE registrar_saida(
    IN p_nome_produto VARCHAR(255),
    IN p_quantidade_retirar INT
)
BEGIN
    DECLARE v_quantidade_atual INT;

    -- Obter a quantidade atual do produto
    SELECT quantidade INTO v_quantidade_atual
    FROM estoque
    WHERE produto = p_nome_produto;

    -- Verificar se o produto existe
    IF v_quantidade_atual IS NULL THEN
        SELECT 'Erro: Produto não encontrado no estoque.' AS MensagemErro;
    ELSEIF v_quantidade_atual >= p_quantidade_retirar THEN
        -- Atualizar o estoque
        UPDATE estoque
        SET quantidade = quantidade - p_quantidade_retirar
        WHERE produto = p_nome_produto;
        SELECT CONCAT('Saída de ', p_quantidade_retirar, ' unidades de ', p_nome_produto, ' registrada com sucesso. Estoque atual: ', (v_quantidade_atual - p_quantidade_retirar)) AS Mensagem;
    ELSE
        -- Mostrar mensagem de erro se não houver estoque suficiente
        SELECT CONCAT('Erro: Estoque insuficiente para ', p_nome_produto, '. Disponível: ', v_quantidade_atual, ', Tentativa de retirar: ', p_quantidade_retirar) AS MensagemErro;
    END IF;
END //
 DELIMITER ;
 
/*4.Criar uma procedure consultar_estoque que:
 Receba o nome do produto como parâmetro de entrada.
 Retorne a quantidade disponível.
 */
 
 DELIMITER //
CREATE PROCEDURE consultar_estoque(
    IN p_nome_produto VARCHAR(255),
    OUT p_quantidade_disponivel INT
)
BEGIN
    SELECT quantidade INTO p_quantidade_disponivel
    FROM estoque
    WHERE produto = p_nome_produto;

    -- Se o produto não for encontrado, p_quantidade_disponivel será NULL.
    -- Podemos adicionar uma mensagem para isso se necessário, mas o requisito é apenas retornar a quantidade.
END //
DELIMITER ;