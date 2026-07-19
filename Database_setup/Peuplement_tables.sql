-- DATA-X - Qualité de l'air : peuplement de la base.

USE qualite_air;

INSERT INTO type (gaz_type) VALUES
('GES'),
('GRA');

-- SO2 et NOx ajoutes : ce sont les acidificateurs cités par le client.
INSERT INTO gaz (gaz_name, id_type) VALUES
('N2O',1),
('CO2 BIO',1),
('NH3',2),
('CH4',1),
('PFC',1),
('HFC',1),
('SF6',1),
('CO2 NON BIO',1),
('SO2',2),
('NOx',2);

INSERT INTO region (region_name) VALUES 
('Île-de-France'),
('Auvergne-Rhône-Alpes'),
('Provence-Alpes-Côte d''Azur'),
('Occitanie'),
('Hauts-de-France'),
('Normandie'),
('Nouvelle-Aquitaine'),
('Grand Est'),
('Bretagne'),
('Pays de la Loire'),
('Centre-Val de Loire'),
('Bourgogne-Franche-Comté'),
('Corse');

INSERT INTO activity_sector (activity_name) VALUES
('Industrie chimique'),
('Industrie manufacturière'),
('Agriculture'),
('Transport routier'),
('Transport maritime'),
('Construction'),
('Énergie'),
('Industrie alimentaire'),
('Secteur tertiaire'),
('Traitement des eaux'),
('Gestion des déchets'),
('Santé');

INSERT INTO city (id_city, city_name, id_region) VALUES 
('MAR', 'Marseille', 3),
('TOU', 'Toulouse', 4),
('NCE', 'Nice', 3),
('LIL', 'Lille', 5),
('BOR', 'Bordeaux', 7),
('STR', 'Strasbourg', 8),
('REN', 'Rennes', 9),
('NAN', 'Nantes', 10),
('ORL', 'Orléans', 11),
('DIJ', 'Dijon', 12),
('LYO', 'Lyon', 2),
('PAR', 'Paris', 1),
('CAN', 'Cannes', 3),
('NIM', 'Nîmes', 3),
('NAC', 'Nancy', 8),
('AVE', 'Avignon', 3),
('CHA', 'Chambéry', 2),
('ROU', 'Rouen', 6),
('LEH', 'Le Havre', 6),
('ANG', 'Angers', 10),
('LEL', 'Le Mans', 10),
('AMI', 'Amiens', 5),
('VAL', 'Valence', 2),
('AIX', 'Aix-en-Provence', 3),
('BRE', 'Brest', 9),
('VER', 'Versailles', 1),
('CRE', 'Créteil', 1),
('BOU', 'Boulogne-Billancourt', 1),
('AJA', 'Ajaccio', 13);

-- Agences inserées sans chef : les agents n'existent pas encore.
-- Le rattachement se fait par un UPDATE en fin de fichier.
INSERT INTO agency (agency_name, address, website, id_city) VALUES
('Agence Marseille', '10 Rue de la Liberté, 13001 Marseille', 'www.agence-marseille.com', 'MAR'),
('Agence Toulouse', '25 Avenue des Pyrénées, 31000 Toulouse', 'www.agence-toulouse.com', 'TOU'),
('Agence Nice', '5 Boulevard Victor Hugo, 06000 Nice', 'www.agence-nice.com', 'NCE'),
('Agence Lille', '15 Rue Nationale, 59000 Lille', 'www.agence-lille.com', 'LIL'),
('Agence Bordeaux', '30 Quai des Chartrons, 33000 Bordeaux', 'www.agence-bordeaux.com', 'BOR'),
('Agence Strasbourg', '8 Rue de la Demi-Lune, 67000 Strasbourg', 'www.agence-strasbourg.com', 'STR'),
('Agence Rennes', '12 Rue de la Visitation, 35000 Rennes', 'www.agence-rennes.com', 'REN'),
('Agence Nantes', '20 Rue Crébillon, 44000 Nantes', 'www.agence-nantes.com', 'NAN'),
('Agence Orléans', '7 Rue de la République, 45000 Orléans', 'www.agence-orleans.com', 'ORL'),
('Agence Dijon', '18 Rue des Forges, 21000 Dijon', 'www.agence-dijon.com', 'DIJ'),
('Agence Lyon', '14 Rue de la République, 69001 Lyon', 'www.agence-lyon.com', 'LYO'),
('Agence Nîmes', '12 Rue Boyer Brun, 30000 Nîmes', 'www.agence-nime.com', 'NIM'),
('Agence Paris', '30 Rue du Faubourg Saint-Honoré, 75008 Paris', 'www.agence-paris.com', 'PAR'),
('Agence Cannes', '20 Boulevard de la Croisette, 06400 Cannes', 'www.agence-cannes.com', 'CAN'),
('Agence Nancy', '10 Rue Saint-Dizier, 54000 Nancy', 'www.agence-nancy.com', 'NAC'),
('Agence Avignon', '5 Rue de la République, 84000 Avignon', 'www.agence-avignon.com', 'AVE'),
('Agence Chambéry', '12 Rue de Boigne, 73000 Chambéry', 'www.agence-chambery.com', 'CHA'),
('Agence Rouen', '40 Rue du Gros Horloge, 76000 Rouen', 'www.agence-rouen.com', 'ROU'),
('Agence Le Havre', '2 Rue de Paris, 76600 Le Havre', 'www.agence-lehavre.com', 'LEH'),
('Agence Angers', '15 Rue Plantagenêt, 49100 Angers', 'www.agence-angers.com', 'ANG'),
('Agence Le Mans', '8 Rue des Minimes, 72000 Le Mans', 'www.agence-lemans.com', 'LEL'),
('Agence Amiens', '20 Rue des Trois Cailloux, 80000 Amiens', 'www.agence-amiens.com', 'AMI'),
('Agence Valence', '30 Rue Madier de Montjau, 26000 Valence', 'www.agence-valence.com', 'VAL'),
('Agence Aix-en-Provence', '5 Rue Gaston de Saporta, 13100 Aix-en-Provence', 'www.agence-aix.com', 'AIX'),
('Agence Brest', '10 Rue de Siam, 29200 Brest', 'www.agence-brest.com', 'BRE');

