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
            child: Question(),
          ),
        ),
      ),
    );
  }
}

class Question extends StatefulWidget {
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  List<Icon> keper = [
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
  ];

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
                'Are You Crazy.',
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
                setState(
                  () {
                    keper.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    );
                  },
                );
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
                setState(
                  () {
                    keper.add(
                      Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
        Row(
          children: keper,
        )
      ],
    );
  }
}
