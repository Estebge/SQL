-- 8. Donnez les noms des agents techniques maintenant des capteurs concernant les polluants acidificateurs (NH3, SO2, NOx).
SELECT DISTINCT agent.fn_agent, agent.sn_agent
FROM agent
INNER JOIN sensor ON sensor.id_agent = agent.id_agent
INNER JOIN gaz ON gaz.id_gaz = sensor.id_gaz
INNER JOIN type ON type.id_type = gaz.id_type
WHERE agent.job_name = 'TECH' AND type.gaz_type = 'GRA'
ORDER BY agent.sn_agent;
