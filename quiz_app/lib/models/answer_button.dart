import 'package:flutter/material.dart';
import 'package:quiz_app/styled_text.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key,
      required this.answerText,
      required this.onTap,
      this.width = 200});

  final String answerText;
  final void Function() onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, // Set the maximum width here
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          backgroundColor: const Color.fromARGB(255, 158, 143, 3),
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        ),
        child: StyledText(
          answerText,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