-- Le NIR reste une donnée RH, mais c'est le matricule id_agent qui identifie l'agent.
INSERT INTO agent (id_agent, nir, fn_agent, sn_agent, birth_date, start_of_service, postal_address, mail, job_name, id_agency) VALUES
(1, '191212100000125', 'Thomas', 'Lambert', '1991-12-12', '2018-05-10', '8 Rue des Moulins, 13001 Marseille', 'thomas.lambert@gmail.com', 'CHEF', 1),
(2, '292305250505167', 'Sophie', 'Dubois', '1992-05-25', '2016-08-15', '11 Rue des Capucins, 13001 Marseille', 'sophie.dubois@gmail.com', 'TECH', 1),
(3, '183008180818210', 'Lucas', 'Girard', '1983-08-18', '2017-02-25', '14 Rue des Oliviers, 31000 Toulouse', 'lucas.girard@gmail.com', 'CHEF', 2),
(4, '276605020202232', 'Émilie', 'Marchand', '1976-05-02', '2019-11-30', '22 Rue des Roses, 31000 Toulouse', 'emilie.marchand@gmail.com', 'TECH', 2),
(5, '198911300707157', 'Paul', 'Dupuis', '1989-11-30', '2015-04-20', '16 Rue des Tulipes, 31000 Toulouse', 'paul.dupuis@gmail.com', 'ADMIN', 2),
(6, '285004121212185', 'Alexandre', 'Fournier', '1985-12-12', '2018-06-10', '19 Rue des Fleurs, 06000 Nice', 'alexandre.fournier@gmail.com', 'CHEF', 3),
(7, '203009090707136', 'Sophie', 'Laurent', '1993-09-09', '2019-01-02', '25 Rue des Roses, 06000 Nice', 'sophie.laurent@gmail.com', 'TECH', 3),
(8, '173003131313270', 'Léa', 'Lemoine', '1973-03-13', '2018-05-01', '6 Rue des Violettes, 59000 Lille', 'lea.lemoine@gmail.com', 'CHEF', 4),
(9, '294003141414293', 'Antoine', 'Giraud', '1994-03-14', '2019-07-15', '13 Rue des Iris, 59000 Lille', 'antoine.giraud@gmail.com', 'TECH', 4),
(10, '298307191919213', 'Émilie', 'Morel', '1988-07-19', '2015-10-20', '22 Rue des Tulipes, 59000 Lille', 'emilie.morel@gmail.com', 'ADMIN', 4),
(11, '228312131313121', 'Nicolas', 'Lefebvre', '1972-12-13', '2014-06-18', '10 Rue des Pommiers, 33000 Bordeaux', 'nicolas.lefebvre@gmail.com', 'CHEF', 5),
(12, '297510200707225', 'Charlotte', 'Michel', '1997-10-20', '2016-09-01', '16 Rue des Vignes, 33000 Bordeaux', 'charlotte.michel@gmail.com', 'TECH', 5),
(13, '181108100707154', 'Vincent', 'Roy', '1981-08-10', '2015-12-10', '7 Rue des Mimosas, 33000 Bordeaux', 'vincent.roy@gmail.com', 'ADMIN', 5),
(14, '169412181818207', 'Julie', 'Barbier', '1969-12-18', '2016-03-05', '15 Rue des Roses, 67000 Strasbourg', 'julie.barbier@gmail.com', 'CHEF', 6),
(15, '239704040404262', 'Thomas', 'Guillaume', '1979-04-04', '2018-08-25', '10 Rue des Coquelicots, 67000 Strasbourg', 'thomas.guillaume@gmail.com', 'TECH', 6),
(16, '240202181818193', 'Marie', 'Rolland', '1980-02-18', '2015-10-10', '22 Rue des Mûriers, 67000 Strasbourg', 'marie.rolland@gmail.com', 'ADMIN', 6),
(17, '204612121212226', 'Sophie', 'Renard', '1984-12-12', '2017-09-18', '14 Rue des Cerisiers, 35000 Rennes', 'sophie.renard@gmail.com', 'CHEF', 7),
(18, '187007070707141', 'Julien', 'Berger', '1987-07-07', '2018-12-01', '10 Rue des Pêchers, 44000 Nantes', 'julien.berger@gmail.com', 'TECH', 8),
(19, '295511202020202', 'Marine', 'Dupont', '1995-11-20', '2019-03-15', '18 Rue des Marguerites, 44000 Nantes', 'marine.dupont@gmail.com', 'TECH', 8),
(20, '299212161616138', 'Thomas', 'Gauthier', '1992-12-16', '2015-06-01', '13 Rue des Violettes, 44000 Nantes', 'thomas.gauthier@gmail.com', 'CHEF', 8),
(21, '261106060606209', 'Émilie', 'Rousseau', '1961-11-06', '2013-09-10', '11 Rue des Cerisiers, 45000 Orléans', 'emilie.rousseau@gmail.com', 'CHEF', 9),
(22, '207102020202207', 'Antoine', 'Lecomte', '1970-10-02', '2016-04-05', '16 Rue des Lilas, 45000 Orléans', 'antoine.lecomte@gmail.com', 'TECH', 9),
(23, '258611151515182', 'Julie', 'Noël', '1958-11-15', '2018-12-15', '14 Rue des Amandiers, 21000 Dijon', 'julie.noel@gmail.com', 'CHEF', 10),
(24, '277107080808130', 'Louis', 'Baron', '1977-07-08', '2014-02-01', '10 Rue des Violettes, 21000 Dijon', 'louis.baron@gmail.com', 'TECH', 10),
(25, '291104131313202', 'Sophie', 'Leroy', '1991-11-04', '2016-05-20', '12 Rue des Lilas, 69001 Lyon', 'sophie.leroy@gmail.com', 'CHEF', 11),
(26, '190801805051110', 'Lucas', 'Girard', '1985-05-18', '2023-08-01', '12 Rue des Capucins, 30000 Nîmes', 'lucas.girard@gmail.com', 'CHEF', 12),
(27, '200109201414141', 'Alexandre', 'Fournier', '1981-09-20', '2023-04-20', '16 Rue des Fleurs, 75008 Paris', 'alexandre.fournier@gmail.com', 'CHEF', 13),
(28, '210312161722218', 'Sophie', 'Laurent', '1991-03-16', '2023-10-20', '20 Rue des Roses, 06400 Cannes', 'sophie.laurent@gmail.com', 'CHEF', 14),
(29, '220712171420401', 'Marie', 'Rolland', '1982-07-17', '2023-12-25', '22 Rue des Mûriers, 54000 Nancy', 'marie.rolland@gmail.com', 'CHEF', 15),
(30, '230811211515201', 'Juliette', 'Martel', '1983-08-11', '2023-04-10', '20 Rue des Orchidées, 84000 Avignon', 'juliette.martel@gmail.com', 'CHEF', 16),
(31, '240512221617301', 'Louis', 'Baron', '1984-05-12', '2023-10-05', '10 Rue des Violettes, 73000 Chambéry', 'louis.baron@gmail.com', 'CHEF', 17),
(32, '250111232013104', 'Sophie', 'Leroy', '1985-01-11', '2023-07-18', '12 Rue des Lilas, 76000 Rouen', 'sophie.leroy@gmail.com', 'CHEF', 18),
(33, '260612240518207', 'Léa', 'Roux', '1986-06-12', '2023-12-15', '10 Rue des Pêchers, 76600 Le Havre', 'lea.roux@gmail.com', 'CHEF', 19),
(34, '270312250513301', 'Matthieu', 'Fournier', '1987-03-12', '2023-07-20', '18 Rue des Pommiers, 49100 Angers', 'matthieu.fournier@gmail.com', 'CHEF', 20),
(35, '280613260618402', 'Julie', 'Dupont', '1988-06-13', '2023-11-15', '22 Rue des Lilas, 72000 Le Mans', 'julie.dupont@gmail.com', 'CHEF', 21),
(36, '290214270723103', 'Lucie', 'Guérin', '1989-02-14', '2023-09-01', '10 Rue des Roses, 80000 Amiens', 'lucie.guerin@gmail.com', 'CHEF', 22),
(37, '100515280828204', 'Antoine', 'Marchand', '1980-05-15', '2023-11-15', '16 Rue des Violettes, 26000 Valence', 'antoine.marchand@gmail.com', 'CHEF', 23),
(38, '110816290933305', 'Juliette', 'Garnier', '1981-08-16', '2023-08-01', '5 Rue Gaston de Saporta, 13100 Aix-en-Provence', 'juliette.garnier@gmail.com', 'CHEF', 24),
(39, '120117301038406', 'Gabriel', 'Picard', '1982-01-17', '2023-12-01', '10 Rue de Siam, 29200 Brest', 'gabriel.picard@gmail.com', 'CHEF', 25),
(40, '190308150300123', 'Santino', 'Bianco', '1985-08-15', '2022-04-05', '25 Rue Paradis, 13001 Marseille', 'santino.bianco@gmail.com', 'TECH', 1),
(41, '190307290300223', 'Lorena', 'Vargas', '1985-07-29', '2022-04-07', '15 Rue de Metz, 31000 Toulouse', 'lorena.vargas@gmail.com', 'TECH', 2),
(42, '190306030300323', 'Mateo', 'Moreno', '1985-06-03', '2022-04-09', '30 Rue Masséna, 06000 Nice', 'mateo.moreno@gmail.com', 'TECH', 3),
(43, '190304220300423', 'Esperanza', 'Santos', '1985-04-22', '2022-04-11', '5 Rue Paradis, 59000 Lille', 'esperanza.santos@gmail.com', 'TECH', 4),
(44, '190301100300523', 'Rafael', 'Romero', '1985-01-10', '2022-04-13', '22 Rue de la Pomme, 33000 Bordeaux', 'rafael.romero@gmail.com', 'TECH', 5),
(45, '190303200300623', 'Carmen', 'Gonzalez', '1985-03-20', '2022-04-15', '12 Rue de la Liberté, 33000 Bordeaux', 'carmen.gonzalez@gmail.com', 'TECH', 5),
(46, '190312050300723', 'Joaquin', 'Navarro', '1985-12-05', '2022-04-17', '8 Rue de la Paix, 67000 Strasbourg', 'joaquin.navarro@gmail.com', 'TECH', 6),
(47, '190309210300823', 'Marisol', 'Rodriguez', '1985-09-21', '2022-04-19', '18 Rue de l''Amour, 67000 Strasbourg', 'marisol.rodriguez@gmail.com', 'TECH', 6),
(48, '190305120300923', 'Salvador', 'Fernandez', '1985-05-12', '2022-04-21', '3 Rue de la République, 35000 Rennes', 'salvador.fernandez@gmail.com', 'TECH', 7),
(49, '190302030301023', 'Luna', 'Morales', '1985-02-03', '2022-04-23', '7 Rue du Commerce, 35000 Rennes', 'luna.morales@gmail.com', 'TECH', 7),
(50, '190310150301123', 'Diego', 'Alvarez', '1985-10-15', '2022-04-25', '22 Rue des Arts, 44000 Nantes', 'diego.alvarez@gmail.com', 'TECH', 8),
(51, '190311200301223', 'Estrella', 'Silva', '1985-11-20', '2022-04-27', '13 Rue de l''Étoile, 44000 Nantes', 'estrella.silva@gmail.com', 'TECH', 8),
(52, '190312100301323', 'Alejandro', 'Perez', '1985-12-10', '2022-04-29', '5 Rue des Artistes, 26000 Valence', 'alejandro.perez@gmail.com', 'TECH', 23),
(53, '190310050301423', 'Rosa', 'Hernandez', '1985-10-05', '2022-05-01', '9 Rue des Oliviers, 26000 Valence', 'rosa.hernandez@gmail.com', 'TECH', 23),
(54, '190303250301523', 'Pablo', 'Diaz', '1985-03-25', '2022-05-03', '15 Rue des Roses, 13100 Aix-en-Provence', 'pablo.diaz@gmail.com', 'TECH', 24),
(55, '190301090301623', 'Sofia', 'Lopez', '1985-01-09', '2022-05-05', '8 Rue des Lavandes, 13100 Aix-en-Provence', 'sofia.lopez@gmail.com', 'TECH', 24),
(56, '190307280301723', 'Javier', 'Gomez', '1985-07-28', '2022-05-07', '11 Rue du Port, 29200 Brest', 'javier.gomez@gmail.com', 'TECH', 25),
(57, '190303140301823', 'Isabel', 'Torres', '1985-03-14', '2022-05-09', '6 Rue du Château, 29200 Brest', 'isabel.torres@gmail.com', 'TECH', 25),
(58, '190306040301923', 'Juan', 'Martinez', '1985-06-04', '2022-05-11', '14 Rue des Cèdres, 76600 Le Havre', 'juan.martinez@gmail.com', 'TECH', 19),
(59, '190308090302023', 'Maria', 'Sanchez', '1985-08-09', '2022-05-13', '3 Rue des Roses, 76600 Le Havre', 'maria.sanchez@gmail.com', 'TECH', 19),
(60, '190310260302127', 'Carlos', 'Ruiz', '1985-10-26', '2022-05-15', '18 Rue des Tulipes, 49100 Angers', 'carlos.ruiz@gmail.com', 'TECH', 20),
(61, '190312310302223', 'Ana', 'Garcia', '1985-12-31', '2022-05-17', '9 Rue des Lilas, 49100 Angers', 'ana.garcia@gmail.com', 'TECH', 20),
(62, '190301150302323', 'Pedro', 'Alonso', '1985-01-15', '2022-05-19', '12 Rue des Orchidées, 72000 Le Mans', 'pedro.alonso@gmail.com', 'TECH', 21),
(63, '190306200302423', 'Teresa', 'Gutierrez', '1985-06-20', '2022-05-21', '4 Rue des Violettes, 72000 Le Mans', 'teresa.gutierrez@gmail.com', 'TECH', 21),
(64, '190308310302523', 'Fernando', 'Dominguez', '1985-08-31', '2022-05-23', '6 Rue des Pins, 75008 Paris', 'fernando.dominguez@gmail.com', 'TECH', 13),
(65, '190307040302623', 'Marina', 'Santos', '1985-07-04', '2022-05-25', '9 Rue des Roses, 75008 Paris', 'marina.santos@gmail.com', 'TECH', 13),
(66, '190306090302723', 'Juan', 'Hernandez', '1985-06-09', '2022-05-27', '7 Rue des Tulipes, 06400 Cannes', 'juan.hernandez@gmail.com', 'TECH', 14),
(67, '190308080302823', 'Ana', 'Rodriguez', '1985-08-08', '2022-05-29', '2 Rue des Pivoines, 06400 Cannes', 'ana.rodriguez@gmail.com', 'TECH', 14),
(68, '190310210302923', 'Carlos', 'Gonzalez', '1985-10-21', '2022-05-31', '16 Rue des Marguerites, 54000 Nancy', 'carlos.gonzalez@gmail.com', 'TECH', 15),
(69, '190311280303423', 'Maria', 'Martinez', '1985-11-28', '2022-06-02', '10 Rue des Coquelicots, 54000 Nancy', 'maria.martinez@gmail.com', 'TECH', 15),
(70, '190312100301333', 'Ignacio', 'Moreno', '1985-12-10', '2022-04-29', '10 Rue des Capucins, 69001 Lyon', 'ignacio.moreno@gmail.com', 'TECH', 11),
(71, '190306040301913', 'Manuela', 'Sanchez', '1985-06-04', '2022-05-11', '12 Rue de la Couronne, 30000 Nîmes', 'manuela.sanchez@gmail.com', 'TECH', 12),
(72, '190308080302828', 'Alejandro', 'Perez', '1985-08-08', '2022-05-29', '8 Rue des Lices, 84000 Avignon', 'alejandro.perez@gmail.com', 'TECH', 16),
(73, '190310260302123', 'Marina', 'Gonzalez', '1985-10-26', '2022-06-15', '15 Rue des Alpes, 73000 Chambéry', 'marina.gonzalez@gmail.com', 'TECH', 17),
(74, '190307310302523', 'Javier', 'Fernandez', '1985-07-31', '2022-07-01', '30 Rue des Carmes, 76000 Rouen', 'javier.fernandez@gmail.com', 'TECH', 18),
(75, '190311280303023', 'Diego', 'Alvarez', '1985-11-28', '2022-07-17', '10 Rue des Anges, 49000 Angers', 'diego.alvarez@gmail.com', 'TECH', 20),
(76, '190303200200623', 'Maria', 'Sanchez', '1985-03-20', '2022-07-29', '12 Rue des Lilas, 80000 Amiens', 'maria.sanchez@gmail.com', 'TECH', 22),
(77, '190304100300523', 'Raphael', 'Romero', '1985-01-10', '2022-08-12', '22 Rue des Roses, 59000 Lille', 'raphael.romero@gmail.com', 'TECH', 4),
(78, '286504110904118', 'Camille', 'Perrin', '1986-04-11', '2017-03-06', '9 Rue du Taur, 31000 Toulouse', 'camille.perrin@gmail.com', 'ADMIN', 2),
(79, '190209230905119', 'Hugo', 'Fabre', '1982-09-23', '2020-09-14', '4 Rue Alsace-Lorraine, 31000 Toulouse', 'hugo.fabre@gmail.com', 'ADMIN', 2),
(80, '279307050906120', 'Clara', 'Vasseur', '1979-07-05', '2013-01-07', '21 Rue de Rivoli, 75001 Paris', 'clara.vasseur@gmail.com', 'ADMIN', 13),
(81, '190112180907121', 'Adrien', 'Chevalier', '1991-12-18', '2019-05-13', '6 Rue Oberkampf, 75011 Paris', 'adrien.chevalier@gmail.com', 'ADMIN', 13),
(82, '284611270908122', 'Nadia', 'Benali', '1984-11-27', '2016-06-20', '30 Rue Garibaldi, 69003 Lyon', 'nadia.benali@gmail.com', 'ADMIN', 11),
(83, '190306140909123', 'Yanis', 'Costa', '1983-06-14', '2018-02-05', '12 Rue Sainte, 13001 Marseille', 'yanis.costa@gmail.com', 'ADMIN', 1),
(84, '190405030910124', 'Selim', 'Aubert', '1984-05-03', '2021-01-11', '18 Rue de Charonne, 75011 Paris', 'selim.aubert@gmail.com', 'TECH', 13),
(85, '287802160911125', 'Ines', 'Delaunay', '1987-02-16', '2021-03-08', '7 Avenue de Paris, 78000 Versailles', 'ines.delaunay@gmail.com', 'TECH', 13);

