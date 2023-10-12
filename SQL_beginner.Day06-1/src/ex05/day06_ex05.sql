COMMENT ON TABLE person_discounts IS 'This table contains person discounts for each client who ordered pizza';
COMMENT ON COLUMN person_discounts.id IS 'Primary key - id';
COMMENT ON COLUMN person_discounts.person_id IS 'Foreign key to person';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Foreign key to pizzeria';
COMMENT ON COLUMN person_discounts.discount IS 'Discount for person in pizzeria';