---1. View the first 100 rows of the dataset to understand its structure.

SELECT top 100* FROM [dbo].[ketro_sa_soccer_dataset_advanced]

---2. Count the total number of players in the dataset.

SELECT count(*) as total_players
 FROM  [dbo].[ketro_sa_soccer_dataset_advanced]

---3. List all unique teams in the league

SELECT DISTINCT Team FROM [dbo].[ketro_sa_soccer_dataset_advanced]

---4.Count how many players are in each team.

SELECT COUNT(*) as player_namer
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY team;

---5.identify the top 10 players are each team.

SELECT	top 10 player_name,goals
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
ORDER BY goals DESC;

---6.Find the average salary for players in each team

SELECT team,
       AVG(CAST('salary' AS DECIMAL(10,2))) AS average_salary
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
WHERE ISNUMERIC('salary') = 1
GROUP BY team;

---7.Retrieve the top 10 players with the highest market value.

SELECT top 10 player_name,market_value_zar
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
ORDER BY market_value_zar DESC;

---8. Calculate the average passing accuracy for each position.

SELECT position,
       AVG(CAST(passing_accuracy AS DECIMAL(5,2))) AS average_passing_accuracy
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY position;

---9. Compare shot accuracy with goals to find correlations.

SELECT player_name,
       AVG(CAST(shot_accuracy AS DECIMAL(5,2))) AS avg_shot_accuracy,
       SUM(goals) AS total_goals
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY player_name;

---10. Compute total goals and assists for each team.

SELECT team,
SUM(goals) AS total_goals,
SUM(assists) AS total_assists
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY team;

---11. Count players by their marital status.

SELECT marital_status,
COUNT(*) as total_players
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY marital_status;

---12. Count players by nationality.

SELECT nationality,
COUNT(*) AS total_players 
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY nationality;

---13. Find average market value grouped by nationality.

SELECT nationality,
AVG(market_value_zar) AS average_market_value
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY nationality;

---14. Determine how many player contracts end in each year.

SELECT contract_end_year,
       COUNT(*) AS total_players
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY contract_end_year
ORDER BY contract_end_year;

---15. Identify players whose contracts end next year.

SELECT player_name,
       contract_end_year
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
WHERE contract_end_year = 2026
ORDER BY contract_end_year;

---16. Summarize the number of players by injury status.

SELECT 
COUNT(*) AS number_players
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY injury_status;

---17.Calculate goals per match ratio for each player.

SELECT
    player_name,
    team,
    goals,
    matches_played,
    ROUND(goals * 1.0 / NULLIF(matches_played, 0), 2) AS goals_per_match
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
ORDER BY goals_per_match DESC;

---18. Count how many players are managed by each agent.
SELECT agent,
 COUNT(*) AS total_players
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY agent;

---19. Calculate average height and weight by player position.

SELECT position,
AVG(height_cm) AS total_height,
AVG(weight_kg) AS total_weight
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY position;

---20. Identify players with the highest combined goals and assists.

SELECT
    player_name,
    SUM(goals) + SUM(assists) AS total_combined
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY player_name
ORDER BY total_combined DESC;