INSERT INTO sensor (id_sensor, id_activity, id_gaz, id_agent, id_city) VALUES
(1, 3, 1, 2, 'MAR'),
(2, 6, 5, 41, 'TOU'),
(3, 11, 2, 42, 'NCE'),
(4, 8, 7, 43, 'LIL'),
(5, 5, 3, 44, 'BOR'),
(6, 7, 6, 46, 'STR'),
(7, 1, 8, 48, 'REN'),
(8, 10, 4, 50, 'NAN'),
(9, 4, 1, 22, 'ORL'),
(10, 12, 2, 24, 'DIJ'),
(11, 2, 3, 70, 'LYO'),
(12, 9, 4, 65, 'PAR'),
(13, 3, 5, 67, 'CAN'),
(14, 6, 6, 71, 'NIM'),
(15, 11, 7, 68, 'NAC'),
(16, 8, 8, 72, 'AVE'),
(17, 5, 1, 73, 'CHA'),
(18, 7, 2, 74, 'ROU'),
(19, 1, 3, 58, 'LEH'),
(20, 10, 4, 75, 'ANG'),
(21, 4, 5, 62, 'LEL'),
(22, 12, 6, 76, 'AMI'),
(23, 2, 7, 52, 'VAL'),
(24, 9, 8, 55, 'AIX'),
(25, 3, 1, 57, 'BRE'),
(26, 6, 2, 40, 'MAR'),
(27, 11, 3, 41, 'TOU'),
(28, 8, 4, 42, 'NCE'),
(29, 5, 5, 77, 'LIL'),
(30, 7, 6, 45, 'BOR'),
(31, 4, 8, 64, 'PAR'),
(32, 1, 1, 65, 'PAR'),
(33, 7, 9, 84, 'VER'),
(34, 3, 3, 85, 'CRE'),
(35, 4, 10, 64, 'BOU'),
(36, 2, 4, 65, 'CRE'),
(37, 9, 8, 85, 'VER'),
(38, 4, 10, 40, 'AJA'),
(39, 5, 9, 2, 'AJA'),
(40, 7, 9, 12, 'BOR'),
(41, 4, 10, 70, 'LYO');

