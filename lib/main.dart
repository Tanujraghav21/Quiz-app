import 'package:flutter/material.dart';
import 'quizAnswer.dart';

QuizAnswer quizAnswer = QuizAnswer();
void main() {
  runApp(Quiz());
}

// ignore: camel_case_types
class Quiz extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizHome(),
          ),
        ),
      ),
    );
  }
}

class QuizHome extends StatefulWidget {

  @override
  _QuizHomeState createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  List<Icon> score = [];
   
   void checkAnswer(bool userAnswer){
     bool correctAnswer = quizAnswer.getCorrectAnswer();

     setState(() {
       if(quizAnswer.isFinished() ==true){
         AlertDialog(
           content:SingleChildScrollView(
           child: ListBody(
             children: const <Widget>[
               Text('Finished'),
               Text('You have compeleted quiz'),
            ],
           ),
           ),
         );

         quizAnswer.reset();

         score=[];
       }else{
         if(userAnswer == correctAnswer){
         score.add(Icon(
           Icons.check,
           color: Colors.green,
         ));
        } else{
          score.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizAnswer.nextQuestion();
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
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              quizAnswer.getQuestionText(),
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
        child:Padding(
          padding: EdgeInsets.all(15.0),
          child: FlatButton(
            textColor: Colors.white,
            color: Colors.white,
            child: Text(
              'True',
              style: TextStyle(
                color: Colors.green,
                fontSize: 25.0,
              ),
            ),
            onPressed: (){
              checkAnswer(true);
            },
          ),
       ),
    ),
      Expanded(
        child:Padding(
          padding: EdgeInsets.all(15.0),
          child: FlatButton(
            textColor: Colors.white,
            color: Colors.white,
            child: Text(
              'false',
              style: TextStyle(
                color: Colors.red,
                fontSize: 25.0,
              ),
            ),
            onPressed: (){
              checkAnswer(false);
            },
          ),
       ),
    ),
    Row(
      children: score,
    )
    ],
  );
}
}