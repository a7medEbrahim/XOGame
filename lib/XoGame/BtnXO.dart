import 'package:flutter/material.dart';

import '../playersModel.dart';

class BtnXO extends StatelessWidget {
  String item;
  int index;
  Function onBtnClick;
  PlayerModel playerModel;

  BtnXO(
      {required this.item,
      required this.onBtnClick,
      required this.index,
      required this.playerModel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: ElevatedButton(
            onPressed: () {
              onBtnClick(index, playerModel);
            },
            child: Text(
              item,
              style: TextStyle(fontSize: 50),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(color: Colors.white, width: 5))),
          ),
        ),
      ),
    );
  }
}
