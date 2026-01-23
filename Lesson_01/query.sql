SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public';


SELECT *
from clients;


SELECT *
FROM clients
WHERE first_name LIKE 'Антон%';