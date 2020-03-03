import 'package:tareeqinew/exceptions/exceptions.dart';
import 'package:tareeqinew/user/user.dart';
import 'package:http/http.dart'as http;
import 'api_util.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication{

  Map<String,String> headers = {
  'accept' : 'application/json'
  };

  Future<User> register(String first_name , String last_name ,String email , String password) async{
    Map<String, String> body = {
      'first_name' : first_name,
      'last_name' : last_name,
      'email' : email,
      'password' : password,
    };

    http.Response response = await http.post(ApiUtl.AUTH_REGISTER, headers: headers , body:body );
    switch (response.statusCode){
      case 201:
        var body = jsonDecode(response.body);
        var data = body['data'];
        User user = User.fromJson(data);
        return user;
        break;
      case 422:
        throw UnprocessedEntity();
        break;
      default:
        return null;
    }
  }

  Future<User>login (String email , String password) async{
    Map<String, String> body = {
      'email' : email,
      'password' : password,
    };
    print('ready');
    http.Response response = await http.post(ApiUtl.AUTH_LOGIN, headers: headers , body:body );
    print(response.body);

    switch(response.statusCode){
      case 200 :
        var body = jsonDecode(response.body);
        var data = body['data'];
        //print(data);
        User user = User.fromJson(data);
        await _saveUser(user.user_id , user.api_token);
        return user;
        break;
      case 404 :
        throw ResourceNotFound("User");
      case 401 :
        throw LoginFailed();
        break;
      default :
        return null;
        break;
    }

  }

  Future<void> _saveUser(int userID , String apiToken) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('user_id', userID);
    sharedPreferences.setString('api_token', apiToken);
  }

}