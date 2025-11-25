⚽ Soccer Dataset Advanced SQL Analysis
📌 Overview
This project demonstrates advanced SQL queries for analyzing a soccer dataset stored in:

Code
[dbo].[ketro_sa_soccer_dataset_advanced]
The queries cover:

Dataset exploration

Player and team statistics

Performance metrics (goals, assists, accuracy)

Financial insights (salary, market value)

Contract and injury analysis

🛠️ Requirements
SQL-compatible database (SQL Server, PostgreSQL, MySQL, Snowflake, etc.)

Dataset: ketro_sa_soccer_dataset_advanced

Example columns:

player_name

team

goals

assists

salary

market_value_zar

passing_accuracy

shot_accuracy

matches_played

height_cm, weight_kg

nationality

marital_status

contract_end_year

injury_status

agent

📂 Queries
1. 🔎 View First 100 Rows
sql
SELECT TOP 100 * 
FROM [dbo].[ketro_sa_soccer_dataset_advanced];
Explore dataset structure.

2. 👥 Count Total Players
sql
SELECT COUNT(*) AS total_players
FROM [dbo].[ketro_sa_soccer_dataset_advanced];
3. 🏟️ Unique Teams
sql
SELECT DISTINCT team
FROM [dbo].[ketro_sa_soccer_dataset_advanced];
4. 👥 Players per Team
sql
SELECT COUNT(*) AS player_count
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY team;
5. 🏆 Top 10 Goal Scorers
sql
SELECT TOP 10 player_name, goals
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
ORDER BY goals DESC;
6. 💵 Average Salary per Team
sql
SELECT team,
       AVG(CAST(salary AS DECIMAL(10,2))) AS average_salary
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
WHERE ISNUMERIC(salary) = 1
GROUP BY team;
7. 💰 Top 10 Market Value Players
sql
SELECT TOP 10 player_name, market_value_zar
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
ORDER BY market_value_zar DESC;
8. 🎯 Passing Accuracy per Position
sql
SELECT position,
       AVG(CAST(passing_accuracy AS DECIMAL(5,2))) AS average_passing_accuracy
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY position;
9. 🎯 Shot Accuracy vs Goals
sql
SELECT player_name,
       AVG(CAST(shot_accuracy AS DECIMAL(5,2))) AS avg_shot_accuracy,
       SUM(goals) AS total_goals
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY player_name;
10. ⚽ Team Goals & Assists
sql
SELECT team,
       SUM(goals) AS total_goals,
       SUM(assists) AS total_assists
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY team;
11. 💍 Players by Marital Status
sql
SELECT marital_status, COUNT(*) AS total_players
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY marital_status;
12. 🌍 Players by Nationality
sql
SELECT nationality, COUNT(*) AS total_players
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY nationality;
13. 💰 Average Market Value by Nationality
sql
SELECT nationality,
       AVG(market_value_zar) AS average_market_value
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY nationality;
14. 📅 Contracts Ending per Year
sql
SELECT contract_end_year, COUNT(*) AS total_players
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY contract_end_year
ORDER BY contract_end_year;
15. 📅 Contracts Ending Next Year
sql
SELECT player_name, contract_end_year
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
WHERE contract_end_year = 2026
ORDER BY contract_end_year;
16. 🩺 Players by Injury Status
sql
SELECT injury_status, COUNT(*) AS number_players
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY injury_status;
17. ⚽ Goals per Match Ratio
sql
SELECT player_name, team, goals, matches_played,
       ROUND(goals * 1.0 / NULLIF(matches_played, 0), 2) AS goals_per_match
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
ORDER BY goals_per_match DESC;
18. 👔 Players per Agent
sql
SELECT agent, COUNT(*) AS total_players
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY agent;
19. 📏 Average Height & Weight per Position
sql
SELECT position,
       AVG(height_cm) AS avg_height,
       AVG(weight_kg) AS avg_weight
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY position;
20. ⚽ Players with Highest Combined Goals + Assists
sql
SELECT player_name,
       SUM(goals) + SUM(assists) AS total_combined
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY player_name
ORDER BY total_combined DESC
