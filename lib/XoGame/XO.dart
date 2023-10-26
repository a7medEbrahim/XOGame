import 'package:flutter/material.dart';

import '../playersModel.dart';
import 'BtnXO.dart';

class XOGame extends StatefulWidget {
  static const String routeName = 'XOGame';

  const XOGame({super.key});

  @override
  State<XOGame> createState() => _XOGameState();
}

class _XOGameState extends State<XOGame> {
  int score1 = 0;

  int score2 = 0;

  List<String> board = ["", "", "", "", "", "", "", "", ""];

  @override
  Widget build(BuildContext context) {
    PlayerModel args =
        ModalRoute.of(context)?.settings.arguments as PlayerModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('XO Game'),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(bottom: 30, right: 10, left: 10, top: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      args.name1 + "(X)",
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "$score1",
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          color: Colors.blue),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(args.name2 + "(O)",
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "$score2",
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Colors.blue,
              thickness: 3,
              endIndent: 80,
              indent: 80,
              height: 100,
            ),
            Expanded(
              child: Row(
                children: [
                  BtnXO(
                    item: board[0],
                    index: 0,
                    playerModel: args,
                    onBtnClick: onBtnClic,
                  ),
                  BtnXO(
                    item: board[1],
                    index: 1,
                    playerModel: args,
                    onBtnClick: onBtnClic,
                  ),
                  BtnXO(
                    item: board[2],
                    index: 2,
                    playerModel: args,
                    onBtnClick: onBtnClic,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  BtnXO(
                    item: board[3],
                    index: 3,
                    playerModel: args,
                    onBtnClick: onBtnClic,
                  ),
                  BtnXO(
                    item: board[4],
                    index: 4,
                    playerModel: args,
                    onBtnClick: onBtnClic,
                  ),
                  BtnXO(
                    item: board[5],
                    index: 5,
                    playerModel: args,
                    onBtnClick: onBtnClic,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  BtnXO(
                    item: board[6],
                    index: 6,
                    playerModel: args,
                    onBtnClick: onBtnClic,
                  ),
                  BtnXO(
                    item: board[7],
                    index: 7,
                    playerModel: args,
                    onBtnClick: onBtnClic,
                  ),
                  BtnXO(
                    item: board[8],
                    index: 8,
                    playerModel: args,
                    onBtnClick: onBtnClic,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int counter = 1;

  onBtnClic(index, PlayerModel args) {
    if (board[index].isNotEmpty) return;
    if (counter.isOdd) {
      board[index] = "X";
      bool win = checkWinner('X');
      if (win) {
        score1 += 1;
        board = ["", "", "", "", "", "", "", "", ""];
        counter = 0;
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: Colors.blue,
              child: playerWin(args.name1),
            );
          },
        );
      }
    } else {
      board[index] = "O";
      bool win = checkWinner('O');
      if (win) {
        score2 += 1;
        board = ["", "", "", "", "", "", "", "", ""];
        counter = 0;
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: Colors.blue,
              child: playerWin(args.name2),
            );
          },
        );
      }
    }
    if (counter == 9) {
      board = ["", "", "", "", "", "", "", "", ""];
      counter = 0;
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.blue,
            child: noPlayerWin(),
          );
        },
      );
      setState(() {});
    }
    counter++;
    setState(() {});
  }

  bool checkWinner(String symbol) {
    if ((board[0] == symbol && board[1] == symbol && board[2] == symbol) ||
        (board[3] == symbol && board[4] == symbol && board[5] == symbol) ||
        (board[6] == symbol && board[7] == symbol && board[8] == symbol) ||
        (board[0] == symbol && board[3] == symbol && board[6] == symbol) ||
        (board[1] == symbol && board[4] == symbol && board[7] == symbol) ||
        (board[2] == symbol && board[5] == symbol && board[8] == symbol) ||
        (board[0] == symbol && board[4] == symbol && board[8] == symbol) ||
        (board[2] == symbol && board[4] == symbol && board[6] == symbol)) {
      return true;
    }
    return false;
  }

  Widget playerWin(value) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value + " Win",
            style: const TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          const Icon(
            Icons.emoji_emotions_outlined,
            color: Colors.white,
            size: 100,
          )
        ],
      ),
    );
  }

  Widget noPlayerWin() {
    return const Padding(
      padding: EdgeInsets.all(50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Nobody Win",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
          ),
          Icon(
            Icons.emoji_emotions_outlined,
            color: Colors.red,
            size: 100,
          )
        ],
      ),
    );
  }
}
