import 'dart:async';
import 'package:submission_2/data/api/api_service.dart';
import 'package:submission_2/data/model/restaurant.dart';
import 'package:flutter/material.dart';

enum ResultState { Loading, NoData, HasData, Error }
 
class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;
 
  RestaurantProvider({required this.apiService}) {
    _fetchAllRestaurant();
  }
 
  late RestaurantList _restaurantResult;
  String _message = '';
  late ResultState _state;
 
  String get message => _message;
 
  RestaurantList get result => _restaurantResult;
 
  ResultState get state => _state;
 
  Future<dynamic> _fetchAllRestaurant() async {
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
}