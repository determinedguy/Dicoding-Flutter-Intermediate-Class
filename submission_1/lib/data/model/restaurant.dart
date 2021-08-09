import 'dart:convert';

class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late num rating;
  late Map<String, dynamic> menus;

  Restaurant.fromJson(Map<String, dynamic> restaurant) {
    id = restaurant['id'];
    name = restaurant['name'];
    description = restaurant['description'];
    pictureId = restaurant['pictureId'];
    city = restaurant['city'];
    rating = restaurant['rating'];
    menus = restaurant['menus'];
  }
}

List<Restaurant> parseRestaurants(String? json) {
  if (json == null) {
    return [];
  }
  
  final Map<String, dynamic> jsonRaw = jsonDecode(json);
  final List parsed = jsonRaw['restaurants'];
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}