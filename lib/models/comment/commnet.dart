import 'dart:convert'; // jsonDecode를 사용하기 위해 import

class Comment {
  final int id;
  final User user;
  final String content;
  final int? parent_feedback;
  final String created_at;

  const Comment({
    required this.id,
    required this.user,
    required this.content,
    this.parent_feedback,
    required this.created_at,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      user: User.fromJson(json['user']),
      content: json['content'],
      parent_feedback: json['parent_feedback'],
      created_at: json['created_at'],
    );
  }

  // comment 객체를 list로 변환한다.
  static List<Comment> parseComments(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Comment>((json) => Comment.fromJson(json)).toList();
  }
}


class User {
  final int id;
  final String? name;
  final String? profile_img;

  User({
    required this.id,
    this.name,
    this.profile_img,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      profile_img: json['profile_img'],
    );
  }
}