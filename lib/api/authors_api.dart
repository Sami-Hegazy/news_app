import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:newsapp/models/author.dart';
import 'package:newsapp/utilities/api_utitlities.dart';

class AuthorsAPI{

  String allAuthorsApi = "";

  Future<List<Authors>> fetchAllAuthors() async {

    List<Authors> authors = List<Authors>();

      String allAuthorsApi = base_api + all_authors_api;
      var response = await http.get(allAuthorsApi);
      
      if(response.statusCode == 200){
        var jsonData = jsonDecode(response.body);
        var data = jsonData["data"];
        for( var item in data ){
          Authors author = Authors(item['id'], item['name'], item['email'], item['avatar']);
          authors.add(author);
        }
      }
      return authors;
  }

}