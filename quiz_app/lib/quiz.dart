import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/intro_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'intro-screen';

  // @override
  // void initState() {
  //   activeScreen = IntroScreen(switchScreen);
  //   super.initState();
  // }

  void backToHome() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'intro-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final screenWiget = activeScreen == 'start-screen'
    //     ? IntroScreen(switchScreen)
    //     : const QuestionsScreen();

    Widget screenWiget = IntroScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWiget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'results-screen') {
      screenWiget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
        backTohome: backToHome,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 97, 9, 250),
                Color.fromARGB(255, 14, 7, 27),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: screenWiget,
          ),
        ),
      ),
    );
  }
}
