# Qualité de l'air — Base de données relationnelle

Projet de **CESI** (SQL) réalisé en première année du cycle classe préparatoire intégrée pour l'entreprise fictive **DATA-X**, mandatée par le ministère de l'Écologie pour **centraliser et interroger des données publiques sur la qualité de l'air** dans les grandes villes de France.

Les données proviennent d'un réseau d'agences météo réparties sur le territoire :
des **capteurs** (gérés par des agents techniques) transmettent mensuellement des **relevés** de gaz polluants, qui sont ensuite regroupés dans des **rapports** rédigés par des agents administratifs.

---

## Sommaire du dépôt

| Fichier | Rôle |
|---------|------|
| `Creation_des_tables.sql` | Schéma : création des 12 tables et des contraintes (clés primaires / étrangères). |
| `Peuplement_tables.sql`   | Jeu de données d'essai (25 villes/agences, ~55 agents, 30 capteurs, 200 relevés, 11 rapports). |
| `Request1.sql` … `Request11.sql` | Les requêtes demandées par le client (voir le tableau plus bas). |

---

## Modèle de données

Le schéma respecte la 3e forme normale. Les 12 tables :

- **`region`** — les 12 régions de France métropolitaine.
- **`city`** — villes, rattachées à une région (`id_region`).
- **`type`** — type de gaz : `GES` (gaz à effet de serre) ou `GRA` (gaz acidificateur).
- **`gaz`** — gaz polluant (N2O, CO2, NH3, CH4, PFC, HFC, SF6…), rattaché à un `type`.
- **`activity_sector`** — secteur d'activité (industrie, transport, agriculture…).
- **`agency`** — agence locale, située dans une `city`, avec son chef (`id_manager`).
- **`agent`** — personnel (`job_name` = `CHEF`, `TECH` ou `ADMIN`), rattaché à une agence.
- **`sensor`** — capteur : configuré pour **un** gaz et **un** secteur, maintenu par un
  agent technique, installé dans une ville.
- **`record`** — relevé mensuel : une valeur (`data_record`), une date, un capteur.
- **`report`** — rapport : un titre et une date de parution.
- **`give`** — table de liaison *relevé ↔ rapport* (un rapport regroupe plusieurs relevés).
- **`writing`** — table de liaison *rapport ↔ agent* (un rapport peut être écrit par
  plusieurs agents administratifs).

Relations principales :
`region → city → agency → agent → sensor → record → give → report → writing`

---

## Les requêtes demandées

Le client a imposé 12 requêtes « résumés » exploitables depuis la base :

| # | Demande du client | Fichier |
|---|-------------------|---------|
| 1 | Lister l'ensemble des agences | `Request1.sql` |
| 2 | Lister le personnel technique de l'agence de Bordeaux | `Request2.sql` |
| 3 | Nombre total de capteurs déployés | `Request3.sql` |
| 4 | Rapports publiés entre 2018 et 2022 | `Request4.sql` |
| 5 | Total des émissions de GES par région en 2020 | `Request5.sql` |
| 6 | Secteur d'activité le plus polluant en Île-de-France | `Request6.sql` |
| 7 | Rapports concernant le NH3, par ordre chronologique | `Request7.sql` |
| 8 | Techniciens maintenant des capteurs de gaz acidificateurs | `Request8.sql` |
| 9 | Somme des émissions par gaz en Île-de-France en 2020 | `Request9.sql` |
| 10 | Taux de productivité des agents admin de Toulouse | *(non implémentée)* |
| 11 | Rapports contenant un gaz donné (nom du gaz en paramètre) | `Request10.sql` |
| 12 | Régions ayant plus de capteurs que d'agences | `Request11.sql` |

> **Note :** les fichiers `Request10.sql` et `Request11.sql` correspondent aux demandes
> **#11** et **#12** du client. La demande **#10** (taux de productivité des
> administratifs de Toulouse) n'est pas encore implémentée.

Pour la requête paramétrable (`Request10.sql`), le nom du gaz se règle en tête de script :

```sql
SET @gaz_name := 'N2O';   -- remplacer par le gaz souhaité
```

---

## Prérequis

- **MySQL 8.0** (ou MariaDB 10.5+). Le code utilise des fonctions spécifiques :
  `AUTO_INCREMENT`, `YEAR()`, `DATE_FORMAT()`, variables utilisateur `SET @var`.
- Un client en ligne de commande (**MySQL Command Line Client**) ou une interface
  graphique (**MySQL Workbench**).
- Encodage **UTF-8** recommandé (les données contiennent des accents : « Île-de-France »,
  « Nîmes »…).

---

## Installation / Lancement

Les scripts ne créent pas la base : il faut la créer d'abord, puis charger les scripts
**dans l'ordre** (tables → peuplement → requêtes).

### En ligne de commande

```bash
# 1. Créer la base et s'y placer
mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS qualite_air CHARACTER SET utf8mb4;"

# 2. Créer les tables
mysql -u root -p qualite_air < Creation_des_tables.sql

# 3. Peupler la base
mysql -u root -p qualite_air < Peuplement_tables.sql

# 4. Lancer une requête (exemple)
mysql -u root -p qualite_air < Request1.sql
```

### Depuis MySQL Workbench

1. `CREATE DATABASE qualite_air;` puis sélectionner la base.
2. Ouvrir et exécuter `Creation_des_tables.sql`.
3. Ouvrir et exécuter `Peuplement_tables.sql`.
4. Ouvrir un fichier `RequestN.sql` et l'exécuter.

---

## Pistes d'amélioration

Éléments prévus au cahier des charges mais absents / perfectibles dans l'état actuel :

- **Requête #10** (productivité des administratifs de Toulouse) à écrire.
- **Comptes et droits** : créer au moins deux utilisateurs (`admin` et `user`) avec des
  `GRANT` adaptés.
- **Moteur de stockage** : préciser explicitement `ENGINE=InnoDB` (intégrité
  référentielle) et ajouter des **index** sur les colonnes filtrées/jointes pour
  l'optimisation.
- **Cohérence des données d'essai** : quelques dates de naissance d'agents sont dans le
  futur (test data), à corriger avant une démo.
```