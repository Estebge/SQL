-- 2. Listez l'ensemble du personnel technique de l'agence de Bordeaux
SELECT agent.fn_agent, agent.sn_agent FROM agent
INNER JOIN agency ON agency.id_agency = agent.id_agency
INNER JOIN city ON city.id_city = agency.id_city
WHERE city_name = 'Bordeaux' AND job_name = 'TECH' ;
