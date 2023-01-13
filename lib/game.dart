// ignore_for_file: constant_identifier_names

import 'dart:math';

class Game {
  static const int min = 0;
  static const int max = 10;
  static const int totalMoves = 3;

  late int _currentMove;

  late int _guessedNumber;

  Game() {
    _currentMove = 0;
    _guessedNumber = Random().nextInt(max);
  }

  Result nextMove(int userInput) {
    //check whether user input is valid or not
    if (userInput < min || userInput > max) {
      return Result.Input_in_range;
    }
    //increament the current move and check if there is no move left
    _currentMove += 1;
    if (_currentMove > totalMoves) {
      return Result.Out_of_chances;
    }
    //compare the user input with the guessed number and hint if not matched

    //   if (userInput == _guessedNumber) {
    //      return Result.Correct;
    //   }  else {
    //      if (userInput > _guessedNumber) {
    //        return Result.Higher_than_expected;
    //   }
    // }

    int difference = userInput - _guessedNumber;
    if (difference == 0) {
      return Result.Correct;
    } else {
      return difference < 0
          ? Result.Lower_the_value
          : Result.Higher_than_expected;
    }
  }
}

enum Result {
  Correct,
  Higher_than_expected,
  Lower_the_value,
  Input_in_range,
  Out_of_chances
}
