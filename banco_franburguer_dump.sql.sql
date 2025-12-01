 CREATE DATABASE FranBurguer;
USE FranBurguer;

CREATE TABLE Cliente (
    Id_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Telefone VARCHAR(20)
);

CREATE TABLE Funcionário (
    Id_Funcionario INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Funcao VARCHAR(50)
);


CREATE TABLE Produto (
    Id_Produto INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Preco DECIMAL(10,2) NOT NULL
);

CREATE TABLE Ingrediente (
    Id_Ingrediente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Quantidade_Estoque INT NOT NULL
);

CREATE TABLE Pedido (
    Id_Pedido INT PRIMARY KEY AUTO_INCREMENT,
    Data DATE NOT NULL,
    Status VARCHAR(20) NOT NULL,
    Id_Cliente INT NOT NULL,
    FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente)
);

CREATE TABLE ItemPedido (
    Id_Item INT PRIMARY KEY AUTO_INCREMENT,
    Id_Pedido INT NOT NULL,
    Id_Produto INT NOT NULL,
    Quantidade INT NOT NULL,
    FOREIGN KEY (Id_Pedido) REFERENCES Pedido(Id_Pedido),
    FOREIGN KEY (Id_Produto) REFERENCES Produto(Id_Produto)
);

-- Relação N:N Produto_Ingrediente

CREATE TABLE ProdutoIngrediente (
    Id_Produto INT,
    Id_Ingrediente INT,
    Quantidade_Usada INT,
    PRIMARY KEY (Id_Produto, Id_Ingrediente),
    FOREIGN KEY (Id_Produto) REFERENCES Produto(Id_Produto),
    FOREIGN KEY (Id_Ingrediente) REFERENCES Ingrediente(Id_Ingrediente)
);

-- CLIENTES
INSERT INTO Cliente (Nome, Telefone) VALUES
('Ana Souza', '11988887777'),
('Carlos Lima', '11999996666'),
('Mariana Torres', '11876543210');

-- FUNCIONÁRIOS
INSERT INTO Funcionário (Nome, Funcao) VALUES
('João Pereira', 'Atendente'),
('Fernanda Silva', 'Cozinheira');

-- PRODUTOS
INSERT INTO Produto (Nome, Preco) VALUES
('X-Burger', 18.00),
('X-Salada', 20.00),
('Batata Frita', 12.00);

-- INGREDIENTES
INSERT INTO Ingrediente (Nome, Quantidade_Estoque) VALUES
('Pão', 200),
('Hambúrguer', 150),
('Queijo', 180),
('Alface', 100),
('Batata', 300);

-- RELAÇÃO PRODUTO–INGREDIENTE
INSERT INTO ProdutoIngrediente VALUES
(1, 1, 1),  -- X-Burger usa 1 Pão
(1, 2, 1),  -- 1 Hambúrguer
(1, 3, 1),  -- 1 Queijo
(2, 1, 1),  -- X-Salada usa 1 Pão
(2, 2, 1),  
(2, 3, 1),
(2, 4, 1),  -- 1 Alface
(3, 5, 3);  -- Batata Frita usa Batata

-- PEDIDOS
INSERT INTO Pedido (Data, Status, Id_Cliente) VALUES
('2025-11-28', 'Em preparo', 1),
('2025-11-28', 'Concluído', 2);

-- ITENS DO PEDIDO
INSERT INTO ItemPedido (Id_Pedido, Id_Produto, Quantidade) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 1);


-- 1. Listar todos os clientes em ordem alfabética
SELECT * FROM Cliente ORDER BY Nome;

-- 2. Buscar pedidos de um cliente específico
SELECT P.Id_Pedido, P.Data, P.Status
FROM Pedido P
JOIN Cliente C ON C.Id_Cliente = P.Id_Cliente
WHERE C.Nome = 'Ana Souza';

-- 3. Listar itens do pedido com nome do produto
SELECT I.Id_Item, P.Nome AS Produto, I.Quantidade
FROM ItemPedido I
JOIN Produto P ON P.Id_Produto = I.Id_Produto
WHERE I.Id_Pedido = 1;

-- 4. Produtos com preço acima de 15
SELECT Nome, Preco
FROM Produto
WHERE Preco > 15
ORDER BY Preco DESC;

-- 5. Total de pedidos por cliente
SELECT C.Nome, COUNT(P.Id_Pedido) AS TotalPedidos
FROM Cliente C
LEFT JOIN Pedido P ON P.Id_Cliente = C.Id_Cliente
GROUP BY C.Nome;

UPDATE Cliente SET Telefone = '11911112222' WHERE Id_Cliente = 1;
UPDATE Produto SET Preco = Preco + 2 WHERE Nome = 'X-Burger';
UPDATE Ingrediente SET Quantidade_Estoque = Quantidade_Estoque - 20 WHERE Nome = 'Batata';

-- DELETES
DELETE FROM ItemPedido WHERE Id_Item = 3;
DELETE FROM Pedido WHERE Id_Pedido = 2;
DELETE FROM Cliente WHERE Id_Cliente = 3;



