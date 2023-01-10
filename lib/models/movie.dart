import 'package:flutter/material.dart';

class Movie {
  final String title;
  final String subTitle;
  final String imgUrl;
  final String rating;
  final List<String> genres;

  const Movie({
    required this.title,
    required this.imgUrl,
    required this.rating,
    required this.genres,
    required this.subTitle,
  });
}