INSERT INTO record (id_record, data_record, date_record, id_sensor) VALUES
(1, 10.5, '2014-03-15', 15), 
(2, 8.7, '2015-07-23', 28), 
(3, 15.2, '2016-09-08', 7), 
(4, 12.3, '2017-04-12', 20), 
(5, 9.8, '2018-12-06', 10), 
(6, 11.0, '2019-08-19', 4), 
(7, 14.5, '2020-10-27', 29), 
(8, 7.9, '2014-11-30', 12), 
(9, 13.2, '2015-05-14', 2), 
(10, 10.1, '2016-08-02', 17), 
(11, 8.4, '2017-01-17', 30), 
(12, 16.8, '2018-06-29', 1), 
(13, 9.3, '2019-09-03', 8), 
(14, 11.7, '2020-02-14', 24), 
(15, 14.0, '2021-07-08', 3), 
(16, 6.8, '2014-10-04', 11), 
(17, 12.6, '2015-06-22', 25), 
(18, 10.9, '2016-09-30', 16), 
(19, 8.2, '2017-11-13', 18), 
(20, 13.5, '2018-03-25', 19), 
(21, 9.7, '2019-01-19', 13), 
(22, 11.3, '2020-05-02', 22), 
(23, 16.1, '2021-09-11', 23), 
(24, 8.8, '2022-04-27', 6), 
(25, 10.2, '2023-11-18', 27), 
(26, 15.9, '2024-08-03', 9), 
(27, 7.5, '2014-12-10', 5), 
(28, 12.0, '2015-08-14', 21), 
(29, 9.0, '2016-10-01', 14), 
(30, 14.3, '2017-12-25', 26), 
(31, 11.5, '2018-02-03', 30), 
(32, 9.4, '2019-05-16', 3), 
(33, 13.8, '2020-08-28', 8), 
(34, 8.6, '2021-03-09', 17), 
(35, 10.8, '2022-06-19', 21), 
(36, 15.0, '2023-10-02', 29), 
(37, 7.2, '2014-05-11', 26), 
(38, 11.9, '2015-01-27', 15), 
(39, 9.5, '2016-04-18', 2), 
(40, 13.3, '2017-09-07', 12), 
(41, 8.1, '2018-11-30', 18), 
(42, 12.4, '2019-03-21', 28), 
(43, 10.6, '2020-06-12', 5), 
(44, 14.7, '2021-08-24', 9), 
(45, 7.4, '2022-12-05', 14), 
(46, 11.1, '2023-02-17', 30), 
(47, 9.9, '2014-04-28', 3), 
(48, 13.1, '2015-07-06', 8), 
(49, 8.3, '2016-10-16', 16), 
(50, 12.2, '2017-11-29', 24), 
(51, 16.5, '2018-01-14', 19), 
(52, 7.7, '2019-05-27', 26), 
(53, 10.7, '2020-07-08', 11), 
(54, 14.9, '2021-09-21', 7), 
(55, 6.5, '2022-11-03', 22), 
(56, 12.9, '2023-12-17', 10), 
(57, 9.1, '2014-02-23', 18), 
(58, 11.2, '2015-04-07', 27), 
(59, 8.5, '2016-06-20', 9), 
(60, 13.4, '2017-08-03', 5), 
(61, 8.9, '2018-09-16', 30), 
(62, 12.5, '2019-11-29', 14), 
(63, 16.6, '2021-02-10', 3), 
(64, 7.3, '2022-03-26', 17), 
(65, 11.8, '2023-06-07', 22), 
(66, 10.4, '2024-08-20', 8), 
(67, 13.7, '2014-01-04', 1), 
(68, 9.6, '2015-03-18', 25), 
(69, 12.7, '2016-05-31', 16), 
(70, 14.6, '2017-07-14', 19), 
(71, 7.6, '2018-09-27', 13), 
(72, 11.6, '2019-12-10', 28), 
(73, 8.0, '2021-02-22', 6), 
(74, 12.1, '2022-04-07', 21), 
(75, 16.0, '2023-06-20', 26), 
(76, 6.9, '2024-09-02', 15), 
(77, 14.2, '2014-05-15', 23), 
(78, 9.2, '2015-07-28', 24), 
(79, 13.9, '2016-10-10', 11), 
(80, 8.7, '2017-12-24', 27), 
(81, 10.3, '2019-03-08', 4), 
(82, 15.8, '2020-05-21', 21), 
(83, 7.8, '2021-08-03', 28), 
(84, 11.0, '2022-10-16', 13), 
(85, 16.2, '2023-12-29', 29), 
(86, 6.7, '2014-02-11', 16), 
(87, 12.6, '2015-04-25', 29), 
(88, 9.9, '2016-07-08', 2), 
(89, 14.4, '2017-09-21', 19), 
(90, 7.1, '2018-12-04', 23), 
(91, 11.3, '2020-02-16', 18), 
(92, 15.7, '2021-04-01', 27), 
(93, 6.6, '2022-06-14', 12), 
(94, 12.8, '2023-08-27', 22), 
(95, 9.3, '2014-11-09', 3), 
(96, 13.0, '2016-01-23', 9), 
(97, 7.7, '2017-04-07', 15), 
(98, 10.0, '2018-06-20', 24), 
(99, 14.5, '2019-09-02', 30), 
(100, 6.3, '2020-11-15', 4), 
(101, 12.0, '2022-01-28', 10), 
(102, 16.3, '2023-04-13', 16), 
(103, 6.4, '2024-06-26', 21), 
(104, 11.4, '2014-09-08', 26), 
(105, 16.4, '2015-11-22', 7), 
(106, 7.0, '2017-02-05', 22), 
(107, 11.9, '2018-04-20', 28), 
(108, 15.6, '2019-07-03', 13), 
(109, 7.5, '2020-09-16', 19), 
(110, 12.7, '2021-11-29', 24), 
(111, 9.4, '2023-02-12', 29), 
(112, 13.5, '2024-04-26', 5), 
(113, 6.2, '2014-07-10', 14), 
(114, 11.2, '2015-09-24', 23), 
(115, 16.1, '2016-12-07', 8), 
(116, 7.3, '2018-02-19', 17), 
(117, 11.8, '2019-04-04', 24), 
(118, 15.5, '2020-06-17', 30), 
(119, 7.4, '2021-08-30', 5), 
(120, 13.6, '2022-11-12', 11), 
(121, 9.5, '2024-01-25', 17), 
(122, 12.9, '2014-03-10', 23), 
(123, 16.0, '2015-05-24', 30), 
(124, 6.1, '2016-08-06', 9), 
(125, 12.6, '2017-10-19', 16), 
(126, 7.2, '2019-01-01', 22), 
(127, 11.7, '2020-03-15', 28), 
(128, 15.4, '2021-05-28', 13), 
(129, 7.3, '2022-08-10', 19), 
(130, 13.7, '2023-10-23', 24), 
(131, 9.6, '2024-12-05', 29), 
(132, 12.8, '2014-02-17', 4), 
(133, 15.9, '2015-04-03', 11), 
(134, 6.0, '2016-06-16', 18), 
(135, 12.5, '2017-08-29', 25), 
(136, 7.1, '2018-11-11', 30), 
(137, 11.6, '2020-01-24', 5), 
(138, 15.3, '2021-04-08', 12), 
(139, 7.8, '2022-06-21', 20), 
(140, 13.8, '2023-09-04', 27), 
(141, 9.7, '2024-11-17', 3), 
(142, 12.4, '2014-01-31', 10), 
(143, 16.3, '2015-04-16', 16), 
(144, 6.9, '2016-07-29', 22), 
(145, 13.0, '2017-10-11', 28), 
(146, 9.8, '2019-12-24', 13), 
(147, 11.5, '2021-03-08', 19), 
(148, 14.2, '2022-05-21', 25), 
(149, 6.7, '2023-08-03', 30), 
(150, 12.1, '2024-10-16', 5), 
(151, 15.7, '2014-12-28', 11), 
(152, 7.0, '2016-03-12', 17), 
(153, 12.3, '2017-05-25', 24), 
(154, 15.2, '2018-08-07', 30), 
(155, 7.9, '2019-10-20', 6), 
(156, 10.6, '2020-12-02', 12), 
(157, 15.0, '2022-02-14', 19), 
(158, 6.8, '2023-04-29', 25), 
(159, 11.4, '2024-07-13', 30), 
(160, 14.8, '2015-09-26', 5), 
(161, 6.6, '2016-12-09', 11), 
(162, 12.2, '2018-02-21', 18), 
(163, 15.1, '2019-05-06', 24), 
(164, 7.0, '2020-07-19', 29), 
(165, 11.3, '2021-09-01', 4), 
(166, 14.1, '2022-11-14', 10), 
(167, 6.5, '2024-01-27', 16), 
(168, 12.0, '2014-03-12', 22), 
(169, 15.8, '2015-05-25', 27), 
(170, 7.7, '2016-08-06', 3), 
(171, 10.4, '2017-10-19', 8), 
(172, 14.3, '2018-12-02', 14), 
(173, 6.2, '2020-01-15', 20), 
(174, 11.1, '2021-03-30', 26), 
(175, 15.5, '2022-06-12', 2), 
(176, 7.6, '2023-08-25', 7), 
(177, 10.8, '2024-11-07', 13), 
(178, 14.4, '2014-01-20', 19), 
(179, 6.3, '2015-04-04', 24), 
(180, 11.0, '2016-06-17', 30), 
(181, 15.6, '2017-08-30', 5), 
(182, 7.5, '2018-11-12', 11), 
(183, 10.9, '2020-01-25', 17), 
(184, 14.5, '2021-04-09', 23), 
(185, 6.4, '2022-06-22', 29), 
(186, 11.2, '2023-09-05', 6), 
(187, 16.0, '2024-11-18', 12), 
(188, 6.1, '2014-02-01', 18), 
(189, 12.6, '2015-04-16', 24), 
(190, 15.9, '2016-07-30', 30), 
(191, 6.0, '2017-10-12', 5), 
(192, 10.7, '2019-12-25', 11), 
(193, 15.4, '2021-03-09', 17), 
(194, 6.9, '2022-05-22', 23), 
(195, 11.5, '2023-08-04', 29), 
(196, 15.8, '2024-10-17', 6), 
(197, 6.2, '2014-01-30', 12), 
(198, 12.8, '2015-04-14', 18), 
(199, 15.7, '2016-06-27', 24), 
(200, 7.3, '2017-09-10', 30);

