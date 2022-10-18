import 'package:flutter_test_app/questions.dart';

class QuestionBrain {
  int index = 0;

  List<Questions> question = [
    Questions(text: 'Кыргызстан  Кытай менен чектешеби?', answer: false),
    Questions(text: ' Карышкыр жырткыч жаныбарбы?', answer: true),
    Questions(text: 'Уй отура алабы ?', answer: false),
    Questions(text: 'Ай жердин спутнигиби ?', answer: true),
    Questions(text: 'Лира түрк акчасыбы ?', answer: true),
    Questions(text: 'Мышык үй жaныбарыбы  ?', answer: false),
  ];

  String getQuestion() {
    if (question.length == index) {
      return 'End';
    }
    return question[index].text;
  }

  bool userAnswer() {
    return question[index].answer;
  }

  getnextQuestion() {
    index++;
  }

  String reset() {
    index = 0;
    return getQuestion();
  }
}

final QuestionBrain questionBrain = QuestionBrain();
