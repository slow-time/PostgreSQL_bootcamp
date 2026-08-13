CREATE VIEW v_generated_dates AS (
SELECT generate_series('2022-01-01'::DATE, '2022-01-31'::DATE, interval '1 day')::DATE AS generated_date
);
