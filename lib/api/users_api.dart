import 'package:http/http.dart' as http;
import 'package:newsapp/models/users.dart';
import 'dart:convert';
import 'package:newsapp/utilities/api_utitlities.dart';

class UsersAPI{

  Future <List<Users>> fetchUsers() async {

    List<Users> users = List<Users>();

    String allUsersApi = base_api + all_users_api;

    final response =  await http.get(allUsersApi);


    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      var jsonData = jsonDecode(response.body);
      var data = jsonData[1];
      for (var item in jsonData) {
        Users user = Users(item['id'].toString(), item['name'].toString(),
            item['email'].toString(), item['username'].toString());
        users.add(user);
        print( user.name);

        return users;
      }

    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }


//
//  Future<List<Users>> fetchAllAuthors() async {
//    List<Users> users = List<Users>();
//    String allAuthorsApi = base_api + all_authors_api;
//    var response = await http.get(allAuthorsApi);
//    if (response.statusCode == 200) {
//      var jsonData = jsonDecode(response.body);
//      var data = jsonData["data"];
//      for (var item in data) {
//        Users user = Users(item['id'].toString(), item['name'].toString(),
//            item['email'].toString(), item['avatar'].toString());
//        users.add(user);
//        print(user.name);
//      }
//    }
//    return users;
//  }

}