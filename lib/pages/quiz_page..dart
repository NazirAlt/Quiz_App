import 'package:flutter/material.dart';
import 'package:flutter_test_app/constants/app_colors.dart';
import 'package:flutter_test_app/question_brain.dart';
import 'package:flutter_test_app/widgets/icon_widget.dart';

import 'package:flutter_test_app/widgets/main_widget.dart';
import 'package:flutter_test_app/widgets/text_button_widget.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Widget> icons = <Widget>[];

  int count = 0;

  String questionText = 'Suroo Jok';

  @override
  void initState() {
    super.initState();
    questionText = QuestionBrain().getQuestion();
  }

  void userAnswer(bool userAnswer) {
    bool _trueAnswer = questionBrain.userAnswer();

    if (userAnswer == _trueAnswer) {
      icons.add(trueIcon);
    } else {
      icons.add(FalseIcon);
    }

    questionBrain.getnextQuestion();
    questionText = questionBrain.getQuestion();

    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.appbackground,
        title: const Text(
          'Тапшырма-07',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 30.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 18.0, left: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MainWidget(questionText: questionText),
            questionText == 'End'
                ? TextButtonWidget(
                    buttonBgColor: AppColors.buttongreencol,
                    buttonText: 'Start again',
                    button: () {
                      setState(() {
                        icons = <Widget>[];
                        questionText = questionBrain.reset();
                      });
                    },
                  )
                : TextButtonWidget(
                    buttonBgColor: AppColors.buttongreencol,
                    buttonText: 'True',
                    button: () => userAnswer(true),
                  ),
            questionText == 'End'
                ? const SizedBox()
                : TextButtonWidget(
                    buttonBgColor: AppColors.buttonredcol,
                    buttonText: 'False',
                    button: () => userAnswer(false),
                  ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              children: icons,
            ),
            const SizedBox(
              height: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
