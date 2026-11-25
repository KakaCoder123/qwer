import 'package:a1/models/class_discovery.dart';

class ClassUsers {
  final int id;
  final String username, email, password, nickname, avatar;
  final List<ClassDiscovery> discovers;

  ClassUsers({
    required this.id, required this.password, required this.email, required this.username, required this.discovers, required this.nickname, required this.avatar
  });


  factory ClassUsers.fromJson(Map<String, dynamic> json){
    return ClassUsers(
        id: json["id"],
        password: json["password"],
        email: json["email"],
        username: json["username"],
        discovers: (json["discovers"] as List).map((item) => ClassDiscovery.fromJson(item)).toList(),
        nickname: json["nickname"],
        avatar: json["avatar"]
    );
  }
}