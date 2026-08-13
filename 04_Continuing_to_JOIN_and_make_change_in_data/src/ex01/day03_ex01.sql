SELECT menu.id AS menu_id
FROM menu
EXCEPT
SELECT po.menu_id AS menu_id
FROM person_order po
ORDER BY menu_id;

