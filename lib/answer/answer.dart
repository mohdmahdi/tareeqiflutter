import 'package:tareeqinew/Question/question.dart';
import 'package:tareeqinew/quiz/quiz.dart';

class Answer{
  int answer_id , answer_text , quiz_id , question_id;
  Quiz quiz;
  Question question;

  Answer(this.answer_id, this.answer_text, this.quiz_id, this.question_id,
      this.quiz, this.question);

  Answer.fromJson(Map<String,dynamic> jsonObject){
    this.answer_id = jsonObject['answer_id'];
    this.answer_text = jsonObject['answer_text'];
    this.quiz_id = jsonObject['quiz_id'];
    this.question_id = jsonObject['question_id'];
    this.quiz = Quiz.fromJson(jsonObject['quiz']);
    this.question = Question.fromJson(jsonObject['question']);

  }

}