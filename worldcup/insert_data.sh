#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
#  games, teams;
$($PSQL "truncate table games, teams cascade;")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do  
  if [[ $WINNER != winner ]]
  then      
    WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER';")
    if [[ -z $WINNER_ID ]]
    then
      INSERT_TEAMS_RESULT=$($PSQL "insert into teams(name) values('$WINNER');")
      if [[ $INSERT_TEAMS_RESULT == 'INSERT 0 1' ]] 
      then
        echo Inserted into team, $WINNER
      fi
    fi
  fi
  if [[ $OPPONENT != opponent ]]
  then      
    OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT';")
    if [[ -z $OPPONENT_ID ]]
    then
      INSERT_TEAMS_RESULT=$($PSQL "insert into teams(name) values('$OPPONENT');")
      if [[ $INSERT_TEAMS_RESULT == 'INSERT 0 1' ]] 
      then
        echo Inserted into team, $OPPONENT
      fi
    fi
  fi
  WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER';")
  OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT';")
  INSERT_GAMES_RESULT=$($PSQL "insert into games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) values($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
  if [[ $INSERT_GAMES_RESULT == "INSERT 0 1" ]] 
    then
      echo "Inserted game: $YEAR - $ROUND: $WINNER vs $OPPONENT"
  fi
done
