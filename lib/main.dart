// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

import './question_widget.dart';

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

  void _answerQuestion(int answerNumber) {
    print('Answer #$answerNumber chosen!');
  }

  void _handleQuestion(String actionType, int questionsLength) {
    if (actionType == "next" && _questionIndex < questionsLength - 1) {
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
    var questions = [
      "What's is your favorite color?",
      "What's your favorite animal?",
      "What's Brazil's capital?",
      "Who's is the best soccer player?"
    ];

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text("Test App"),
            ),
            body: Center(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 15),
                            child: Question(
                              questions[_questionIndex],
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () => _answerQuestion(1),
                              child: Text("Answer 1")),
                          ElevatedButton(
                              onPressed: () => _answerQuestion(2),
                              child: Text("Answer 2")),
                          ElevatedButton(
                              onPressed: () => _answerQuestion(3),
                              child: Text("Answer 3")),
                        ]),
                        SizedBox(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: _questionIndex == 0
                                      ? null
                                      : () => _handleQuestion(
                                          "back", questions.length),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red[400]),
                                  child: Text("Previous"),
                                ),
                                ElevatedButton(
                                    onPressed:
                                        _questionIndex == questions.length - 1
                                            ? null
                                            : () => _handleQuestion(
                                                "next", questions.length),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green[400]),
                                    child: Text("Next")),
                              ],
                            )),
                      ],
                    )))));
  }
}
