import 'package:flutter/material.dart';

class Movie {
  final String name;
  final String imageUrl;
  final String description;
  final String rating;

  const Movie({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.rating,
  });
}
