SELECT gaz.gaz_name, SUM(record.data_record) AS total
FROM record
INNER JOIN sensor ON record.id_sensor = sensor.id_sensor
INNER JOIN gaz ON sensor.id_gaz = gaz.id_gaz
INNER JOIN city ON sensor.id_city = city.id_city
INNER JOIN region ON city.id_region = region.id_region
WHERE region.region_name = 'Île-de-France' AND YEAR(record.date_record) = 2020
GROUP BY gaz.gaz_name;
