import 'dart:convert';

class Recipe {
  String? name;
  String? images;
  double? rating;

  String? totalTime;

  Recipe({
    required this.images,
    required this.rating,
    required this.name,
    required this.totalTime,
  });

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      images: json['images'][0]['hostedLargeUrl'] as String,
      rating: json['rating'] as double,
      name: json['name'] as String,
      totalTime: json['totalTime'] as String,
    );
  }

  static List<Recipe> recpieFromSnapshot(List snapshot) {
    return snapshot.map((e) {
      return Recipe.fromJson(e);
    }).toList();
  }

  @override
  String toString() {
    return 'Recpie {images: $images, rating: $rating, name: $name, totalTime: $totalTime}';
  }
}
