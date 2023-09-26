import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget ? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = Home(switchScreen);
  //   super.initState();
  // }

  // void switchScreen(){
  //   setState(() {
  //     activeScreen = const QuestionScreen();
  //   });
  // }

  var activeScreen = "start-screen";

  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  @override
  Widget build(context) {

    Widget screenWidget = Home(switchScreen);

    if(activeScreen == 'questions-screen'){
      screenWidget = const QuestionScreen();
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.amber, Colors.yellow],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
