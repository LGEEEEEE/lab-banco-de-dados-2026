-- =============================================================================
-- ATIVIDADE 4 - MANIPULAÇÃO DE DADOS (DML)
-- =============================================================================

-- 1. CARGA INICIAL DE DADOS
-- Inserindo um Usuário (necessário para vincular aos livros)
INSERT INTO Usuario (nome, email, senha) 
VALUES ('Usuário Padrão', 'contato@biblioteca.com', 'senha123');

-- Inserindo Autores
INSERT INTO Autor (nome, ano_nascimento, apresentacao) 
VALUES ('J.K. Rowling', 1965, 'Autora britânica de ficção fantástica');

INSERT INTO Autor (nome, ano_nascimento, apresentacao) 
VALUES ('Friedrich Nietzsche', 1844, 'Filósofo, filólogo e crítico cultural alemão');

-- Inserindo Categorias
INSERT INTO Categoria (nome, descricao) 
VALUES ('Fantasia', 'Livros com elementos mágicos e mundos imaginários');

INSERT INTO Categoria (nome, descricao) 
VALUES ('Filosofia', 'Obras relacionadas ao pensamento e existência humana');

-- Inserindo Editoras
INSERT INTO Editora (nome, cidade, estado, pais) 
VALUES ('Rocco', 'Rio de Janeiro', 'RJ', 'Brasil');

-- Inserindo Livros (Carga inicial vinculando os IDs gerados acima)
-- Livro da J.K. Rowling
INSERT INTO Livro (id_usuario, id_autor, id_editora, id_categoria, titulo, sinopse, ano_publicacao, lido)
VALUES (1, 1, 1, 1, 'Harry Potter e a Pedra Filosofal', 'Um menino descobre ser um bruxo famoso.', 1997, TRUE);

-- Livro de Filosofia
INSERT INTO Livro (id_usuario, id_autor, id_editora, id_categoria, titulo, sinopse, ano_publicacao, lido)
VALUES (1, 2, 1, 2, 'Assim Falou Zaratustra', 'Um livro para todos e para ninguém.', 1883, FALSE);


-- 2. QUERY: Retornar todos os livros da autora 'J.K. Rowling'
SELECT L.* FROM Livro L
JOIN Autor A ON L.id_autor = A.id_autor
WHERE A.nome = 'J.K. Rowling';


-- 3. QUERY: Retornar todos os livros da categoria 'Filosofia'
SELECT L.* FROM Livro L
JOIN Categoria C ON L.id_categoria = C.id_categoria
WHERE C.nome = 'Filosofia';


-- 4. QUERY: Alterar o nome da categoria 'Filosofia' para 'Censurado'
UPDATE Categoria 
SET nome = 'Censurado' 
WHERE nome = 'Filosofia';


-- 5. QUERY: Deletar todos os livros da categoria 'Censurado'
-- Nota: O DELETE é feito na tabela Livro, filtrando pelo nome da categoria via subquery
DELETE FROM Livro 
WHERE id_categoria = (SELECT id_categoria FROM Categoria WHERE nome = 'Censurado');