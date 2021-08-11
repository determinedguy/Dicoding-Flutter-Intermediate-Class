import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:submission_2/data/model/restaurant.dart';

class ApiService {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev/';

  Future<RestaurantList> restaurantList() async {
    final response = await http.get(Uri.parse(_baseUrl + "list"));
    if (response.statusCode == 200) {
      return RestaurantList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load the restaurant list.');
    }
  }
}
