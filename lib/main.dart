// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:first_app/answer_widget.dart';
import 'package:flutter/material.dart';

import './question_widget.dart';
import './btn_controller_widget.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  var _questionIndex = 0;

  void _answerQuestion(int answerIndex, List<Map<String, Object>> questions) {
    // print('Answer: ${questions[_questionIndex]['answer'].toString()[answerIndex]}');
    print(answerIndex);
  }

  void _handleQuestion(String actionType, int arrLength) {
    if (actionType == "next" && _questionIndex < arrLength - 1) {
      setState(() {
        _questionIndex++;
      });
    }

    if (actionType == "back" && _questionIndex > 0) {
      setState(() {
        _questionIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        "question": "What's is your favorite color?",
        "answers": ["Black", "Blue", "Green", "White"]
      },
      {
        "question": "What's your favorite animal?",
        "answers": ["Eagle", "Fish", "Rabbit", "Lion"]
      },
      {
        "question": "What's Brazil's capital?",
        "answers": ["São Paulo", "Brasília", "Manaus"]
      },
      {
        "question": "Who's is the best soccer player?",
        "answers": ["Ronaldo Fenômeno", "Messi", "Cristiano Ronaldo"]
      }
    ];

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text("Test App"),
            ),
            body: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 15),
                            child: Question(
                              questions[_questionIndex]['question'].toString(),
                            ),
                          ),
                          ...(questions[_questionIndex]['answers']
                                  as List<String>)
                              .map((answer) {
                            return Answer(
                                answerQuestion: _answerQuestion,
                                index: 1,
                                questions: questions,
                                answerText: answer.toString());
                          }).toList()
                        ]),
                        BtnController(
                          index: _questionIndex,
                          arrayLength: questions.length,
                          handleQuestion: _handleQuestion,
                        )
                      ],
                    ))));
  }
}