-- Relevés des capteurs ajoutés (Ile-de-France, Corse, acidificateurs).
INSERT INTO record (id_record, data_record, date_record, id_sensor) VALUES
(201, 19.6, '2019-06-05', 31),
(202, 37.5, '2019-01-03', 31),
(203, 27.5, '2020-02-12', 31),
(204, 4.6, '2020-09-07', 31),
(205, 5.9, '2020-07-14', 31),
(206, 20.8, '2021-02-18', 31),
(207, 42.8, '2021-10-04', 31),
(208, 27.5, '2022-11-21', 31),
(209, 27.6, '2022-01-19', 31),
(210, 5.0, '2019-01-08', 32),
(211, 20.6, '2019-03-10', 32),
(212, 27.0, '2020-09-04', 32),
(213, 31.6, '2020-09-27', 32),
(214, 27.0, '2020-02-19', 32),
(215, 7.1, '2021-04-12', 32),
(216, 26.7, '2021-12-03', 32),
(217, 23.8, '2022-10-07', 32),
(218, 35.6, '2022-09-14', 32),
(219, 41.8, '2019-08-19', 33),
(220, 13.4, '2019-06-10', 33),
(221, 35.8, '2020-03-23', 33),
(222, 15.6, '2020-02-19', 33),
(223, 33.6, '2020-08-11', 33),
(224, 44.2, '2021-05-20', 33),
(225, 20.6, '2021-02-17', 33),
(226, 42.2, '2022-06-05', 33),
(227, 43.4, '2022-07-02', 33),
(228, 26.4, '2019-02-25', 34),
(229, 32.2, '2019-06-11', 34),
(230, 27.4, '2020-10-16', 34),
(231, 38.3, '2020-08-03', 34),
(232, 32.3, '2020-05-16', 34),
(233, 33.7, '2021-02-02', 34),
(234, 27.3, '2021-05-21', 34),
(235, 21.7, '2022-11-27', 34),
(236, 40.3, '2022-12-13', 34),
(237, 42.5, '2019-06-01', 35),
(238, 28.7, '2019-06-06', 35),
(239, 12.2, '2020-08-02', 35),
(240, 34.0, '2020-05-05', 35),
(241, 41.5, '2020-07-13', 35),
(242, 10.0, '2021-08-03', 35),
(243, 14.7, '2021-07-18', 35),
(244, 21.1, '2022-03-27', 35),
(245, 32.7, '2022-09-09', 35),
(246, 40.1, '2019-06-22', 36),
(247, 6.5, '2019-04-05', 36),
(248, 30.7, '2020-03-08', 36),
(249, 37.9, '2020-01-16', 36),
(250, 14.8, '2020-03-09', 36),
(251, 25.5, '2021-03-14', 36),
(252, 16.4, '2021-10-19', 36),
(253, 39.1, '2022-03-23', 36),
(254, 31.4, '2022-10-21', 36),
(255, 40.8, '2019-01-15', 37),
(256, 26.5, '2019-11-26', 37),
(257, 19.6, '2020-07-13', 37),
(258, 19.8, '2020-08-21', 37),
(259, 44.4, '2020-04-03', 37),
(260, 7.6, '2021-08-06', 37),
(261, 7.3, '2021-10-02', 37),
(262, 25.5, '2022-10-05', 37),
(263, 4.1, '2022-06-20', 37),
(264, 18.8, '2019-04-20', 38),
(265, 43.1, '2019-11-09', 38),
(266, 22.9, '2020-10-12', 38),
(267, 23.5, '2020-02-28', 38),
(268, 23.3, '2020-08-16', 38),
(269, 7.3, '2021-02-05', 38),
(270, 14.1, '2021-06-24', 38),
(271, 24.7, '2022-12-06', 38),
(272, 18.2, '2022-04-17', 38),
(273, 41.4, '2019-12-18', 39),
(274, 44.1, '2019-09-10', 39),
(275, 38.5, '2020-02-23', 39),
(276, 41.1, '2020-09-12', 39),
(277, 12.4, '2020-06-25', 39),
(278, 24.1, '2021-09-25', 39),
(279, 28.8, '2021-11-08', 39),
(280, 13.1, '2022-04-26', 39),
(281, 36.7, '2022-07-24', 39),
(282, 23.7, '2019-04-17', 40),
(283, 44.6, '2019-12-01', 40),
(284, 13.9, '2020-05-16', 40),
(285, 43.2, '2020-12-20', 40),
(286, 42.4, '2020-08-26', 40),
(287, 6.4, '2021-06-12', 40),
(288, 22.7, '2021-02-08', 40),
(289, 23.3, '2022-06-07', 40),
(290, 3.1, '2022-10-27', 40),
(291, 36.6, '2019-11-12', 41),
(292, 30.7, '2019-02-27', 41),
(293, 32.9, '2020-07-26', 41),
(294, 40.3, '2020-04-16', 41),
(295, 29.7, '2020-07-26', 41),
(296, 42.7, '2021-02-26', 41),
(297, 22.5, '2021-12-13', 41),
(298, 33.4, '2022-12-03', 41),
(299, 4.2, '2022-03-05', 41);

