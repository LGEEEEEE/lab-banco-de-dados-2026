/* Criação da tabela Autor com restrição de nome único e não nulo */
CREATE TABLE Autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL UNIQUE,
    ano_nascimento YEAR,
    ano_morte YEAR,
    apresentacao TEXT,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);