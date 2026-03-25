/* Criação e seleção do banco de dados */
CREATE DATABASE biblioteca_db;
USE biblioteca_db;

/* 1. Criação da tabela Usuario */
CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

/* 2. Criação da tabela Categoria */
CREATE TABLE Categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(128) NOT NULL,
    descricao TEXT,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

/* 3. Criação da tabela Autor */
CREATE TABLE Autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    ano_nascimento YEAR,
    ano_morte YEAR,
    apresentacao TEXT,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

/* 4. Criação da tabela Editora */
CREATE TABLE Editora (
    id_editora INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cidade VARCHAR(64),
    estado VARCHAR(64),
    pais VARCHAR(64),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

/* 5. Criação da tabela Livro (Contém as Chaves Estrangeiras) */
CREATE TABLE Livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_autor INT NOT NULL,
    id_editora INT NOT NULL,
    id_categoria INT NOT NULL,
    titulo VARCHAR(255) NOT NULL,
    sinopse TEXT,
    ano_publicacao YEAR,
    lido BOOLEAN DEFAULT FALSE,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    /* Definição dos Relacionamentos (Foreign Keys) */
    CONSTRAINT fk_livro_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    CONSTRAINT fk_livro_autor FOREIGN KEY (id_autor) REFERENCES Autor(id_autor),
    CONSTRAINT fk_livro_editora FOREIGN KEY (id_editora) REFERENCES Editora(id_editora),
    CONSTRAINT fk_livro_categoria FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
);