import 'dart:convert';

class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.foods,
    required this.drinks,
  });

  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late num rating;
  late List<Food> foods;
  late List<Drink> drinks;

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    pictureId = json['pictureId'];
    city = json['city'];
    rating = json['rating'];
    foods = parseFoods(json['menus']);
    drinks = parseDrinks(json['menus']);
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

class Food {
  Food({
    required this.name,
  });

  String name;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    name: json['name'],
  );
}

List<Food> parseFoods(Map<String, dynamic>? json) {
  if (json == null) {
    return [];
  }
  
  final List parsed = json['foods'];
  return parsed.map((json) => Food.fromJson(json)).toList();
}

class Drink {
  Drink({
    required this.name,
  });

  String name;

  factory Drink.fromJson(Map<String, dynamic> json) => Drink(
    name: json['name'],
  );
}

List<Drink> parseDrinks(Map<String, dynamic>? json) {
  if (json == null) {
    return [];
  }
  
  final List parsed = json['drinks'];
  return parsed.map((json) => Drink.fromJson(json)).toList();
}