import 'package:flutter/material.dart';
import 'package:quiz_app/styled_text.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/question-mark.png',
          width: 300,
          // color: Colors.black,
        ),
        const SizedBox(height: 20),
        const StyledText(
          'Learn Flutter the fun way!',
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(height: 20),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            elevation: 5,
            side: const BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
          label: const StyledText(
            'Start Quest',
            fontSize: 18,
          ),
          icon: const Icon(
            Icons.arrow_circle_right,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
