import 'package:flutter/material.dart';
import 'dart:math';

class change_dice extends StatefulWidget {
  const change_dice({super.key});

  @override
  State<change_dice> createState() {
    return _changeDiceState();
  }
}

class _changeDiceState extends State<change_dice> {
  var diceNumber = 1; // default value of the dice is one
  final randomizer = Random();

  void rooldice() {
    setState(() {
      diceNumber = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("images/dice-$diceNumber.png", height: 200),
        const SizedBox(height: 20),
        TextButton(
            onPressed: rooldice,
            child: const Text(
              "Rool the Dice",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
