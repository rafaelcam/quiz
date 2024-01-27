import 'package:flutter/material.dart';
import 'package:quiz/answer.dart';
import 'package:quiz/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> data;
  final int selectedQuestion;
  final void Function(int) answer;

  const Quiz({
    required this.data,
    required this.selectedQuestion,
    required this.answer,
    super.key,
  });

  bool get hasSelectedQuestion {
    return selectedQuestion < data.length;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> answers =
        hasSelectedQuestion ? data[selectedQuestion].cast()['answers'] : [];

    return Column(
      children: [
        Question(data[selectedQuestion]['question'].toString()),
        ...answers
            .map((ans) => Answer(
                ans.cast()['description'], () => answer(ans.cast()['score'])))
            .toList()
      ],
    );
  }
}
