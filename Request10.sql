-- 10. Donnez le taux de productivité des agents administratifs de l'agence de Toulouse 
-- (en fonction du nombre de rapports écrits et de leur ancienneté dans le poste)
SELECT CONCAT(agent.fn_agent, ' ', agent.sn_agent) AS nom_agent,
       COUNT(writing.id_report) / DATEDIFF(CURDATE(), agent.start_of_service) AS taux_productivite
FROM agent
INNER JOIN agency ON agent.id_agency = egancy.id_agency
INNER JOIN city ON agency.id_city = city.id_city
INNER JOIN writing ON agent.id_agent = writing/id_agent
WHERE agent.job_name = 'ADMIN' AND city.city_name = 'Toulouse'
GROUP BY CONCAT(agent.fn_agent, ' ', agent.sn_agent), agent.start_of_service