# Tic-Tac-Toe Console Game-
This Project simulates a Tic-Tac-Toe game where two players can play against each other or against The AI. The game keeps track of the board state, validates moves, checks for winners, and provides the option for players to play again after each game

## Project Functionality

### 1. **Enums**:
   - **`Player`**: Defines the current player (either Player 1 or Computer).
   - **`Winner`**: Defines the result of the game (whether Player 1, Computer, Draw, or In Progress).

### 2. **Variables**:
   - **`playerTurn`**: Keeps track of whose turn it is.
   - **`playCount`**: A counter for the number of moves made.
   - **`winner`**: Holds the winner or if the game is still in progress or a draw.
   - **`gameOver`**: Indicates whether the game has ended or not.
   - **`player1Choice` and `player2Choice`**: Store the choices (X or O).
   - **`isPlayingAgainstAI`**: Indicates if the game is Player vs Computer or Player vs Player.

### 3. **Functions**:
   - **`readNumber`**: Reads a number input by the user between a given range.
   - **`resetGameBoard`**: Resets the game board to its initial state (a 3x3 grid with numbers 1 to 9).
   - **`displayGameBoard`**: Displays the current state of the game board.
   - **`getElementFromLinearIndex`**: Converts a linear index (0-8) to its corresponding row and column on the game board exp: 4 to [1][1].
   - **`updateGameBoard`**: Updates a specific cell on the game board with a given symbol (X or O).
   - **`checkValues`**: Checks if three values on the board are equal (for winning conditions).
   - **`checkWinner`**: Checks all possible winning conditions and updates the winner or declares a draw.
   - **`displayStatus`**: Displays the current status of the game (whose turn it is, and the result).
   - **`endGame`**: Returns true if the game is over.
   - **`readStringXO`**: Reads a player's choice between X and O.
   - **`chooseMark`**: Allows Player 1 to choose between X or O, and assigns the opposite to Player 2.
   - **`aiMove`**: Generates a random move for the computer.
   - **`displayMainMenu`**: Displays the menu to choose the game mode.
   - **`chooseGameMode`**: Allows the user to select the game mode.
   - **`play`**: The main game loop where players take turns making moves, and the game checks for a winner or draw after each move.
   - **`reset`**: Resets the game state for a new round.
   - **`startGame`**: Starts the game and gives the user the option to play again after each round.

### 4. **Game Logic**:
   - The game begins by showing a menu to choose the game mode: Player vs Player or Player vs Computer.
   - Then, the players choose their marks (X or O). Player 1 chooses, and Player 2 gets the opposite mark.
   - In each round, the current player selects between (1 to 9), and the game updates the board. After each move, the game checks if there is a winner or if it's a draw.
   - If the current player is playing against the computer, the computer will randomly select to place its mark.
   - The game continues until there is a winner or a draw (all cells are filled).
   - After the game ends, the result is displayed, and the user is asked if they want to play again.

## Steps to Run the Game

### 1. **Install Dart SDK**:
   - First, ensure you have Dart SDK installed on your system. You can download it from the [official Dart website](https://dart.dev/get-dart).
   - You can follow this [video tutorial](https://www.youtube.com/watch?v=mODiT55xF9I) for installation steps.

### 2. **Download the Project**:
   - Download or clone the repository from GitHub: `Dart-Assessment-`.

### 3. **Set Up Visual Studio Code**:
   - It's recommended to use Visual Studio Code (VSCode) for editing the Dart code.
   - Install the Dart extension for VSCode, which provides support for Dart development.

### 4. **Open the Project in VSCode**:
   - Open Visual Studio Code and navigate to the folder where you downloaded the project.
   - You can do this by selecting `File > Open Folder` in VSCode and opening the project's directory.

### 5. **Use the Terminal in VSCode**:
   - Inside VSCode, open the terminal by going to `View > Terminal`.
   - Ensure that Dart is correctly installed by typing `dart --version` in the terminal to verify the installation.

### 6. **Run the Game**:
   - In the VSCode terminal, run the game by typing the following command:
     ```
     dart run
     ```
   - This command will start the game in the terminal, and you will be able to play either Player vs Player or Player vs AI.

### 7. **Playing the Game**:
   - Follow the on-screen prompts to choose your game mode, pick your marks (X or O), and make your moves.
   - The game will automatically check for a winner or a draw after each turn and display the updated board and status.

### 8. **Play Again**:
   - After the game ends, you'll be asked if you'd like to play again. Type `Y` for yes or `N` to exit the game.

By following these steps, you'll be able to run the Tic-Tac-Toe game on your local machine and play with either a friend or the AI.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
