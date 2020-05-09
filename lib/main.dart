import 'dart:ui';

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

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> keper = [];
  List<String> questions = [
    '1- The sun is too close to us ?',
    '2- Humans can breathe under the water ?',
    '3- Cats are beautiful ?'
  ];

  List<bool> answers = [false, false, true];

  int quNo = 0;

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
                questions[quNo],
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
                setState(() {
                  quNo++;
                  bool correct = answers[quNo];
                  if (correct == true) {
                    keper.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  } else {
                    keper.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  }
                });
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
                setState(() {
               quNo++;
                  bool correct = answers[quNo];
                  if (correct == false) {
                    keper.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  } else {
                    keper.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  }
                });
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

  void incNm() {
    quNo++;
    if (quNo == questions.length) {
      quNo = 0;
    }
  }
}
