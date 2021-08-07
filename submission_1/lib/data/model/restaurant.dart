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
    //required this.foods,
    //required this.drinks,
  });

  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late double rating;
  late var menus;
  //late List<String> foods;
  //late List<String> drinks;  

  Restaurant.fromJson(Map<String, dynamic> restaurant) {
    id = restaurant['id'];
    name = restaurant['name'];
    description = restaurant['description'];
    pictureId = restaurant['pictureId'];
    city = restaurant['city'];
    rating = restaurant['rating'];
    menus = restaurant['menus'];
    //foods = List<String>.from(restaurant['menus']['foods'].map((x) => x));
    //drinks = List<String>.from(restaurant['menus']['drinks'].map((x) => x));
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
