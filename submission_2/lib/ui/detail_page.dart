import 'package:submission_2/provider/restaurant_provider.dart';
import 'package:submission_2/widgets/detail_restaurant.dart';
import 'package:submission_2/data/model/restaurant.dart';
import 'package:submission_2/data/api/api_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final Restaurant restaurant;

  const RestaurantDetailPage({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant'),
      ),
      body: _buildRestaurantDetails(context),
    );
  }

  Widget _buildRestaurantDetails(BuildContext context) {
    return ChangeNotifierProvider<RestaurantProvider>(
      create: (_) => RestaurantProvider(apiService: ApiService(), type: 'detail', restaurant: restaurant),
      child: Consumer<RestaurantProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.Loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.state == ResultState.HasData) {
            var restaurant = state.resultDetail.restaurant;
            return DetailRestaurant(restaurant: restaurant);
          } else if (state.state == ResultState.NoData) {
            return Center(child: Text(state.message));
          } else if (state.state == ResultState.Error) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text(''));
          }
        },
      ),
    );
  }
}
