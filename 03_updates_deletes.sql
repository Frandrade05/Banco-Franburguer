-- Updates
UPDATE produto SET Preco = Preco + 2 WHERE Nome = 'X-Burger';
UPDATE ingrediente SET Quantidade_Estoque = Quantidade_Estoque - 20 WHERE Nome = 'Batata';
UPDATE pedido SET Total = Total + 5 WHERE ID = 1;

-- Deletes
DELETE FROM itempedido WHERE Quantidade = 0;
DELETE FROM produto WHERE Nome = 'ProdutoTeste';
DELETE FROM ingrediente WHERE Quantidade_Estoque = 0;