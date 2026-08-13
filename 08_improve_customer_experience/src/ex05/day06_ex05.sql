
COMMENT ON TABLE person_discounts IS 'Таблица персональных скидок клиентов в разных пиццериях';

COMMENT ON COLUMN person_discounts.id IS 'Идентификационный номер скидки';
COMMENT ON COLUMN person_discounts.person_id  IS 'Идентификационный номер клиента';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Идентификационный номер пиццерии';
COMMENT ON COLUMN person_discounts.discount IS 'Скидка в процентах';