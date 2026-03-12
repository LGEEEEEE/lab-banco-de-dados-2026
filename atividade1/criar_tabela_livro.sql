show databases;
USE biblioteca_pessoal_1s2026;

CREATE table Livro(
	id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo varchar(255) NOT NULL,
    sinopse TEXT NOT NULL,
    autor varchar(128) NOT NULL,
    editora varchar(128) NOT NULL,
    categoria varchar(128) NOT NULL,
    ano_publicacao YEAR NOT NULL
)