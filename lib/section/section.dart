import 'package:tareeqinew/Question/question.dart';
class Section {
  int section_id ;
  String section_name;
  List<String> questions;

  Section(this.section_id, this.section_name, this.questions);

  Section.fromJson(Map<String,dynamic> jsonObject){

    this.section_id = jsonObject['section_id'];
    this.section_name = jsonObject['section_name'];
   _setQuestions(jsonObject['question']);
  }

  void _setQuestions(List<dynamic> questionsJson){
    this.questions =[];
    for(var question in questionsJson){
      questions.add(question['question']);

    }

  }

}