import 'package:score_quiz_app/theme/colors.dart';
import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final int totalScore;

  Score({required this.totalScore});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Total Score",
            style: TextStyle(
                color: themedPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w500)),
        Container(
          height: 70,
          width: 180,
          margin: const EdgeInsets.only(top: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: themedPrimary, width: 2.5)),
          child: Text(totalScore.toString(),
              style: const TextStyle(
                  color: themedPrimary,
                  fontSize: 30,
                  fontWeight: FontWeight.w700)),
        )
      ],
    );
  }
}
