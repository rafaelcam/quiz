import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const Answer(this.text, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black, //change text color of button
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
