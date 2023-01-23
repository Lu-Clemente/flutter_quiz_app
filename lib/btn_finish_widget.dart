import 'package:first_app/theme/colors.dart';
import 'package:flutter/material.dart';

class BtnFinish extends StatelessWidget {
  const BtnFinish({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () => print("Clicked"),
        style: ElevatedButton.styleFrom(
          backgroundColor: themedGreen
        ),
        child: const Text("Finish"),
      ),
    );
  }
}
