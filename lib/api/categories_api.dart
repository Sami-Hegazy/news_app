import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:newsapp/models/categories.dart';
import 'package:newsapp/utilities/api_utitlities.dart';
import 'package:http/http.dart' as http;

class CategoriesApi{
  Future <List<Category1>> fetchCategory() async{

    List<Category1> categories = List<Category1>();
    String allCategory = base_api + all_category_api;
    final response = await http.get(allCategory);

    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      for(var item in jsonData){
        Category1 category = Category1(item['id'].toString() , item['title'].toString());
        categories.add(category);
        print(category.title);
        return categories;
      }
    }else{
      throw Exception('Failed to load posts');
    }
  }
}