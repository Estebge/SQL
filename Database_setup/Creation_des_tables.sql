-- DATA-X - Qualité de l'air : création du schema.
-- Moteur InnoDB : base très relationnelle, on a besoin des clés étrangères.

CREATE DATABASE IF NOT EXISTS qualite_air
   CHARACTER SET utf8mb4
   COLLATE utf8mb4_0900_ai_ci;

USE qualite_air;

-- agency et agent se référencent mutuellement : aucun ordre de DROP ne
-- fonctionne, on désactive donc le contrôle des clés le temps des suppressions.
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS give;
DROP TABLE IF EXISTS writing;
DROP TABLE IF EXISTS record;
DROP TABLE IF EXISTS report;
DROP TABLE IF EXISTS sensor;
DROP TABLE IF EXISTS agent;
DROP TABLE IF EXISTS agency;
DROP TABLE IF EXISTS activity_sector;
DROP TABLE IF EXISTS gaz;
DROP TABLE IF EXISTS type;
DROP TABLE IF EXISTS city;
DROP TABLE IF EXISTS region;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE region(
   id_region INT NOT NULL auto_increment,
   region_name VARCHAR(45) NOT NULL,
   PRIMARY KEY(id_region),
   UNIQUE KEY uk_region_name (region_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE city(
   id_city VARCHAR(50),
   city_name VARCHAR(45) NOT NULL,
   id_region INT NOT NULL,
   PRIMARY KEY(id_city),
   FOREIGN KEY(id_region) REFERENCES region(id_region)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE type(
   id_type INT NOT NULL auto_increment,
   gaz_type VARCHAR(10) NOT NULL,
   PRIMARY KEY(id_type),
   UNIQUE KEY uk_gaz_type (gaz_type),
   CONSTRAINT chk_gaz_type CHECK (gaz_type IN ('GES','GRA'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE gaz(
   id_gaz INT NOT NULL auto_increment,
   gaz_name VARCHAR(20) NOT NULL,
   id_type INT NOT NULL,
   PRIMARY KEY(id_gaz),
   UNIQUE KEY uk_gaz_name (gaz_name),
   FOREIGN KEY(id_type) REFERENCES type(id_type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE activity_sector(
   id_activity INT NOT NULL auto_increment,
   activity_name VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_activity),
   UNIQUE KEY uk_activity_name (activity_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- id_manager est NULLable : le chef est un agent, qui n'existe pas encore.
-- Il est renseigné par un UPDATE à la fin du peuplement.
CREATE TABLE agency(
   id_agency INT NOT NULL auto_increment,
   agency_name VARCHAR(30) NOT NULL,
   address VARCHAR(50) NOT NULL,
   website VARCHAR(50) NOT NULL,
   id_city VARCHAR(50) NOT NULL,
   id_manager INT NULL,
   PRIMARY KEY(id_agency),
   FOREIGN KEY(id_city) REFERENCES city(id_city)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Juridique : le NIR n'est pas la clé primaire, sinon il serait recopié dans toutes les tables filles. La clé est un matricule interne.
CREATE TABLE agent(
   id_agent INT NOT NULL auto_increment,
   nir VARCHAR(15) NOT NULL,
   fn_agent VARCHAR(30) NOT NULL,
   sn_agent VARCHAR(50) NOT NULL,
   birth_date DATE NOT NULL,
   start_of_service DATE NOT NULL,
   postal_address VARCHAR(150) NOT NULL,
   mail VARCHAR(200) NOT NULL,
   job_name VARCHAR(50) NOT NULL,
   id_agency INT NOT NULL,
   PRIMARY KEY(id_agent),
   UNIQUE KEY uk_agent_nir (nir),
   FOREIGN KEY(id_agency) REFERENCES agency(id_agency),
   CONSTRAINT chk_job_name CHECK (job_name IN ('CHEF','TECH','ADMIN')),
   CONSTRAINT chk_agent_majeur CHECK (start_of_service >= birth_date + INTERVAL 18 YEAR)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- La FK sur le chef ne peut être posée qu'une fois agent créé.
ALTER TABLE agency
   ADD CONSTRAINT fk_agency_manager
   FOREIGN KEY (id_manager) REFERENCES agent(id_agent);

CREATE TABLE sensor(
   id_sensor INT NOT NULL auto_increment,
   id_activity INT NOT NULL,
   id_gaz INT NOT NULL,
   id_agent INT NOT NULL,
   id_city VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_sensor),
   FOREIGN KEY(id_activity) REFERENCES activity_sector(id_activity),
   FOREIGN KEY(id_gaz) REFERENCES gaz(id_gaz),
   FOREIGN KEY(id_agent) REFERENCES agent(id_agent),
   FOREIGN KEY(id_city) REFERENCES city(id_city)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE record(
   id_record INT NOT NULL auto_increment,
   data_record DECIMAL(10,4) NOT NULL,
   date_record DATE NOT NULL,
   id_sensor INT NOT NULL,
   PRIMARY KEY(id_record),
   FOREIGN KEY(id_sensor) REFERENCES sensor(id_sensor),
   CONSTRAINT chk_data_record CHECK (data_record >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE report(
   id_report INT NOT NULL auto_increment,
   report_name VARCHAR(50) NOT NULL,
   date_report DATE NOT NULL,
   PRIMARY KEY(id_report)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE give(
   id_record INT,
   id_report INT,
   PRIMARY KEY(id_record, id_report),
   FOREIGN KEY(id_record) REFERENCES record(id_record),
   FOREIGN KEY(id_report) REFERENCES report(id_report)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE writing(
   id_report INT,
   id_agent INT,
   PRIMARY KEY(id_report, id_agent),
   FOREIGN KEY(id_report) REFERENCES report(id_report),
   FOREIGN KEY(id_agent) REFERENCES agent(id_agent)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Index d'optimisation. Les clés sont déjà indexées par InnoDB :
-- on ajoute ici les colonnes qui servent de filtre dans nos requêtes.
CREATE INDEX idx_record_date ON record(date_record);          -- requêtes 4, 5, 9
CREATE INDEX idx_report_date ON report(date_report);          -- requête 4
CREATE INDEX idx_agent_job ON agent(job_name);                -- requêtes 2, 8
CREATE INDEX idx_city_name ON city(city_name);                -- requête 2
CREATE INDEX idx_record_sensor_date ON record(id_sensor, date_record);  -- requêtes 5, 6, 9
