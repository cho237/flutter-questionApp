import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      "questionText": "what's your favourite color?",
      "answers": [
        {"text": "black", "score": 10},
        {"text": "Red", "score": 5},
        {"text": "White", "score": 3},
        {"text": "blue", "score": 8},
      ],
    },
    {
      "questionText": "what's your favourite animal?",
      "answers": [
        {"text": "Dog", "score": 4},
        {"text": "Cat", "score": 8},
        {"text": "Rabbit", "score": 8},
        {"text": "lion", "score": 5}
      ],
    },
    {
      "questionText": "what's your favourite instructor?",
      "answers": [
        {"text": "King", "score": 25},
        {"text": "John", "score": 15},
        {"text": "paul", "score": 12},
        {"text": "Nju", "score": 5}
      ],
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    }); 
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My First App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
