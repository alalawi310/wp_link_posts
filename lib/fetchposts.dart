import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var url = 'https://studio-press.pro/wp-json/wp/v2/posts?_embed';

Future<List> fetchPosts() async {
  final response = await http.get(url, headers: {"Accept": "application/json"});
  var convertData = jsonDecode(response.body);
  return convertData;
}

var catUrl =
    'https://studio-press.pro/wp-json/wp/v2/posts?_embed&fields=title,content.rendered&search=';

Future<List> fetchCategories(id) async {
  final response = await http.get(url, headers: {"Accept": "application/json"});
  var convertData = jsonDecode(response.body);
  print(convertData);
  return convertData;
}




var myCat = 'https://studio-press.pro/wp-json/wp/v2/posts?_embed';

Future<CategoryModel> fetchcatposts() async {
  final response = await http.get(myCat, headers: {"Accept": "application/json"});
  var convertData = jsonDecode(response.body);
  print(convertData);
  return convertData;
}

class CategoryModel {
  int id;
  String title,date;

  CategoryModel({this.id, this.title, this.date});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title']['rendered'];
    date = json['date'];
  }


List<CategoryModel> categoryFromJson(String str) => List<CategoryModel>.from(
      jsonDecode(str).map(
        (x) => CategoryModel.fromJson(x),
      ),
    );
}
