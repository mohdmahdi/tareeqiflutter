import 'api_util.dart';
import 'package:tareeqinew/section/section.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SectionsApi{

  Map<String,String> headers = {
    'Accept' : 'application/json'
  };

  Future<List<Section>> fetchSections(int page) async{
    await checkInternet();
    String url = ApiUtl.SECTIONS +'?page=' + page.toString();
    http.Response response= await http.get(url, headers: headers);
    List<Section> sections = [];
    if(response.statusCode == 200) {
      //print(response.body);
      var body = jsonDecode(response.body);
      //print(body);
      for(var item in body['data']){

        sections.add(
            Section.fromJson(item)
        );

      }
      return sections;
    }
    return null ;
  }

  Future<Section> fetchProduct(int section_id)async{
    await checkInternet();
    String url = ApiUtl.SECTION + section_id.toString();
    http.Response response = await http.get(url, headers: headers);
    if(response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return Section.fromJson(body['data']);
    }
    return null;
  }
}

