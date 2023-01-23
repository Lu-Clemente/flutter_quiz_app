// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

import 'theme/colors.dart';
import 'widgets/answer_widget.dart';
import 'widgets/question_widget.dart';
import 'widgets/btn_controller_widget.dart';
import 'widgets/btn_finish_widget.dart';

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
  final questions = const [
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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text("Test App"),
              backgroundColor: themedPrimary,
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
                      ...(questions[_questionIndex]['answers'] as List<String>)
                          .map((answer) {
                        return Answer(
                            answerQuestion: _answerQuestion,
                            index: 1,
                            questions: questions,
                            answerText: answer.toString());
                      }).toList(),
                      Container(
                        constraints: BoxConstraints.tightFor(height: 150),
                        child: BtnController(
                          index: _questionIndex,
                          arrayLength: questions.length,
                          handleQuestion: _handleQuestion,
                        ),
                      )
                    ]),
                    BtnFinish()
                  ],
                ))));
  }
}
