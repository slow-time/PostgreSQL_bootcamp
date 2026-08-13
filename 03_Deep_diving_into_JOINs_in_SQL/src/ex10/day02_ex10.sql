WITH names_person AS (SELECT id, name, address FROM person)

SELECT person.name AS person_name1, names_person.name AS person_name2, person.address AS common_address
FROM person
JOIN names_person ON person.name <> names_person.name 
AND person.address IN(names_person.address) 
AND person.id > names_person.id
ORDER BY 1, 2, 3;
