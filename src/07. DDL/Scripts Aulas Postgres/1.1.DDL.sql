--criar tabela
CREATE TABLE tabela_temporaria
(id SERIAL PRIMARY KEY, nome VARCHAR(100), idade INT );

--consultar estrutura
SELECT * FROM
    information_schema.columns
WHERE
    table_name = 'tabela_temporaria';
	
--inserir registros
INSERT INTO tabela_temporaria (nome, idade) VALUES
('Ana', 28),
('Bruno', 34),
('Clara', 25);

SELECT * FROM tabela_temporaria;

/* delete x truncate */ 
DELETE FROM tabela_temporaria;

--truncate, remove registros sem log
TRUNCATE TABLE tabela_temporaria RESTART IDENTITY;

-- Adicionar uma nova coluna
ALTER TABLE tabela_temporaria ADD COLUMN nova_coluna VARCHAR(255);

SELECT * FROM tabela_temporaria;

-- Remover uma coluna
ALTER TABLE tabela_temporaria DROP COLUMN nova_coluna;

/* adicionar coluna novamente */
ALTER TABLE tabela_temporaria ADD COLUMN nova_coluna VARCHAR(255);

-- Modificar o tipo de dados de uma coluna
ALTER TABLE tabela_temporaria ALTER COLUMN nova_coluna 
	TYPE INT USING nova_coluna::INT;

-- Modificar o valor padrão de uma coluna
ALTER TABLE tabela_temporaria ALTER COLUMN nova_coluna SET DEFAULT 0;

INSERT INTO tabela_temporaria (nome, idade) VALUES
('Ana', 28),
('Bruno', 34),
('Clara', 25);

SELECT * FROM tabela_temporaria;

-- Adicionar uma constraint UNIQUE
ALTER TABLE tabela_temporaria ADD CONSTRAINT unica_nome UNIQUE(nome);

INSERT INTO tabela_temporaria (nome, idade) VALUES
('Ana', 28);

-- Adicionar uma constraint NOT NULL
ALTER TABLE tabela_temporaria ALTER COLUMN nome SET NOT NULL;

INSERT INTO tabela_temporaria (idade) VALUES
(28);

-- Adicionar uma constraint CHECK
ALTER TABLE tabela_temporaria ADD CONSTRAINT check_idade CHECK (idade >= 18);

INSERT INTO tabela_temporaria (nome, idade) VALUES
('Pedro', 8);

-- Remover uma constraint
ALTER TABLE tabela_temporaria DROP CONSTRAINT check_idade;


CREATE INDEX idx_nome ON tabela_temporaria (nome);

ALTER INDEX idx_nome RENAME TO idx_nome_tabela_temporaria;


DROP INDEX idx_nome_tabela_temporaria;


-- Drop Table
DROP TABLE IF EXISTS tabela_temporaria;
