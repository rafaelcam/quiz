import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final void Function() onResetQuiz;

  const Result(this.score, this.onResetQuiz, {super.key});

  String get result {
    if (score < 8) {
      return 'Parabéns';
    } else if (score < 12) {
      return 'Você é bom!';
    } else if (score < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            result,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
            onPressed: onResetQuiz,
            child: const Text(
              'Reiniciar?',
              style: TextStyle(fontSize: 18),
            ))
      ],
    );
  }
}
