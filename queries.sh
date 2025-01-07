#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM(winner_goals + opponent_goals) from games")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "select AVG(winner_goals) from games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "select ROUND(AVG(winner_goals),2) from games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "select AVG(winner_goals + opponent_goals) from games")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "select MAX(winner_goals) from games")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "select COUNT(game_id) from games where winner_goals>2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "SELECT t.name FROM games g
               INNER JOIN teams t ON g.winner_id=t.team_id
               WHERE g.year=2018 AND g.round='Final'")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "SELECT t.name FROM games g
               INNER JOIN teams t ON g.winner_id=t.team_id OR g.opponent_id=t.team_id
               WHERE g.round='Eighth-Final' and g.year=2014
               ORDER BY t.name")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "SELECT t.name FROM games g
               INNER JOIN teams t ON g.winner_id=t.team_id
               GROUP BY t.name
               ORDER BY t.name")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "SELECT g.year, t.name FROM games g
               INNER JOIN teams t ON g.winner_id=t.team_id
               WHERE g.round='Final'
               GROUP BY t.name, g.year
               ORDER BY t.name DESC")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "SELECT t.name FROM teams t
               WHERE t.name LIKE 'Co%'")"

