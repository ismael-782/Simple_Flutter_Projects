import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  // we made it in this format because we need to have those features inside the button 
  // otherwise we do not want to make a button empty
  const AnswerButton({super.key, required this.onTap, required this.Answer});

  final String Answer;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(Answer,textAlign: TextAlign.center,),
    );
  }
}
