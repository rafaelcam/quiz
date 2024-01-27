import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';
import 'package:quiz/result.dart';

void main() {
  runApp(_QuizApp());
}

class _QuizAppState extends State<_QuizApp> {
  var _selectedQuestion = 0;
  var _totalScore = 0;
  final _data = const [
    {
      'question': 'Qual é sua cor favorita?',
      'answers': [
        {'description': 'Preto', 'score': 10},
        {'description': 'Vermelho', 'score': 5},
        {'description': 'Verde', 'score': 3},
        {'description': 'Branco', 'score': 1},
      ]
    },
    {
      'question': 'Qual é o seu animal favorito?',
      'answers': [
        {'description': 'Coelho', 'score': 10},
        {'description': 'Cobra', 'score': 5},
        {'description': 'Elefante', 'score': 3},
        {'description': 'Leão', 'score': 1},
      ]
    },
    {
      'question': 'Qual seu instrutor favorito?',
      'answers': [
        {'description': 'João', 'score': 10},
        {'description': 'Yasmin', 'score': 5},
        {'description': 'Matheus', 'score': 3},
        {'description': 'Diego', 'score': 1},
      ]
    },
  ];

  bool get hasSelectedQuestion {
    return _selectedQuestion < _data.length;
  }

  void _answer(int score) {
    if (hasSelectedQuestion) {
      setState(() {
        _selectedQuestion++;
        _totalScore += score;
      });
    }
  }

  void _resetQuiz() {
    setState(() {
      _selectedQuestion = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz'),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: hasSelectedQuestion
            ? Quiz(
                data: _data,
                selectedQuestion: _selectedQuestion,
                answer: _answer,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

class _QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() {
    return _QuizAppState();
  }
}
