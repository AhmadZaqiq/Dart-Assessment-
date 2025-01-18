//Ahmad JR
import 'dart:io';

enum Player { player1, player2 }

enum Winner { player1, player2, darw, inProgress }

Player playerTurn = Player.player1;
int playCount = 0;
Winner winner = Winner.inProgress;
bool gameOver = false;

int readNumber(String message, String errorMessage, int from, int to) {
  print(message);

  int number = int.parse(stdin.readLineSync()!);

  while (number < from || number > to) {
    print(errorMessage);
    number = int.parse(stdin.readLineSync()!);
  }
  return number;
} //This is a function to read a number between 1 and 9.

List<List<dynamic>> resetGameBorad() {
  return [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
}

void displayGameBoard(List<List<dynamic>> gameBoard) {
  for (int i = 0; i < gameBoard.length; i++) {
    print(gameBoard[i].join(' | '));

    if (i < gameBoard.length - 1) {
      print('_________');
    }
  }
}

dynamic getElementFromLinearIndex(
    int playerChoice, List<List<dynamic>> gameBoard) {
  int numColumns = gameBoard[0].length;
  int i = playerChoice ~/ numColumns; // Calculate the row index.
  int j = playerChoice % numColumns; // Calculate the column index.

  return gameBoard[i][j]; // Return the corresponding element.
}

void updateGameBoard(
    int playerChoice, List<List<dynamic>> gameBoard, String symbol) {
  int numColumns = gameBoard[0].length;
  int i = playerChoice ~/ numColumns; // Calculate the row index.
  int j = playerChoice % numColumns; // Calculate the column index.

  gameBoard[i][j] = symbol; // Uddate the corresponding element.
}

bool checkValues(dynamic first, dynamic second, dynamic third) {
  if ((first == second) && (second == third) && first is String) {
    // Verifies that all three values are equal and of type String.
    if (first == 'X') {
      winner = Winner.player1;
      gameOver = true;
      return true;
    } else {
      winner = Winner.player2;
      gameOver = true;
      return true;
    }
  }

  // If the values do not meet the conditions, the game is not over.
  gameOver = false;
  return false;
} // Check if three values are equal

void checkWinner(List<List<dynamic>> gameBoard) {
  // Checks all possible win conditions on the game board and sets the winner or draw status.
  if (checkValues(
      getElementFromLinearIndex(0, gameBoard),
      getElementFromLinearIndex(1, gameBoard),
      getElementFromLinearIndex(2, gameBoard))) {
    return;
  }

  if (checkValues(
      getElementFromLinearIndex(3, gameBoard),
      getElementFromLinearIndex(4, gameBoard),
      getElementFromLinearIndex(5, gameBoard))) {
    return;
  }

  if (checkValues(
      getElementFromLinearIndex(6, gameBoard),
      getElementFromLinearIndex(7, gameBoard),
      getElementFromLinearIndex(8, gameBoard))) {
    return;
  }

  if (checkValues(
      getElementFromLinearIndex(0, gameBoard),
      getElementFromLinearIndex(3, gameBoard),
      getElementFromLinearIndex(6, gameBoard))) {
    return;
  }

  if (checkValues(
      getElementFromLinearIndex(1, gameBoard),
      getElementFromLinearIndex(4, gameBoard),
      getElementFromLinearIndex(7, gameBoard))) {
    return;
  }

  if (checkValues(
      getElementFromLinearIndex(2, gameBoard),
      getElementFromLinearIndex(5, gameBoard),
      getElementFromLinearIndex(8, gameBoard))) {
    return;
  }

  if (checkValues(
      getElementFromLinearIndex(0, gameBoard),
      getElementFromLinearIndex(4, gameBoard),
      getElementFromLinearIndex(8, gameBoard))) {
    return;
  }

  if (checkValues(
      getElementFromLinearIndex(2, gameBoard),
      getElementFromLinearIndex(4, gameBoard),
      getElementFromLinearIndex(6, gameBoard))) {
    return;
  }

  if (playCount == 9) {
    winner = Winner.darw; //No Winner
    gameOver = true;
  }
}

void displayStatus() {
  if (gameOver) {
    print('Player Turn: ');
  } else {
    print(
        'Player Turn: ${playerTurn == Player.player1 ? 'Player 1' : 'Player 2'}');
  }

  print(
      'Winner: ${winner == Winner.player1 ? 'Player 1' : winner == Winner.player2 ? 'Player 2' : winner == Winner.darw ? 'Draw' : 'In Progress'}');
}

bool endGame() {
  return gameOver;
}

void play() {
  List<List<dynamic>> gameBoard = resetGameBorad();

  displayGameBoard(gameBoard);
  displayStatus();

  int choice = 0;

  while (playCount != 9) {
    //  loop continues until all cells filled.
    choice = readNumber('Choose Number between [1] to [9]',
        'Invalid Choice... Try again between [1] to [9]', 1, 9);

    choice--; // Coz Arrays index From [0-8].

    //X for player1
    //O for player2

    if (getElementFromLinearIndex(choice, gameBoard) is int) {
      switch (playerTurn) {
        case Player.player1:
          updateGameBoard(choice, gameBoard, 'X');
          playCount++;
          checkWinner(gameBoard);
          break;

        case Player.player2:
          updateGameBoard(choice, gameBoard, 'O');
          playCount++;
          checkWinner(gameBoard);
          break;
      }

      playerTurn =
          (playerTurn == Player.player1) ? Player.player2 : Player.player1;
    } else {
      print('The cell is already taken. Try again.');
    }

    displayGameBoard(gameBoard);
    displayStatus();

    if (endGame()) {
      break;
    }
  }
}

void reset() {
  playerTurn = Player.player1;
  winner = Winner.inProgress;
  gameOver = false;
  playCount = 0;
}

void startGame() {
  String playAgain = 'Y';

  do {
    reset();
    play();

    print('Do you want to play again? (Y/N)');
    playAgain = stdin.readLineSync()?.toUpperCase() ?? 'N';
  } while (playAgain == 'Y');

  print('Thank you for playing our game!');
}

void main(List<String> arguments) {
  startGame();
}
