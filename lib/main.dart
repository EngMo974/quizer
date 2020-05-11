import 'dart:ui';
import 'package:quizer/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

QuizBrain quizBrain = new QuizBrain();

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> keper = [];

  void checkAnswer(bool pickAnswer) {
    bool correctAnswer = quizBrain.getAnswer();

    setState(() {

      if (quizBrain.isFinished() == true) {
        Alert(
                context: context,
                title: 'Finished!',
                desc: 'You\'ve reached the end of the quiz.')
            .show();
        quizBrain.rest();
        keper = [];
      } else {
        if (pickAnswer == correctAnswer) {
          keper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          keper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQ();
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: FlatButton(
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: FlatButton(
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: keper,
          ),
        )
      ],
    );
  }
}
