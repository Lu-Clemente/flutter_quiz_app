import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final void Function(int index, List<Map<String, Object>> questions)
      answerQuestion;
  final int index;
  final String answerText;
  final List<Map<String, Object>> questions;

  Answer(
      {required this.answerQuestion,
      required this.index,
      required this.answerText,
      required this.questions});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () => answerQuestion(index, questions),
          child: Text(answerText)),
    );
  }
}
