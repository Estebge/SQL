SELECT fn_agent FROM agent
INNER JOIN sensor on sensor.id_agent = agent.id_agent
INNER JOIN gaz on gaz.id_gaz = sensor.id_gaz
INNER JOIN type on type.id_type = gaz.id_type
WHERE job_name = 'TECH' AND type.gaz_type = 'GRA';
