// game_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'room_screen.dart';

class GameScreen extends StatefulWidget {
  final String roomName;

  GameScreen({required this.roomName});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late List<List<String>> board;
  late bool isPlayerX;
  late bool gameEnded;
  late bool isMyTurn; // Флаг, указывающий на то, чей сейчас ход

  @override
  void initState() {
    super.initState();
    initializeBoard();
  }

  void initializeBoard() {
    board = List.generate(3, (_) => List<String>.filled(3, ''));
    isPlayerX = true; // Создатель комнаты (X) ходит первым
    gameEnded = false;
    isMyTurn = true; // Игрок, создавший комнату, ходит первым
  }

  void makeMove(int row, int col) {
    if (isMyTurn && board[row][col].isEmpty && !gameEnded) {
      setState(() {
        board[row][col] = isPlayerX ? 'X' : 'O';
        isMyTurn = false; // После хода меняем флаг
        checkGameStatus(row, col);
      });
      printBoard(); // Добавим вывод для отладки
    }
  }

  void printBoard() {
    for (int i = 0; i < 3; i++) {
      print(board[i]);
    }
    print('------');
  }

  void checkGameStatus(int row, int col) {
    if (checkWinner(row, col)) {
      showEndGameDialog('Player ${isPlayerX ? 'O' : 'X'} wins!');
    } else if (isBoardFull()) {
      showEndGameDialog('It\'s a tie!');
    }
  }

  bool checkWinner(int row, int col) {
    // Проверка по горизонтали
    if (board[row][0] == board[row][1] && board[row][1] == board[row][2] && board[row][0].isNotEmpty) {
      return true;
    }

    // Проверка по вертикали
    if (board[0][col] == board[1][col] && board[1][col] == board[2][col] && board[0][col].isNotEmpty) {
      return true;
    }

    // Проверка по диагонали (главная)
    if (row == col && board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0].isNotEmpty) {
      return true;
    }

    // Проверка по диагонали (побочная)
    if (row + col == 2 && board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[0][2].isNotEmpty) {
      return true;
    }

    return false;
  }

  bool isBoardFull() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j].isEmpty) {
          return false;
        }
      }
    }
    return true;
  }

  void showEndGameDialog(String message) {
    setState(() {
      gameEnded = true;
    });

    Get.dialog(
      AlertDialog(
        title: Text('Game Over'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              // Переход в комнату после окончания игры
              Get.off(() => RoomScreen());
            },
            child: Text('Back to Room List'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tic Tac Toe - ${widget.roomName}')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Tic Tac Toe Board'),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                ),
                shrinkWrap: true,
                itemCount: 9,
                itemBuilder: (context, index) {
                  int row = index ~/ 3;
                  int col = index % 3;
                  return GestureDetector(
                    onTap: () {
                      makeMove(row, col);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        board[row][col],
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (!gameEnded) {
                  showEndGameDialog('Player ${isPlayerX ? 'O' : 'X'} forfeits!');
                }
              },
              child: Text('Forfeit Game'),
            ),
          ],
        ),
      ),
    );
  }
}
