--inner
SELECT f.emp_id, f.emp_nome, d.dept_nome
FROM funcionarios f
INNER JOIN departamentos d ON f.dept_id = d.dept_id;

--left
SELECT f.emp_id, f.emp_nome, d.dept_nome
FROM funcionarios f
LEFT JOIN departamentos d ON f.dept_id = d.dept_id;

--right
SELECT f.emp_id, f.emp_nome, d.dept_nome
FROM funcionarios f
RIGHT JOIN departamentos d ON f.dept_id = d.dept_id;

--full outer
SELECT f.emp_id, f.emp_nome, d.dept_nome
FROM funcionarios f
FULL OUTER JOIN departamentos d ON f.dept_id = d.dept_id;

--cross 
SELECT f.emp_id, f.emp_nome, d.dept_id, d.dept_nome
FROM funcionarios f
CROSS JOIN departamentos d;
