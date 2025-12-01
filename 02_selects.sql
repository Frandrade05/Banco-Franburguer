-- Consultas SELECT
SELECT * FROM produto ORDER BY Preco DESC;

SELECT Nome, Quantidade_Estoque FROM ingrediente WHERE Quantidade_Estoque < 150;

SELECT p.Nome, ip.Quantidade FROM produto p
JOIN itempedido ip ON p.ID = ip.Produto_ID
LIMIT 10;

SELECT pr.Nome AS Produto, ing.Nome AS Ingrediente
FROM produtoingrediente pi
JOIN produto pr ON pi.Produto_ID = pr.ID
JOIN ingrediente ing ON pi.Ingrediente_ID = ing.ID;

SELECT * FROM pedido WHERE Total > 20;