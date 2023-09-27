import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';

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

  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";


  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }

  void onRestart(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

    void onHome(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  @override
  Widget build(context) {

    Widget screenWidget = Home(switchScreen);

    if(activeScreen == 'questions-screen'){
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer,);
    }

    if(activeScreen == 'results-screen'){
      screenWidget = ResultScreen(chosenAnswer: selectedAnswers, onRestart: onRestart, onHome: onHome,);
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
