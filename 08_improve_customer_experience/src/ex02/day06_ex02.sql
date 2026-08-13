
SELECT p.name, m.pizza_name, m.price, ROUND(m.price - m.price * pd.discount / 100, 2) AS discount_price, pr.name AS pizzeria_name
FROM  person_order po
JOIN person p ON p.id = po.person_id
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria pr ON pr.id = m.pizzeria_id
JOIN person_discounts pd ON po.person_id = pd.person_id AND pr.id = pd.pizzeria_id
ORDER BY p.name, pizzeria_name;
