SELECT region.region_name
FROM region
INNER JOIN city ON region.id_region = city.id_region
INNER JOIN agency ON city.id_city = agency.id_city
INNER JOIN sensor ON sensor.id_city = city.id_city
GROUP BY region.region_name
HAVING COUNT(DISTINCT sensor.id_sensor) > COUNT(DISTINCT agency.id_agency);
