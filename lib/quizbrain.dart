import 'question.dart';

class Quizbrain {
  int _questionnumber = 0;
  List<Question> _questionbank = [
    Question(q: 'The Great Wall of China is visible from space', a: false),
    Question(q: 'Mount Everest is the tallest mountain in the world.', a: true),
    Question(q: 'The human body has four lungs.', a: false),
    Question(q: 'The capital of Australia is Sydney.', a: false),
    Question(
        q: 'The Statue of Liberty was a gift from France to the United States.',
        a: true),
    Question(q: 'The Nile River is the longest river in the world.', a: true),
    Question(
        q: 'The Great Barrier Reef is located off the coast of Australia',
        a: true),
    Question(q: 'The currency of Japan is the yen.', a: true),
    Question(q: 'The Earth revolves around the Moon.', a: false),
    Question(q: 'The Eiffel Tower is located in London.', a: false),
    Question(q: 'The Eiffel Tower is located in London.', a: false),
  ];
  void nextquestion() {
    if (_questionnumber < _questionbank.length - 1) {
      _questionnumber++;
    }
  }

  String getQuestiontext() {
    return _questionbank[_questionnumber].questiontext;
  }

  bool getQuestionanswer() {
    return _questionbank[_questionnumber].questionasnwer;
  }

  bool isFinished() {
    if (_questionnumber >= _questionbank.length - 1) {
      print('Now returning true');

      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionnumber = 0;
  }
}
