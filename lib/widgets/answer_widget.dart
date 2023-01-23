import 'package:flutter/material.dart';

import '../theme/colors.dart';

class Answer extends StatelessWidget {
  final void Function(String answerText) answerQuestion;
  final String answerText;

  Answer({
    required this.answerQuestion,
    required this.answerText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: themedPrimary),
          onPressed: () => answerQuestion(answerText),
          child: Text(answerText)),
    );
  }
}
