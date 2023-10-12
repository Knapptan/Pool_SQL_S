CREATE VIEW v_generated_dates as
SELECT gd:: date as generated_date
FROM generate_series('2022-01-01', '2022-01-31', interval '1 day') as gd
ORDER BY generated_date;