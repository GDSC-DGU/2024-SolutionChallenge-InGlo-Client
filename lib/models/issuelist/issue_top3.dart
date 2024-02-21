import 'dart:convert';

class IssueTop3Model {
  int id;
  int views;
  int likes;
  String title;
  String description;
  String country;
  int sdgs;
  String imageUrl;
  String createdAt;
  int issue;

  IssueTop3Model(
      {required this.id,
        required this.views,
        required this.likes,
        required this.title,
        required this.description,
        required this.country,
        required this.sdgs,
        required this.imageUrl,
        required this.createdAt,
        required this.issue});

  IssueTop3Model.fromJson(Map<String, dynamic> json)
    : id = json['id'],
    views = json['views'],
    likes = json['likes'],
    title = json['title'] ?? "",
    description = json['description'] ?? "",
    country = json['country'] ?? "",
    sdgs = json['sdgs'],
    imageUrl = json['image_url'] ?? "",
    createdAt = json['created_at'] ?? "",
    issue = json['issue'];

}