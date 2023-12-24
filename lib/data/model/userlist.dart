import 'dart:convert';

ListUser listUserFromJson(String str) => ListUser.fromJson(json.decode(str));

String listUserToJson(ListUser data) => json.encode(data.toJson());

class ListUser {
  ListUser({
    required this.data,
    required this.totalPage,
  });

  List<User> data;
  int totalPage;

  factory ListUser.fromJson(Map<String, dynamic> json) => ListUser(
        totalPage: json['total_pages'],
        data: List<User>.from(json["data"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalPage": totalPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class User {
  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "avatar": avatar,
      };
}
