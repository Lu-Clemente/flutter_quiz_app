import 'package:flutter/material.dart';

import '../theme/colors.dart';

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
            OutlinedButton(
              onPressed:
                  index == 0 ? null : () => handleQuestion("back", arrayLength),
              style: OutlinedButton.styleFrom(
                  minimumSize: const Size(120, 35),
                  side: BorderSide(
                      width: 2.0,
                      color: index == 0 ? themedDisabled : themedRed),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  foregroundColor: themedRed),
              child: const Text("Previous",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  )),
            ),
            OutlinedButton(
              onPressed: index == arrayLength - 1
                  ? null
                  : () => handleQuestion("next", arrayLength),
              style: OutlinedButton.styleFrom(
                  minimumSize: const Size(120, 35),
                  side: BorderSide(
                      width: 2.0,
                      color: index == arrayLength - 1
                          ? themedDisabled
                          : themedPrimary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  foregroundColor: themedPrimary),
              child: const Text("Next",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  )),
            )
          ],
        ));
  }
}
