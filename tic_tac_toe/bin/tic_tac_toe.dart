import 'dart:io';
import 'dart:math';

enum Player { player1, computer }

enum Winner { player1, computer, darw, inProgress }

Player playerTurn = Player.player1;
int playCount = 0;
Winner winner = Winner.inProgress;
bool gameOver = false;
String player1Coice = '';
String player2Coice = '';
bool isPlayingAgainstAI = false; //To Decide who will play

int readNumber(String message, String errorMessage, int from, int to) {
  print(message);

  int number = int.parse(stdin.readLineSync()!);

  while (number < from || number > to) {
    print(errorMessage);
    number = int.parse(stdin.readLineSync()!);
  }
  return number;
} // This is a function to read a number between 1 and 9.

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
} //takes a number from 0 to 8,
// converts it to a 2D list,
// and returns the corresponding element.
// For example, if the number is 4, it will return the value at position [1][1]

void updateGameBoard(
    int playerChoice, List<List<dynamic>> gameBoard, String symbol) {
  int numColumns = gameBoard[0].length;
  int i = playerChoice ~/ numColumns; // Calculate the row index.
  int j = playerChoice % numColumns; // Calculate the column index.

  gameBoard[i][j] = symbol; // Update the corresponding element.
} //Update the required value, Same idea as the function above

bool checkValues(dynamic first, dynamic second, dynamic third) {
  if ((first == second) && (second == third) && first is String) {
    // Verifies that all three values are equal and of type String.
    if (first == 'X') {
      winner = Winner.player1;
      gameOver = true;
      return true;
    } else {
      winner = Winner.computer;
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
    winner = Winner.darw; // No Winner
    gameOver = true;
  }
}

void displayStatus() {
  if (gameOver) {
    print('Player Turn: ');
  } else {
    print(
        'Player Turn: ${playerTurn == Player.player1 ? 'Player 1' : 'Computer'}');
  }

  print(
      'Winner: ${winner == Winner.player1 ? 'Player 1' : winner == Winner.computer ? 'Computer' : winner == Winner.darw ? 'Draw' : 'In Progress'}');
}

bool endGame() {
  return gameOver;
}

String readStringXO(String message, String errorMessage) {
  print(message);

  String? input = stdin.readLineSync();

  while (input == null ||
      (input.toUpperCase() != 'X' && input.toUpperCase() != 'O')) {
    print(errorMessage);
    input = stdin.readLineSync();
  }

  return input.toUpperCase(); // Return the input converted to uppercase
}

void chooseMark() {
  player1Coice = readStringXO(
      'Choose [X] or [O] for Player 1 ', 'Invalid Choice... Try again');

  player2Coice = (player1Coice == 'X') ? 'O' : 'X';
}

int aiMove(List<List<dynamic>> gameBoard) {
  Random random = Random();

  while (true) {
    int choice = random.nextInt(9); //random number

    if (getElementFromLinearIndex(choice, gameBoard) is int) {
      return choice;
    }
  }
}

void displayMainMenu() {
  print('Choose Game Mode:');
  print('[1] Player vs Player');
  print('[2] Player vs AI');
}

void chooseGameMode() {
  displayMainMenu();

  int choice =
      readNumber('Enter your choice: ', 'Invalid choice. Try again.', 1, 2);

  isPlayingAgainstAI = (choice == 2);
}

void play() {
  List<List<dynamic>> gameBoard = resetGameBorad();

  chooseGameMode();
  chooseMark();
  displayGameBoard(gameBoard);
  displayStatus();

  int choice = 0;

  while (playCount != 9) {
    if (playerTurn == Player.player1 || !isPlayingAgainstAI) {
      // Player turn (or Player vs Player mode)
      choice = readNumber('Choose Number between [1] to [9]',
          'Invalid Choice... Try again between [1] to [9]', 1, 9);
      choice--; // Adjust index to match array indexing.

      if (getElementFromLinearIndex(choice, gameBoard) is int) {
        updateGameBoard(choice, gameBoard,
            playerTurn == Player.player1 ? player1Coice : player2Coice);
        playCount++;
        checkWinner(gameBoard);
        playerTurn =
            (playerTurn == Player.player1) ? Player.computer : Player.player1;
      } else {
        print('The cell is already taken, Try again...');
      }
    } else {
      choice = aiMove(gameBoard);
      updateGameBoard(choice, gameBoard, player2Coice);
      playCount++;
      checkWinner(gameBoard);
      playerTurn = Player.player1;
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
