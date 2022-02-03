import 'package:flutter/material.dart';
import '../Questions.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
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
  // Questions questionBank = Questions(
  //     q: "You can lead a cow down stairs but not up stairs.", a: true); //For Single Question

  List<Questions> questionBank = [
    Questions(q: "You can lead a cow down stairs but not up stairs.", a: false),
    Questions(
        q: "Approximately one quarter of human bones are in the feet.",
        a: true),
    Questions(q: "A slug\'s blood is green.", a: true),
    Questions(q: "Your Name is उदित", a: true)
  ];

  List<Widget> scoreKeeper = [];
  int questionNum = 0;

  @override
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
                questionBank[questionNum].questionText,
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
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  bool correctAnswer = questionBank[questionNum].questionAnswer;
                  if (correctAnswer == true) {
                    print("YES");
                  } else {
                    print("NO");
                  }
                  setState(() {
                    if (correctAnswer == true) {
                      print("YES");
                      scoreKeeper.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      );
                    } else {
                      print("NO");
                      scoreKeeper.add(
                        Icon(Icons.close, color: Colors.red),
                      );
                    }
                    questionNum = questionNum + 1;

                    // if (questionNum < 3) {
                    //   questionNum = questionNum + 1;
                    // } else {
                    //   print("OK");
                    // }
                  });
                }),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              // color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
              },
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: scoreKeeper,
          ),
        )
      ],
    );
  }
}
