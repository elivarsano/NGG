#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --tuples-only -c"

MAIN() {
  echo -e "Enter your username: "
  read USERNAME
  USERDB=$($PSQL "SELECT user_id, username, games_played, best_game FROM users WHERE username = '$USERNAME'")
  if [[ -z $USERDB ]];
  then
    echo -e "Welcome, $USERNAME! It looks like this is your first time here."
    RANDOM_NUMBER=$(( 1 + $RANDOM % 1000 ))
    echo -e "Guess the secret number between 1 and 1000: "
    GAME $RANDOM_NUMBER $USERNAME
  else
    echo $USERDB | while read USER_ID BAR USER_NAME BAR GAMES BAR BEST_GAME
    do
      echo "Welcome back, $USER_NAME! You have played $GAMES games, and your best game took $BEST_GAME guesses."
    done
    RANDOM_NUMBER=$(( 1 + $RANDOM % 1000 ))
    echo -e "Guess the secret number between 1 and 1000: "
    GAME $RANDOM_NUMBER $USERNAME
  fi
}


NUMBER_OF_GUESSES=0
GAME() {
  read GUESS
  VALID="^[0-9]+$"
  if [[ ! $GUESS =~ $VALID ]];
  then
    echo -e "That is not an integer, guess again: "
    GAME $RANDOM_NUMBER
  else
    ((NUMBER_OF_GUESSES=$NUMBER_OF_GUESSES+1))
    if [[ "$GUESS" < $RANDOM_NUMBER ]];
    then
      echo -e "It's higher than that, guess again: "
      GAME $RANDOM_NUMBER
    elif [[ "$GUESS" > $RANDOM_NUMBER ]];
    then
      echo -e "It's lower than that, guess again: "
      GAME $RANDOM_NUMBER
    else      
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
      INSERT_DATA $USERNAME $NUMBER_OF_GUESSES
    fi
  fi
}

INSERT_DATA() {
  USERDB=$($PSQL "SELECT user_id, games_played, best_game, username FROM users")
  echo $USERDB | while read USER_ID BAR GAMES BAR BEST_GAME BAR USER_NAME
  do
    USEREXISTS=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME'")
    if [[ -z $USEREXISTS ]];
    then
      INSERT_NEW=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 1, $NUMBER_OF_GUESSES)")
    elif [[ $BEST_GAME > $NUMBER_OF_GUESSES ]];
    then
      INSERT_GAME=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE username = '$USERNAME'")
    else
      INSERT_NEW_RECORD=$($PSQL "UPDATE users SET (games_played, best_game) = (games_played + 1, $NUMBER_OF_GUESSES) WHERE username = '$USERNAME'")
    fi
  done
}

MAIN
