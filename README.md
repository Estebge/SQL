# 🌍 Air Quality: Relational Database

**🇬🇧 English** | 🇫🇷 [Français](README.fr.md)

Project carried out at **CESI** (*Data and Modeling* module, SQL) during my first year of
integrated preparatory school, for the fictional company **DATA-X**, commissioned by the French
Ministry of Ecology to **centralize and query public air quality data** in major French cities
(in line with the IPCC reports).

The data comes from a network of agencies spread across the country: **sensors** (maintained by
technical staff) send monthly **records** of pollutant gases, which are then collected into
**reports** written by administrative staff.

> Group project, already submitted as part of the course. This repository keeps the code as it
> was produced — a few test-data imperfections remain, and they are intentional (see
> *Known limitations*).

> **Note on language:** the SQL code, comments and identifiers are in French, as they were
> written at the time. Only this README is available in English.

## Repository contents

```
Database_setup/     scripts to build the database (run in this order)
  Creation_des_tables.sql
  Peuplement_tables.sql
  Droits_utilisateurs.sql
Queries/            the 12 queries requested by the client
  Query1.sql … Query12.sql
```

| File | Purpose |
|------|---------|
| `Database_setup/Creation_des_tables.sql` | Schema: creation of the 12 tables and their constraints (primary / foreign keys, `CHECK`, indexes). |
| `Database_setup/Peuplement_tables.sql`   | Test dataset (fictional): 13 regions, 29 cities, 25 agencies, 85 staff members, 41 sensors, 299 records, 12 reports. |
| `Database_setup/Droits_utilisateurs.sql` | Creation of two accounts (`admin_air` / `user_air`) and their privileges (`GRANT`). |
| `Queries/Query1.sql` … `Queries/Query12.sql` | The 12 queries requested by the client (see the table below). |

---

## Data model

The schema is in third normal form. The 12 tables:

- **`region`** — the 13 regions of metropolitan France (Corsica included).
- **`city`** — cities, linked to a region (`id_region`).
- **`type`** — gas category: `GES` (greenhouse gas) or `GRA` (acidifying gas).
- **`gaz`** — pollutant gas (N2O, CO2, NH3, CH4, PFC, HFC, SF6…), linked to a `type`.
- **`activity_sector`** — sector of activity (industry, transport, agriculture…).
- **`agency`** — local agency, located in a `city`, with its manager (`id_manager`).
- **`agent`** — staff member (`job_name` = `CHEF`, `TECH` or `ADMIN`), attached to an agency.
- **`sensor`** — sensor: configured for **one** gas and **one** sector, maintained by a
  technical staff member, installed in a city.
- **`record`** — monthly reading: a value (`data_record`), a date, a sensor.
- **`report`** — report: a title and a publication date.
- **`give`** — join table *record ↔ report* (a report gathers several records).
- **`writing`** — join table *report ↔ agent* (a report can be written by several
  administrative staff members).

Main relationships:
`region → city → agency → agent → sensor → record → give → report → writing`

> Note: the report ↔ agent join table should have been named `write`, but `write` is a reserved
> word in SQL — so it was renamed `writing`.

---

## The requested queries

The client required 12 "summary" queries to be available from the database. Each
`Queries/QueryN.sql` file matches request number N:

| # | Client request | File |
|---|----------------|------|
| 1 | List all agencies | `Queries/Query1.sql` |
| 2 | List the technical staff of the Bordeaux agency | `Queries/Query2.sql` |
| 3 | Total number of deployed sensors | `Queries/Query3.sql` |
| 4 | Reports published between 2018 and 2022 | `Queries/Query4.sql` |
| 5 | Total greenhouse gas emissions per region in 2020 | `Queries/Query5.sql` |
| 6 | Most polluting sector of activity in Île-de-France | `Queries/Query6.sql` |
| 7 | Reports about NH3, in chronological order | `Queries/Query7.sql` |
| 8 | Technicians maintaining acidifying gas sensors | `Queries/Query8.sql` |
| 9 | Sum of emissions per gas in Île-de-France in 2020 | `Queries/Query9.sql` |
| 10 | Productivity rate of the administrative staff in Toulouse | `Queries/Query10.sql` |
| 11 | Reports containing a given gas (gas name as a parameter) | `Queries/Query11.sql` |
| 12 | Regions with more sensors than agencies | `Queries/Query12.sql` |

