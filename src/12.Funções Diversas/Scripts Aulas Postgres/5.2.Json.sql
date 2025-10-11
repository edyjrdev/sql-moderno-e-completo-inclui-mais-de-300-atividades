--criando tabela
CREATE TABLE produtos (
    id serial PRIMARY KEY,
    nome VARCHAR(100),
    atributos JSON
);

--adicionando dados
INSERT INTO produtos (nome, atributos)
VALUES
('Camiseta', '{"cor": "azul", "tamanho": "M", "preco": 25.50}'),
('Calça', '{"cor": "preta", "tamanho": "G", "preco": 50.00}');

SELECT *
FROM produtos
WHERE atributos->>'cor' = 'azul';

UPDATE produtos
SET atributos = json_build_object(
    'cor', (atributos->>'cor'),
    'tamanho', (atributos->>'tamanho'),
    'preco', '30.00'
)
WHERE id = 1;

SELECT *
FROM produtos
WHERE (atributos->>'preco')::numeric = 30;

DROP TABLE produtos;
