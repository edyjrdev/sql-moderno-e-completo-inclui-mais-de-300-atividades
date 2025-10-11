--group by
SELECT
country, count(country) total 
FROM
customers 
group by country;

--group by
SELECT
country,city, count(city) total 
FROM
customers 
group by country,city
order by total desc;

--having
SELECT
country,city, count(city) total 
FROM
customers 
group by country,city
having count(city) > 2
order by total desc;
