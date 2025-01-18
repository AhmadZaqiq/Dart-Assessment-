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
