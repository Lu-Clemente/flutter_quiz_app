import 'package:flutter/material.dart';

class BtnController extends StatelessWidget {
  final int index;
  final int arrayLength;
  final void Function(String actionType, int arrLength) handleQuestion;

  // ignore: use_key_in_widget_constructors
  BtnController(
      {required this.handleQuestion,
      required this.index,
      required this.arrayLength});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: index == 0
                  ? null
                  : () => handleQuestion("back", arrayLength),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red[400]),
              child: Text("Previous"),
            ),
            ElevatedButton(
                onPressed: index == arrayLength - 1
                    ? null
                    : () => handleQuestion("next", arrayLength),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[400]),
                child: Text("Next")),
          ],
        ));
  }
}