For the parameterized query (`Queries/Query11.sql`), the gas name is set at the top of the
script:

```sql
SET @gaz_name := 'NH3';   -- replace with the desired gas
```

---

## Requirements

- **MySQL 8.0** (or MariaDB 10.5+). The code uses specific functions: `AUTO_INCREMENT`,
  `YEAR()`, `DATEDIFF()`, `CURDATE()`, user-defined variables `SET @var`.
- **git** to clone the repository.
- A command-line client (**MySQL Command Line Client**) or a GUI (**MySQL Workbench**).
- **UTF-8** encoding recommended (the data contains accents: "Île-de-France", "Nîmes"…).

---

## Setup / Running

The full path, from cloning the repository to running a query. The SQL scripts do not create the
database itself: create it first, then load the scripts **in order** (tables → data → privileges
→ queries).

### From the command line

```bash
# 1. Clone the repository and enter it
git clone https://github.com/Estebge/SQL.git
cd SQL

# 2. Create the database
mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS qualite_air CHARACTER SET utf8mb4;"

# 3. Create the tables (schema + constraints)
mysql -u root -p qualite_air < Database_setup/Creation_des_tables.sql

# 4. Load the test dataset
mysql -u root -p qualite_air < Database_setup/Peuplement_tables.sql

# 5. (Optional) Create the admin_air / user_air accounts and their privileges
mysql -u root -p qualite_air < Database_setup/Droits_utilisateurs.sql

# 6. Run a query (example: number 1)
mysql -u root -p qualite_air < Queries/Query1.sql
```

> `-u root -p`: connect as `root`, with `-p` prompting for the password interactively (change the
> user as needed). Steps 3 to 5 each load one file into the `qualite_air` database; every
> `Queries/QueryN.sql` is then run the same way, just changing the number.

### From MySQL Workbench

1. `CREATE DATABASE qualite_air;` then select the database.
2. Open and run `Database_setup/Creation_des_tables.sql`.
3. Open and run `Database_setup/Peuplement_tables.sql`.
4. (Optional) Open and run `Database_setup/Droits_utilisateurs.sql`.
5. Open a `Queries/QueryN.sql` file and run it.

### With Docker (no MySQL installation)

Handy to try the project without touching your own setup: the server runs in a container, and
everything is removed with a single command afterwards.

```bash
# 1. Clone the repository and enter it
git clone https://github.com/Estebge/SQL.git
cd SQL

# 2. Start a MySQL server (the qualite_air database is created automatically)
docker run --name qualite-air \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=qualite_air \
  -p 3306:3306 -d mysql:8.0

# 3. Wait for the server to be ready (a few seconds on first start)
docker logs -f qualite-air     # wait for "ready for connections", then Ctrl+C

# 4. Load the schema, the data, then the privileges
docker exec -i qualite-air mysql -uroot -proot qualite_air < Database_setup/Creation_des_tables.sql
docker exec -i qualite-air mysql -uroot -proot qualite_air < Database_setup/Peuplement_tables.sql
docker exec -i qualite-air mysql -uroot -proot qualite_air < Database_setup/Droits_utilisateurs.sql

# 5. Run a query (example: number 1)
docker exec -i qualite-air mysql -uroot -proot qualite_air < Queries/Query1.sql

# 6. Clean everything up when done
docker rm -f qualite-air
```

---

## Known limitations

The dataset is **fictional**, generated to serve as test data. A few imperfections remain: they
do not break any query and are left as they are.

- Some record values are not realistic for the gases involved (test data).
- A few city ↔ region assignments or agency contact details contain minor input inconsistencies.
- The account passwords in `Database_setup/Droits_utilisateurs.sql` are **demonstration**
  passwords — change them before any real use.
