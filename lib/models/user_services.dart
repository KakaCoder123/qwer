import 'dart:convert';

import 'package:a1/models/class_users.dart';
import 'package:flutter/services.dart';

class UserServices {
  Future<List<ClassUsers>> loadUser() async {
    try{
      final jsonString = await rootBundle.loadString("assets/data/users.json");
      final List<dynamic> jsonData = jsonDecode(jsonString);
      return jsonData.map((item) => ClassUsers.fromJson(item)).toList();

    }catch(e){
      print("error: $e");
      return [];
    }
  }

  Future<ClassUsers?> findUser(String ident)async {
    final users = await loadUser();

    for(final user in users){
      if(user.email == ident || user.username == ident){
        return user;
      }
    }
    return null;
  }

  bool checkPassword(ClassUsers user, String password){
    return user.password == password;
  }

}