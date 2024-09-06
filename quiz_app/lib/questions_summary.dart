import 'package:flutter/material.dart';
import 'package:quiz_app/styled_text.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final isCorrect = data['correct_answer'] == data['user_answer'];
            final containerColor = isCorrect
                ? Colors.green
                : const Color.fromARGB(255, 255, 108, 157);

            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   data['question'] as String,
                        //   style: const TextStyle(
                        //       color: Colors.white,
                        //       fontSize: 17,
                        //       fontWeight: FontWeight.bold),
                        // ),
                        StyledText(
                          data['question'] as String,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Correct Answer: ${data['correct_answer'] as String}",
                          style: const TextStyle(
                            color: Colors.amber,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Your Answer: ${data['user_answer'] as String}",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 89, 169, 235),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
