-- 6. Afficher le secteur d'activite le plus polluant en Ile-de-France.
SELECT activity_sector.activity_name, SUM(record.data_record) AS total_emissions
FROM record
INNER JOIN sensor ON record.id_sensor = sensor.id_sensor
INNER JOIN activity_sector ON sensor.id_activity = activity_sector.id_activity
INNER JOIN city ON sensor.id_city = city.id_city
INNER JOIN region ON city.id_region = region.id_region
WHERE region.region_name = 'Île-de-France'
GROUP BY activity_sector.activity_name
ORDER BY total_emissions DESC
LIMIT 1;
