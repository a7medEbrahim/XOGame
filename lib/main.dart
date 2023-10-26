import 'package:flutter/material.dart';
import 'XoGame/XO.dart';
import 'XoGame/XOLogin.dart';

void main() {
  runApp(Myapplication());
}

class Myapplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: XoLogin.routeName,
      routes: {
        XoLogin.routeName: (context) => XoLogin(),
        XOGame.routeName: (context) => XOGame(),
      },
    );
  }
}
