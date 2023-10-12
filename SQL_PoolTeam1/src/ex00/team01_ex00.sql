WITH volume_t AS (SELECT id, type, currency_id, sum(money) AS volume
                  FROM balance
                  LEFT JOIN "user" ON balance.user_id = "user".id
                  GROUP BY id, type, currency_id),
    last_date AS (SELECT currency.id, max(updated) AS updated
            FROM currency
            GROUP BY currency.id),
    last_updated AS (SELECT currency.id, name, rate_to_usd
             FROM currency
             JOIN last_date
                 ON currency.updated = last_date.updated AND currency.id = last_date.id)
SELECT coalesce("user".name, 'not defined') AS name,
       coalesce(lastname, 'not defined') AS lastname,
       volume_t.type,
       volume,
       coalesce(last_updated.name, 'not defined') AS currency_name,
       coalesce(last_updated.rate_to_usd, 1) AS last_rate_to_usd,
       (volume * coalesce(last_updated.rate_to_usd, 1)) AS total_volume_in_usd
FROM volume_t
LEFT JOIN "user" ON volume_t.id = "user".id
LEFT JOIN last_updated ON volume_t.currency_id = last_updated.id
ORDER BY name DESC, lastname ASC, type ASC;
