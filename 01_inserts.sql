-- Inserts para povoar tabelas principais
INSERT INTO produto (Nome, Preco) VALUES
('X-Burger', 15.00),
('X-Salada', 17.00);

INSERT INTO ingrediente (Nome, Quantidade_Estoque) VALUES
('Batata', 100),
('Pão', 200),
('Carne', 150);

INSERT INTO pedido (Data_Pedido, Total) VALUES
('2025-11-30', 32.00);

INSERT INTO itempedido (Pedido_ID, Produto_ID, Quantidade) VALUES
(1, 1, 1),
(1, 2, 1);

INSERT INTO produtoingrediente (Produto_ID, Ingrediente_ID, Quantidade_Usada) VALUES
(1, 3, 1),
(2, 3, 1);