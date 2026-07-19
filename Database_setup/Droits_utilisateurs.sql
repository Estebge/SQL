-- DATA-X - Qualité de l'air : comptes et droits.
-- admin_air administre la base, user_air (chefs d'agence) la consulte.

USE qualite_air;

DROP USER IF EXISTS 'admin_air'@'localhost';
DROP USER IF EXISTS 'user_air'@'localhost';

-- Administrateur : tous les droits, mais sur qualite_air uniquement.
CREATE USER 'admin_air'@'localhost' IDENTIFIED BY 'Admin_DataX_2024!';

GRANT ALL PRIVILEGES ON qualite_air.* TO 'admin_air'@'localhost' WITH GRANT OPTION;

-- Consultation : lecture seule. Droits donnés table par table pour pouvoir traiter agent à part (voir plus bas).
CREATE USER 'user_air'@'localhost' IDENTIFIED BY 'User_DataX_2024!';

GRANT SELECT ON qualite_air.region          TO 'user_air'@'localhost';
GRANT SELECT ON qualite_air.city            TO 'user_air'@'localhost';
GRANT SELECT ON qualite_air.type            TO 'user_air'@'localhost';
GRANT SELECT ON qualite_air.gaz             TO 'user_air'@'localhost';
GRANT SELECT ON qualite_air.activity_sector TO 'user_air'@'localhost';
GRANT SELECT ON qualite_air.agency          TO 'user_air'@'localhost';
GRANT SELECT ON qualite_air.sensor          TO 'user_air'@'localhost';
GRANT SELECT ON qualite_air.record          TO 'user_air'@'localhost';
GRANT SELECT ON qualite_air.report          TO 'user_air'@'localhost';
GRANT SELECT ON qualite_air.give            TO 'user_air'@'localhost';
GRANT SELECT ON qualite_air.writing         TO 'user_air'@'localhost';

-- Le NIR est une donnée personnelle : on liste les colonnes autorisées et on l'omet, il devient invisible pour user_air.
GRANT SELECT (id_agent, fn_agent, sn_agent, birth_date, start_of_service,
              postal_address, mail, job_name, id_agency)
   ON qualite_air.agent TO 'user_air'@'localhost';

FLUSH PRIVILEGES;

SHOW GRANTS FOR 'admin_air'@'localhost';
SHOW GRANTS FOR 'user_air'@'localhost';
