-- 1. Listez l'ensemble des agences.
SELECT agency.agency_name, agency.address, city.city_name,
       CONCAT(agent.fn_agent, ' ', agent.sn_agent) AS chef_agence
FROM agency
INNER JOIN city ON city.id_city = agency.id_city
LEFT JOIN agent ON agent.id_agent = agency.id_manager
ORDER BY agency.agency_name;
