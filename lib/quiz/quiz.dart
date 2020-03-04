import 'package:tareeqinew/user/user.dart';

class Quiz {

  int quiz_id;
  int user_id;
  User user;

  Quiz(this.quiz_id, this.user_id, this.user);

  Quiz.fromJson(Map<String,dynamic> jsonObject){
    this.quiz_id = jsonObject['quiz_id'];
    this.user_id = jsonObject['user_id'];
    this.user = User.fromJson(jsonObject['user']);
  }


}