-- Rapports thématiques (un gaz, une region, un secteur), comme décrit par le
-- client. La parution est toujours postérieure aux données concernées.
INSERT INTO report (id_report, report_name, date_report) VALUES
(1, 'Bilan annuel 2018 - France', '2019-03-29'),
(2, 'Bilan annuel 2019 - France', '2020-03-31'),
(3, 'Bilan annuel 2020 - France', '2021-03-31'),
(4, 'Bilan annuel 2021 - France', '2022-03-31'),
(5, 'Bilan annuel 2022 - France', '2023-03-31'),
(6, 'Qualite de l''air en Ile-de-France 2020', '2021-06-30'),
(7, 'Suivi du NH3 en Occitanie 2016-2021', '2022-05-31'),
(8, 'Suivi du NH3 a Lyon 2014-2020', '2021-09-30'),
(9, 'Polluants acidificateurs 2019-2022', '2023-06-30'),
(10, 'Emissions du transport routier 2017-2021', '2022-09-30'),
(11, 'Gaz a effet de serre du Grand Est 2014-2019', '2020-11-30'),
(12, 'Suivi du SO2 en Corse 2019-2022', '2023-04-28');

-- Un rapport peut être écrit par plusieurs administratifs : certains sont co-signés.
INSERT INTO writing (id_report, id_agent) VALUES
(1, 5),
(1, 10),
(2, 16),
(3, 13),
(3, 80),
(4, 10),
(5, 5),
(5, 78),
(6, 80),
(6, 81),
(7, 78),
(7, 79),
(8, 82),
(9, 13),
(9, 81),
(9, 79),
(10, 83),
(10, 5),
(11, 16),
(12, 83),
(12, 82);

