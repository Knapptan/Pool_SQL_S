insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH tmp AS (SELECT balance.user_id, currency.id, currency.name, balance.money,
                             (SELECT rate_to_usd
                              FROM currency
                              WHERE currency.id = balance.currency_id
                                AND currency.updated <= balance.updated
                              ORDER BY rate_to_usd
                              LIMIT 1) AS past,
                             (SELECT rate_to_usd
                              FROM currency
                              WHERE currency.id = balance.currency_id
                                AND currency.updated >= balance.updated
                              ORDER BY rate_to_usd
                              LIMIT 1) AS future
             FROM balance
                 JOIN currency ON balance.currency_id = currency.id
             GROUP BY balance.money, currency.name,
                      currency.id, balance.updated,
                      balance.currency_id, balance.user_id
             ORDER BY past DESC, future)
SELECT coalesce("user".name, 'not defined') AS name,
       coalesce(lastname, 'not defined') AS lastname,
       tmp.name AS currency_name,
       tmp.money * coalesce(tmp.past, tmp.future) AS currency_in_usd
FROM tmp
LEFT JOIN "user" ON "user".id = tmp.user_id
ORDER BY name DESC, lastname, currency_name;
