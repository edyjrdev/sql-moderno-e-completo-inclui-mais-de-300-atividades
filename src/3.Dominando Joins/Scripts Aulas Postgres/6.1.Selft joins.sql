-- Self Join para Hierarquia
SELECT 
    a.employee_id AS "Id do Funcionário",
    a.first_name || ' ' || a.last_name  AS "Nome do Funcionário",
    b.employee_id AS "Id do Supervisor",
    b.first_name || ' ' || b.last_name  AS "Nome do Supervisor"
FROM 
    employees a
LEFT JOIN employees b ON a.reports_to = b.employee_id;
