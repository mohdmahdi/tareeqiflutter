class Question {
  int question_id  , section_id;
  String   question_text  ;

  Question(this.question_id, this.section_id, this.question_text);

  Question.fromJson(Map<String,dynamic> jsonObject){
    this.question_id = jsonObject['question_id'];
    this.section_id = jsonObject['section_id'];
    this.question_text = jsonObject['question'];
  }


}