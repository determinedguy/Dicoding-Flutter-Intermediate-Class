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
  late double rating;
  late var menus;

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

class Menus {
  Menus({
    required this.foods,
    required this.drinks,
  });

  late List<Foods> foods;
  late List<Drinks> drinks;

  Menus.fromJson(Map<String, dynamic> menus) {
    foods = menus['foods'];
    drinks = menus['drinks'];
  }
}

class Foods {
  Foods({
    required this.name,
  });

  late String name;

  Foods.fromJson(Map<String, dynamic> foods) {
    name = foods['name'];
  }
}

class Drinks {
  Drinks({
    required this.name,
  });

  late String name;

  Drinks.fromJson(Map<String, dynamic> drinks) {
    name = drinks['name'];
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