-- Contenu des rapports : un INSERT ... SELECT par rapport, chacun avec le critere qui définit son périmètre.

-- Rapport 1 : Bilan annuel 2018 - France
INSERT INTO give (id_record, id_report)
SELECT r.id_record, 1
FROM record r
INNER JOIN sensor s ON s.id_sensor = r.id_sensor
INNER JOIN gaz g ON g.id_gaz = s.id_gaz
INNER JOIN type t ON t.id_type = g.id_type
INNER JOIN activity_sector a ON a.id_activity = s.id_activity
INNER JOIN city c ON c.id_city = s.id_city
INNER JOIN region reg ON reg.id_region = c.id_region
WHERE YEAR(r.date_record) = 2018;

-- Rapport 2 : Bilan annuel 2019 - France
INSERT INTO give (id_record, id_report)
SELECT r.id_record, 2
FROM record r
INNER JOIN sensor s ON s.id_sensor = r.id_sensor
INNER JOIN gaz g ON g.id_gaz = s.id_gaz
INNER JOIN type t ON t.id_type = g.id_type
INNER JOIN activity_sector a ON a.id_activity = s.id_activity
INNER JOIN city c ON c.id_city = s.id_city
INNER JOIN region reg ON reg.id_region = c.id_region
WHERE YEAR(r.date_record) = 2019;

-- Rapport 3 : Bilan annuel 2020 - France
INSERT INTO give (id_record, id_report)
SELECT r.id_record, 3
FROM record r
INNER JOIN sensor s ON s.id_sensor = r.id_sensor
INNER JOIN gaz g ON g.id_gaz = s.id_gaz
INNER JOIN type t ON t.id_type = g.id_type
INNER JOIN activity_sector a ON a.id_activity = s.id_activity
INNER JOIN city c ON c.id_city = s.id_city
INNER JOIN region reg ON reg.id_region = c.id_region
WHERE YEAR(r.date_record) = 2020;

