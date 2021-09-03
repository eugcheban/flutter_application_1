import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String randomUrl = "";

Future<List<Photo>> fetchPhotos() async {
  final response = await http.get(Uri.parse(
      'https://api.unsplash.com/photos/?client_id=ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9'));

  return compute(parsePhotos, response.body);
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class Photo {
  final String id;
  final String username;
  final String bio;
  final String urlSmall;
  final String urlBig;

  const Photo({
    required this.id,
    required this.username,
    required this.bio,
    required this.urlSmall,
    required this.urlBig,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    if (randomUrl == "") randomUrl = json['urls']['full'];
    return Photo(
      id: json['id'] as String,
      username: json['user']['username'] as String,
      bio: json['user']['bio'] == null ? "bio" : json['user']['bio'],
      urlSmall: json['urls']['small'] as String,
      urlBig: json['urls']['full'] as String,
    );
  }
}

class DetailScreen extends StatelessWidget {
  DetailScreen(this.url);
  final url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(url),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
