import 'dart:async';
import 'package:submission_2/data/api/api_service.dart';
import 'package:submission_2/data/model/restaurant.dart';
import 'package:flutter/material.dart';

enum ResultState { Loading, NoData, HasData, Error }
 
class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;
  final String type;
  final Restaurant? restaurant;
 
  RestaurantProvider({required this.apiService, required this.type, required this.restaurant}) {
    if (type == 'list') {
      fetchAllRestaurant();
    } else if (type == 'detail') {
      fetchRestaurantDetail(restaurant!);
    }
  }
 
  late dynamic _restaurantResult;
  String _message = '';
  late ResultState _state;
 
  String get message => _message;
 
  dynamic get result => _restaurantResult;
 
  ResultState get state => _state;
 
  Future<dynamic> fetchAllRestaurant() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurantList = await apiService.restaurantList();
      if (restaurantList.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantResult = restaurantList;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }

  Future<dynamic> fetchRestaurantDetail(Restaurant restaurant) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurantDetail = await apiService.restaurantDetail(restaurant.id);
      _state = ResultState.HasData;
      notifyListeners();
      return _restaurantResult = restaurantDetail;
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }

  Future<dynamic> fetchRestaurantSearch(String query) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurantSearch = await apiService.restaurantSearch(query);
      if (restaurantSearch.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _restaurantResult = restaurantSearch;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}