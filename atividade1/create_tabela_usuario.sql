show databases;
USE biblioteca_pessoal_1s2026;

CREATE table Usuario(
	id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome varchar(255) NOT NULL,
    email varchar(128) NOT NULL UNIQUE,
    data_cadastro DATE DEFAULT(CURRENT_DATE)
)