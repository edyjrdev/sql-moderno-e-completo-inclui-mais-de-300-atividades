CREATE EXTENSION IF NOT EXISTS pgcrypto;

ALTER TABLE employees ADD COLUMN salary bytea;

UPDATE employees
SET salary = pgp_sym_encrypt(7000::text, '374f61c8f2106cd239197a6514b')
WHERE employee_id = 1;

--verificando o salário
SELECT employee_id ,encode(salary, 'hex') ,
	pgp_sym_decrypt(salary, '374f61c8f2106cd239197a6514b')
FROM employees
WHERE employee_id = 1;

ALTER TABLE employees DROP COLUMN salary;