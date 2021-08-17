import 'package:flutter/material.dart';
import 'package:submission_final/data/db/database_helper.dart';
import 'package:submission_final/data/model/restaurant.dart';
import 'package:submission_final/utils/result_state.dart';

class DatabaseProvider extends ChangeNotifier {
  final DatabaseHelper databaseHelper;
 
  DatabaseProvider({required this.databaseHelper}) {
    _getFavorites();
  }
 
  late ResultState _state;
  ResultState get state => _state;
 
  String _message = '';
  String get message => _message;
 
  List<Restaurant> _favorites = [];
  List<Restaurant> get favorites => _favorites;


  void _getFavorites() async {
    _favorites = await databaseHelper.getFavorites();
    if (_favorites.length > 0) {
      _state = ResultState.HasData;
    } else {
      _state = ResultState.NoData;
      _message = 'Empty Data';
    }
    notifyListeners();
  }

  void addFavorite(Restaurant restaurant) async {
    try {
      await databaseHelper.insertFavorite(restaurant);
      _getFavorites();
    } catch (e) {
      _state = ResultState.Error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  Future<bool> isFavorite(String id) async {
    final favoriteRestaurant = await databaseHelper.getFavoriteById(id);
    return favoriteRestaurant.isNotEmpty;
  }

  void removeFavorite(String id) async {
    try {
      await databaseHelper.removeFavorite(id);
      _getFavorites();
    } catch (e) {
      _state = ResultState.Error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }
}