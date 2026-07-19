# Qualité de l'air — Base de données relationnelle

Projet **CESI** (module *Données et modélisation*, SQL) réalisé en première année du cycle
classe préparatoire intégrée, pour l'entreprise fictive **DATA-X**, mandatée par le ministère
de l'Écologie pour **centraliser et interroger des données publiques sur la qualité de l'air**
dans les grandes villes de France (dans la lignée des rapports du GIEC).

Les données proviennent d'un réseau d'agences réparties sur le territoire :
des **capteurs** (maintenus par des agents techniques) transmettent mensuellement des
**relevés** de gaz polluants, qui sont ensuite regroupés dans des **rapports** rédigés par des
agents administratifs.

> Projet réalisé en groupe, déjà rendu dans le cadre de la formation. Ce dépôt en conserve
> le code tel qu'il a été produit — quelques imperfections de jeu d'essai subsistent, elles
> sont assumées (voir *Limites connues*).

## Sommaire du dépôt

| Fichier | Rôle |
|---------|------|
| `Creation_des_tables.sql` | Schéma : création des 12 tables et des contraintes (clés primaires / étrangères, `CHECK`, index). |
| `Peuplement_tables.sql`   | Jeu de données d'essai (fictif) : 13 régions, 29 villes, 25 agences, 85 agents, 41 capteurs, 299 relevés, 12 rapports. |
| `Droits_utilisateurs.sql` | Création de deux comptes (`admin_air` / `user_air`) et attribution des droits (`GRANT`). |
| `Request1.sql` … `Request12.sql` | Les 12 requêtes demandées par le client (voir le tableau plus bas). |

---

## Modèle de données

Le schéma respecte la 3e forme normale. Les 12 tables :

- **`region`** — les 13 régions de France métropolitaine (Corse comprise).
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

> À noter : la table de liaison rapport ↔ agent aurait dû s'appeler `write`, mais `write` est
> un mot réservé en SQL — elle a donc été renommée `writing`.

---

## Les requêtes demandées

Le client a imposé 12 requêtes « résumés » exploitables depuis la base. Chaque fichier
`RequestN.sql` correspond à la demande n° N :

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
| 10 | Taux de productivité des agents administratifs de Toulouse | `Request10.sql` |
| 11 | Rapports contenant un gaz donné (nom du gaz en paramètre) | `Request11.sql` |
| 12 | Régions ayant plus de capteurs que d'agences | `Request12.sql` |

Pour la requête paramétrable (`Request11.sql`), le nom du gaz se règle en tête de script :

```sql
SET @gaz_name := 'NH3';   -- remplacer par le gaz souhaité
```

---

## Prérequis

- **MySQL 8.0** (ou MariaDB 10.5+). Le code utilise des fonctions spécifiques :
  `AUTO_INCREMENT`, `YEAR()`, `DATEDIFF()`, `CURDATE()`, variables utilisateur `SET @var`.
- **git** pour récupérer le dépôt.
- Un client en ligne de commande (**MySQL Command Line Client**) ou une interface
  graphique (**MySQL Workbench**).
- Encodage **UTF-8** recommandé (les données contiennent des accents : « Île-de-France »,
  « Nîmes »…).

---

## Installation / Lancement

Le parcours complet, depuis la récupération du dépôt jusqu'à l'exécution d'une requête. Les
scripts SQL ne créent pas la base de données : on la crée d'abord, puis on charge les scripts
**dans l'ordre** (tables → peuplement → droits → requêtes).

### En ligne de commande

```bash
# 1. Récupérer le dépôt et s'y placer
git clone https://github.com/Estebge/SQL.git
cd SQL

# 2. Créer la base de données
mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS qualite_air CHARACTER SET utf8mb4;"

# 3. Créer les tables (schéma + contraintes)
mysql -u root -p qualite_air < Creation_des_tables.sql

# 4. Peupler la base (jeu de données d'essai)
mysql -u root -p qualite_air < Peuplement_tables.sql

# 5. (Optionnel) Créer les comptes admin_air / user_air et leurs droits
mysql -u root -p qualite_air < Droits_utilisateurs.sql

# 6. Lancer une requête (exemple : la n° 1)
mysql -u root -p qualite_air < Request1.sql
```

> `-u root -p` : connexion en tant que `root`, `-p` demande le mot de passe de manière
> interactive (adapter l'utilisateur au besoin). Les étapes 3 à 5 chargent chacune un fichier
> dans la base `qualite_air` ; chaque `RequestN.sql` se lance ensuite de la même façon en
> changeant le numéro.

### Depuis MySQL Workbench

1. `CREATE DATABASE qualite_air;` puis sélectionner la base.
2. Ouvrir et exécuter `Creation_des_tables.sql`.
3. Ouvrir et exécuter `Peuplement_tables.sql`.
4. (Optionnel) Ouvrir et exécuter `Droits_utilisateurs.sql`.
5. Ouvrir un fichier `RequestN.sql` et l'exécuter.

---

## Limites connues

Le jeu de données est **fictif**, généré pour servir de jeu d'essai. Quelques imperfections y
subsistent : elles ne cassent aucune requête et sont laissées telles quelles.

- Certaines valeurs de relevés ne sont pas réalistes pour les gaz concernés (jeu d'essai).
- Quelques rattachements ville ↔ région ou coordonnées d'agences comportent de légères
  incohérences de saisie.
- Les mots de passe des comptes de `Droits_utilisateurs.sql` sont des mots de passe de
  **démonstration** — à changer avant tout usage réel.
