# Projeto Banco de Dados - Hamburgueria

Este repositório contém os scripts SQL necessários para criação, povoamento e manipulação do banco de dados da hamburgueria.

## 📂 Arquivos incluídos

### 1. `01_inserts.sql`
Contém todos os comandos **INSERT** usados para povoar tabelas principais:
- produto  
- ingrediente  
- pedido  
- itempedido  
- produtoingrediente  

---

### 2. `02_selects.sql`
Contém **cinco consultas SELECT**, utilizando:
- WHERE  
- ORDER BY  
- LIMIT  
- JOIN  

---

### 3. `03_updates_deletes.sql`
Contém:
- **3 comandos UPDATE**
- **3 comandos DELETE**
Todos com condições adequadas.

---

## ▶️ Como executar

1. Abra o MySQL Workbench.  
2. Crie um schema (banco de dados):  
   ```sql
   CREATE DATABASE hamburgueria;
   USE hamburgueria;
   ```
3. Execute seu script de criação das tabelas.  
4. Rode primeiro o arquivo `01_inserts.sql`.  
5. Em seguida, teste as consultas do `02_selects.sql`.  
6. Por fim, execute os updates e deletes no `03_updates_deletes.sql`.

## 📌 Observação

Certifique-se de que as tabelas foram criadas corretamente antes de rodar os scripts.

---

## ✔️ Entrega
Este repositório cumpre os requisitos da Atividade 4:
- Scripts de INSERT  
- Scripts SELECT  
- Scripts UPDATE + DELETE  
- README completo com instruções de execução  

---