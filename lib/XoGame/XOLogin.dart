import 'package:flutter/material.dart';

import '../playersModel.dart';
import 'XO.dart';

class XoLogin extends StatelessWidget {
  static const String routeName = 'XoLogin';
  TextEditingController name1Controller = TextEditingController();
  TextEditingController name2Controller = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('XO Game'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'must be enter player1 name';
                  }
                  return null;
                },
                controller: name1Controller,
                decoration: InputDecoration(
                  label: const Text(
                    'Player1',
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.blue)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.blue)),
                  filled: true,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'must be enter player2 name';
                  }
                  return null;
                },
                controller: name2Controller,
                decoration: InputDecoration(
                  label: const Text(
                    'Player2',
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.blue)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.blue)),
                  filled: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, XOGame.routeName,
                          arguments: PlayerModel(
                              name1: name1Controller.text,
                              name2: name2Controller.text));
                    }
                  },
                  child: const Text("Let's Go"))
            ],
          ),
        ),
      ),
    );
  }
}
