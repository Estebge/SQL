-- 12. Listez les regions dans lesquelles il y a plus de capteurs que d'agences.
SELECT region.region_name,
       (SELECT COUNT(*)
        FROM sensor
        INNER JOIN city ON city.id_city = sensor.id_city
        WHERE city.id_region = region.id_region) AS nb_capteurs,
       (SELECT COUNT(*)
        FROM agency
        INNER JOIN city ON city.id_city = agency.id_city
        WHERE city.id_region = region.id_region) AS nb_agences
FROM region
HAVING nb_capteurs > nb_agences
ORDER BY nb_capteurs DESC;