-- Rapport 4 : Bilan annuel 2021 - France
INSERT INTO give (id_record, id_report)
SELECT r.id_record, 4
FROM record r
INNER JOIN sensor s ON s.id_sensor = r.id_sensor
INNER JOIN gaz g ON g.id_gaz = s.id_gaz
INNER JOIN type t ON t.id_type = g.id_type
INNER JOIN activity_sector a ON a.id_activity = s.id_activity
INNER JOIN city c ON c.id_city = s.id_city
INNER JOIN region reg ON reg.id_region = c.id_region
WHERE YEAR(r.date_record) = 2021;

-- Rapport 5 : Bilan annuel 2022 - France
INSERT INTO give (id_record, id_report)
SELECT r.id_record, 5
FROM record r
INNER JOIN sensor s ON s.id_sensor = r.id_sensor
INNER JOIN gaz g ON g.id_gaz = s.id_gaz
INNER JOIN type t ON t.id_type = g.id_type
INNER JOIN activity_sector a ON a.id_activity = s.id_activity
INNER JOIN city c ON c.id_city = s.id_city
INNER JOIN region reg ON reg.id_region = c.id_region
WHERE YEAR(r.date_record) = 2022;

-- Rapport 6 : Qualité de l'air en Ile-de-France 2020
INSERT INTO give (id_record, id_report)
SELECT r.id_record, 6
FROM record r
INNER JOIN sensor s ON s.id_sensor = r.id_sensor
INNER JOIN gaz g ON g.id_gaz = s.id_gaz
INNER JOIN type t ON t.id_type = g.id_type
INNER JOIN activity_sector a ON a.id_activity = s.id_activity
INNER JOIN city c ON c.id_city = s.id_city
INNER JOIN region reg ON reg.id_region = c.id_region
WHERE reg.region_name = 'Île-de-France' AND YEAR(r.date_record) = 2020;

-- Rapport 7 : Suivi du NH3 en Occitanie 2016-2021
INSERT INTO give (id_record, id_report)
SELECT r.id_record, 7
FROM record r
INNER JOIN sensor s ON s.id_sensor = r.id_sensor
INNER JOIN gaz g ON g.id_gaz = s.id_gaz
INNER JOIN type t ON t.id_type = g.id_type
INNER JOIN activity_sector a ON a.id_activity = s.id_activity
INNER JOIN city c ON c.id_city = s.id_city
INNER JOIN region reg ON reg.id_region = c.id_region
WHERE g.gaz_name = 'NH3' AND reg.region_name = 'Occitanie'
        AND YEAR(r.date_record) BETWEEN 2016 AND 2021;

-- Rapport 8 : Suivi du NH3 à Lyon 2014-2020
INSERT INTO give (id_record, id_report)
SELECT r.id_record, 8
FROM record r
INNER JOIN sensor s ON s.id_sensor = r.id_sensor
INNER JOIN gaz g ON g.id_gaz = s.id_gaz
INNER JOIN type t ON t.id_type = g.id_type
INNER JOIN activity_sector a ON a.id_activity = s.id_activity
INNER JOIN city c ON c.id_city = s.id_city
INNER JOIN region reg ON reg.id_region = c.id_region
WHERE g.gaz_name = 'NH3' AND c.city_name = 'Lyon'
        AND YEAR(r.date_record) BETWEEN 2014 AND 2020;

-- Rapport 9 : Polluants acidificateurs 2019-2022
INSERT INTO give (id_record, id_report)
SELECT r.id_record, 9
FROM record r
INNER JOIN sensor s ON s.id_sensor = r.id_sensor
INNER JOIN gaz g ON g.id_gaz = s.id_gaz
INNER JOIN type t ON t.id_type = g.id_type
INNER JOIN activity_sector a ON a.id_activity = s.id_activity
INNER JOIN city c ON c.id_city = s.id_city
INNER JOIN region reg ON reg.id_region = c.id_region
WHERE t.gaz_type = 'GRA' AND YEAR(r.date_record) BETWEEN 2019 AND 2022;

-- Rapport 10 : Émissions du transport routier 2017-2021
INSERT INTO give (id_record, id_report)
SELECT r.id_record, 10
FROM record r
INNER JOIN sensor s ON s.id_sensor = r.id_sensor
INNER JOIN gaz g ON g.id_gaz = s.id_gaz
INNER JOIN type t ON t.id_type = g.id_type
INNER JOIN activity_sector a ON a.id_activity = s.id_activity
INNER JOIN city c ON c.id_city = s.id_city
INNER JOIN region reg ON reg.id_region = c.id_region
WHERE a.activity_name = 'Transport routier'
        AND YEAR(r.date_record) BETWEEN 2017 AND 2021;

-- Rapport 11 : Gaz à effet de serre du Grand Est 2014-2019
INSERT INTO give (id_record, id_report)
SELECT r.id_record, 11
FROM record r
INNER JOIN sensor s ON s.id_sensor = r.id_sensor
INNER JOIN gaz g ON g.id_gaz = s.id_gaz
INNER JOIN type t ON t.id_type = g.id_type
INNER JOIN activity_sector a ON a.id_activity = s.id_activity
INNER JOIN city c ON c.id_city = s.id_city
INNER JOIN region reg ON reg.id_region = c.id_region
WHERE t.gaz_type = 'GES' AND reg.region_name = 'Grand Est'
        AND YEAR(r.date_record) BETWEEN 2014 AND 2019;

-- Rapport 12 : Suivi du SO2 en Corse 2019-2022
INSERT INTO give (id_record, id_report)
SELECT r.id_record, 12
FROM record r
INNER JOIN sensor s ON s.id_sensor = r.id_sensor
INNER JOIN gaz g ON g.id_gaz = s.id_gaz
INNER JOIN type t ON t.id_type = g.id_type
INNER JOIN activity_sector a ON a.id_activity = s.id_activity
INNER JOIN city c ON c.id_city = s.id_city
INNER JOIN region reg ON reg.id_region = c.id_region
WHERE g.gaz_name = 'SO2' AND reg.region_name = 'Corse'
        AND YEAR(r.date_record) BETWEEN 2019 AND 2022;

-- Rattachement des chefs, impossible a l'insertion (agence <-> agent).
UPDATE agency a
INNER JOIN agent ag ON ag.id_agency = a.id_agency AND ag.job_name = 'CHEF'
SET a.id_manager = ag.id_agent;
