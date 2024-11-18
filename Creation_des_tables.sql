CREATE TABLE region(
   id_region INT NOT NULL auto_increment,
   region_name VARCHAR(45) NOT NULL,
   PRIMARY KEY(id_region)
);

CREATE TABLE city(
   id_city VARCHAR(50),
   city_name VARCHAR(45) NOT NULL,
   id_region INT NOT NULL,
   PRIMARY KEY(id_city),
   FOREIGN KEY(id_region) REFERENCES region(id_region)
);

CREATE TABLE type(
   id_type INT NOT NULL auto_increment,
   gaz_type VARCHAR(10) NOT NULL,
   PRIMARY KEY(id_type)
);

CREATE TABLE gaz(
   id_gaz INT NOT NULL auto_increment,
   gaz_name VARCHAR(20) NOT NULL,
   id_type INT NOT NULL,
   PRIMARY KEY(id_gaz),
   FOREIGN KEY(id_type) REFERENCES type(id_type)
);

CREATE TABLE activity_sector(
   id_activity INT NOT NULL auto_increment,
   activity_name VARCHAR(50),
   PRIMARY KEY(id_activity)
);

CREATE TABLE agency(
   id_agency INT NOT NULL auto_increment,
   agency_name VARCHAR(30) NOT NULL,
   address VARCHAR(50) NOT NULL,
   website VARCHAR(50) NOT NULL,
   id_city VARCHAR(50) NOT NULL,
   id_manager VARCHAR(15) NOT NULL,
   PRIMARY KEY(id_agency),
   FOREIGN KEY(id_city) REFERENCES city(id_city)
);

CREATE TABLE agent(
   id_agent VARCHAR(15) NOT NULL,
   fn_agent VARCHAR(30) NOT NULL,
   sn_agent VARCHAR(50) NOT NULL,
   birth_date DATE NOT NULL,
   start_of_service DATE NOT NULL,
   postal_adress VARCHAR(150) NOT NULL,
   mail VARCHAR(200) NOT NULL,
   job_name VARCHAR(50) NOT NULL,
   id_agency INT NOT NULL,
   PRIMARY KEY(id_agent),
   FOREIGN KEY(id_agency) REFERENCES agency(id_agency)
);

CREATE TABLE sensor(
   id_sensor INT NOT NULL auto_increment,
   id_activity INT NOT NULL,
   id_gaz INT NOT NULL,
   id_agent VARCHAR(15) NOT NULL,
   id_city VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_sensor),
   FOREIGN KEY(id_activity) REFERENCES activity_sector(id_activity),
   FOREIGN KEY(id_gaz) REFERENCES gaz(id_gaz),
   FOREIGN KEY(id_agent) REFERENCES agent(id_agent),
   FOREIGN KEY(id_city) REFERENCES city(id_city)
);

CREATE TABLE record(
   id_record INT NOT NULL auto_increment,
   data_record DECIMAL(10,4) NOT NULL,
   date_record DATE NOT NULL,
   id_sensor INT NOT NULL,
   PRIMARY KEY(id_record),
   FOREIGN KEY(id_sensor) REFERENCES sensor(id_sensor)
);

CREATE TABLE report(
   id_report INT NOT NULL auto_increment,
   report_name VARCHAR(50) NOT NULL,
   date_report DATE NOT NULL,
   PRIMARY KEY(id_report)
);

CREATE TABLE give(
   id_record INT,
   id_report INT,
   PRIMARY KEY(id_record, id_report),
   FOREIGN KEY(id_record) REFERENCES record(id_record),
   FOREIGN KEY(id_report) REFERENCES report(id_report)
);

CREATE TABLE writing(
   id_report INT,
   id_agent VARCHAR(15),
   PRIMARY KEY(id_report, id_agent),
   FOREIGN KEY(id_report) REFERENCES report(id_report),
   FOREIGN KEY(id_agent) REFERENCES agent(id_agent)
);
