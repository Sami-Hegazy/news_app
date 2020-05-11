import 'dart:convert';

class Posts {
  final int id;
  final String name;
  final String tagline;
  final String description;
  final String image_url;
  final String first_brewed;


  Posts({this.id, this.name, this.tagline, this.description, this.image_url , this.first_brewed});



  factory Posts.fromJSON(Map<String, dynamic> json) {
    return Posts(
      id: json['id'],
      name: json['name'],
      tagline: json['tagline'],
      description: json['description'],
      image_url: json['image_url'],
      first_brewed: json['first_brewed'],
    );
  }



}