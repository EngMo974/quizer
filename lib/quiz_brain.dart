import 'package:quizer/questions.dart';

class QuizBrain {
  int _quNo = 0;

  List<Question> _qa = [
    Question(
        questionTest: '1- The sun is too close to us ?', questionAnswer: false),
    Question(
        questionTest: '2- Humans can breathe under the water ?',
        questionAnswer: false),
    Question(questionTest: '3- Cats are beautiful ?', questionAnswer: true)
  ];

  String getQuestion() {
    return _qa[_quNo].questionTest;
  }

  bool getAnswer() {
    return _qa[_quNo].questionAnswer;
  }

  void nextQ() {
    if (_quNo < _qa.length - 1) {
      _quNo++;
    }
  }

  bool isFinished() {
    if (_quNo >= _qa.length - 1) {
      return true;
    } else
      return false;
  }

  void rest() {
    _quNo = 0;
  }
}
