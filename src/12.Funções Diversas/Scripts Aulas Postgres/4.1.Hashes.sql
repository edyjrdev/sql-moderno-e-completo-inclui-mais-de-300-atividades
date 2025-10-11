ALTER TABLE employees ADD COLUMN password_hash TEXT;

UPDATE employees
SET password_hash = md5('senha')
WHERE employee_id = 1;

--visualizando o hash
SELECT employee_id ,password_hash
FROM employees
WHERE employee_id = 1;

--testando se o usuário informou a senha correta
SELECT employee_id
FROM employees
WHERE md5('senha') = password_hash
AND employee_id = 1;

ALTER TABLE employees DROP COLUMN password_hash;

