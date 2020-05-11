import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<bool> isLoggedIn() async{

  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool isLoggedIn = preferences.getBool("isLoggedIn");
  if(isLoggedIn == null || isLoggedIn == false){
    return false;
  }

  return true;

}