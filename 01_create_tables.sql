-- ============================================
--  BANCO DE DADOS: FranBurguer
--  SCRIPT DE CRIAÇÃO DAS TABELAS (DDL)
-- ============================================

CREATE DATABASE IF NOT EXISTS FranBurguer;
USE FranBurguer;

-- ============================================
-- TABELA: Cliente
-- ============================================
CREATE TABLE Cliente (
    Id_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Telefone VARCHAR(20) NOT NULL
);

-- ============================================
-- TABELA: Funcionario
-- ============================================
CREATE TABLE Funcionario (
    Id_Funcionario INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Funcao VARCHAR(50) NOT NULL
);

-- ============================================
-- TABELA: Produto
-- ============================================
CREATE TABLE Produto (
    Id_Produto INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Preco DECIMAL(10,2) NOT NULL
);

-- ============================================
-- TABELA: Ingrediente
-- ============================================
CREATE TABLE Ingrediente (
    Id_Ingrediente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Quantidade_Estoque INT NOT NULL
);

-- ============================================
-- TABELA: Pedido
-- ============================================
CREATE TABLE Pedido (
    Id_Pedido INT AUTO_INCREMENT PRIMARY KEY,
    Data DATE NOT NULL,
    Status VARCHAR(20) NOT NULL,
    Id_Cliente INT NOT NULL,
    FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente)
);

-- ============================================
-- TABELA: ItemPedido (tabela associativa entre Pedido e Produto)
-- ============================================
CREATE TABLE ItemPedido (
    Id_Item INT AUTO_INCREMENT PRIMARY KEY,
    Id_Pedido INT NOT NULL,
    Id_Produto INT NOT NULL,
    Quantidade INT NOT NULL,
    FOREIGN KEY (Id_Pedido) REFERENCES Pedido(Id_Pedido),
    FOREIGN KEY (Id_Produto) REFERENCES Produto(Id_Produto)
);

-- ============================================
-- TABELA: ProdutoIngrediente (N:N entre Produto e Ingrediente)
-- ============================================
CREATE TABLE ProdutoIngrediente (
    Id_Produto INT NOT NULL,
    Id_Ingrediente INT NOT NULL,
    Quantidade_Usada INT NOT NULL,
    PRIMARY KEY (Id_Produto, Id_Ingrediente),
    FOREIGN KEY (Id_Produto) REFERENCES Produto(Id_Produto),
    FOREIGN KEY (Id_Ingrediente) REFERENCES Ingrediente(Id_Ingrediente)
);
