SELECT region.region_name, SUM(record.data_record) AS total_emissions
FROM record
INNER JOIN sensor ON record.id_sensor = sensor.id_sensor
INNER JOIN city ON sensor.id_city = city.id_city
INNER JOIN region ON city.id_region = region.id_region
INNER JOIN gaz ON sensor.id_gaz = gaz.id_gaz
INNER JOIN type ON gaz.id_type = type.id_type
WHERE type.gaz_type = 'GES' AND YEAR(record.date_record) = 2020
GROUP BY region.region_name;
