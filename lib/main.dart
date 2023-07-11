import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'question.dart';
import 'quizbrain.dart';

void main() {
  runApp(const Quizler());
}

class Quizler extends StatelessWidget {
  const Quizler({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Quizpage(),
          ),
        ),
      ),
    );
  }
}

class Quizpage extends StatefulWidget {
  const Quizpage({super.key});

  @override
  State<Quizpage> createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  @override
  List<Icon> scorekeeper = [];
  Quizbrain quizbrain = Quizbrain();
  void checkanswer(bool userpickedanswer) {
    setState(() {
      bool correctanswer = quizbrain.getQuestionanswer();
      if (quizbrain.isFinished() == true) {
        Alert(
            context: context,
            title: 'Finished!',
            desc: 'You\'ve reached the end of the quiz.',
            buttons: [
              DialogButton(
                child: Text(
                  "Restart",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
// Action to perform when Button 1 is pressed
                  Navigator.pop(context);
                },
                color: Color.fromRGBO(0, 179, 134, 1.0),
              ),
              DialogButton(
                child: Text(
                  "cancle",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
// Action to perform when Button 2 is pressed
                  Navigator.pop(context);
                },
                color: Color.fromRGBO(231, 76, 60, 1.0), // Set button color
              ),
            ]).show();

        quizbrain.reset();
        scorekeeper = [];
      } else {
        if (correctanswer == userpickedanswer) {
          scorekeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scorekeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizbrain.nextquestion();
      }
    });
  }

  Question q1 = Question(
    q: 'The Great Wall of China is visible from space',
    a: false,
  );

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizbrain.getQuestiontext(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green, // Text Color
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkanswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkanswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        ),
      ],
    );
  }
}
// Alert(
// context: context,
// title: "Alert Title",
// desc: "Alert Description",
// buttons: [
// DialogButton(
// child: Text(
// "Button 1",
// style: TextStyle(color: Colors.white, fontSize: 20),
// ),
// onPressed: () {
// // Action to perform when Button 1 is pressed
// Navigator.pop(context);
// },
// color: Color.fromRGBO(0, 179, 134, 1.0), // Set button color
// ),
// DialogButton(
// child: Text(
// "Button 2",
// style: TextStyle(color: Colors.white, fontSize: 20),
// ),
// onPressed: () {
// // Action to perform when Button 2 is pressed
// Navigator.pop(context);
// },
// color: Color.fromRGBO(231, 76, 60, 1.0), // Set button color
// ),
// ],
// )
