import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isTurnO = true;
  List<String> xOrOList = ['', '', '', '', '', '', '', '', ''];
  int filledBoxed = 0;
  bool gameHasResult = false;
  int scoreX = 0;
  int scoreO = 0;
  String winnerTitle = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[900],
        title: Text('TicTocToe'),
        actions: [
          IconButton(
            onPressed: () {
              clearGame();
            },
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: [
            getScoreBoard(),
            SizedBox(
              height: 50,
            ),
            getResultButton(),
            SizedBox(
              height: 20,
            ),
            getGridviwe(),
            getTurn(),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Widget getResultButton() {
    return Visibility(
      visible: gameHasResult,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          side: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
        onPressed: () {
          gameHasResult = false;
          clearGame();
        },
        child: Text(
          winnerTitle + ',play again!',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget getTurn() {
    return Text(
      isTurnO ? 'Turn O' : 'Turn X',
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget getGridviwe() {
    return Expanded(
      child: GridView.builder(
        itemCount: 9,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              tap(index);
              setState(
                () {
                  if (xOrOList[index] != '') {
                    return;
                  }
                  if (gameHasResult) {
                    return;
                  }
                  if (isTurnO) {
                    xOrOList[index] = 'O';
                    filledBoxed = filledBoxed + 1;
                  } else {
                    xOrOList[index] = 'X';
                    filledBoxed = filledBoxed + 1;
                  }
                  isTurnO = !isTurnO;
                  checkWinner();
                },
              );
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
              ),
              child: Center(
                child: Text(
                  xOrOList[index],
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: xOrOList[index] == 'O' ? Colors.white : Colors.red,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void checkWinner() {
    if (xOrOList[0] == xOrOList[1] &&
        xOrOList[0] == xOrOList[2] &&
        xOrOList[0] != '') {
      setResult(xOrOList[0], 'the winner is ' + xOrOList[0]);
      //clearGame();
      return;
    }
    if (xOrOList[3] == xOrOList[4] &&
        xOrOList[3] == xOrOList[5] &&
        xOrOList[3] != '') {
      setResult(xOrOList[3], 'the winner is ' + xOrOList[3]);
      //clearGame();
      return;
    }
    if (xOrOList[6] == xOrOList[7] &&
        xOrOList[6] == xOrOList[8] &&
        xOrOList[6] != '') {
      setResult(xOrOList[6], 'the winner is ' + xOrOList[6]);
      //clearGame();
      return;
    }
    if (xOrOList[0] == xOrOList[3] &&
        xOrOList[0] == xOrOList[6] &&
        xOrOList[0] != '') {
      setResult(xOrOList[0], 'the winner is ' + xOrOList[0]);
      //clearGame();
      return;
    }
    if (xOrOList[1] == xOrOList[4] &&
        xOrOList[1] == xOrOList[7] &&
        xOrOList[1] != '') {
      setResult(xOrOList[1], 'the winner is ' + xOrOList[1]);
      //clearGame();
      return;
    }
    if (xOrOList[2] == xOrOList[5] &&
        xOrOList[6] == xOrOList[8] &&
        xOrOList[2] != '') {
      setResult(xOrOList[2], 'the winner is ' + xOrOList[2]);
      //clearGame();
      return;
    }
    if (xOrOList[0] == xOrOList[4] &&
        xOrOList[0] == xOrOList[8] &&
        xOrOList[0] != '') {
      setResult(xOrOList[0], 'the winner is ' + xOrOList[0]);
      //clearGame();
      return;
    }
    if (xOrOList[2] == xOrOList[4] &&
        xOrOList[2] == xOrOList[6] &&
        xOrOList[2] != '') {
      setResult(xOrOList[2], 'the winner is ' + xOrOList[2]);
      //clearGame();
      return;
    }
    if (filledBoxed == 9) {
      //print('draw');
      setResult('', 'Draw');
      //clearGame();
      return;
    }
  }

  void tap(int index) {
    print(index);
  }

  Widget getScoreBoard() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                'Player O',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              Text(
                '$scoreO',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                'Player X',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              Text(
                '$scoreX',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  void setResult(String winner, String title) {
    setState(
      () {
        gameHasResult = true;
        if (winner == 'X') {
          scoreX = scoreX + 1;
          winnerTitle = 'winner is ' + winner;
        } else if (winner == 'O') {
          scoreO = scoreO + 1;
          winnerTitle = 'winner is ' + winner;
        } else {
          scoreX = scoreX + 1;
          scoreO = scoreO + 1;
          winnerTitle = 'draw';
        }
      },
    );
  }

  void clearGame() {
    setState(
      () {
        for (var i = 0; i < xOrOList.length; i++) {
          xOrOList[i] = '';
        }
      },
    );
    filledBoxed = 0;
  }
}
