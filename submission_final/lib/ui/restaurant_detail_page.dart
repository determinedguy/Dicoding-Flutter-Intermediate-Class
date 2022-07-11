import 'package:submission_final/provider/restaurant_provider.dart';
import 'package:submission_final/utils/result_state.dart';
import 'package:submission_final/widgets/detail_restaurant.dart';
import 'package:submission_final/data/model/restaurant.dart';
import 'package:submission_final/data/api/api_service.dart';
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
    RestaurantProvider _provider;

    return ChangeNotifierProvider<RestaurantProvider>(
      create: (_) => RestaurantProvider(apiService: ApiService(), type: 'detail', id: restaurant.id),
      child: Consumer<RestaurantProvider>(
        builder: (context, state, _) {
          _provider = state;
          if (state.state == ResultState.Loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.state == ResultState.HasData) {
            var restaurantComplete = state.result.restaurant;
            return DetailRestaurant(restaurant: restaurant, restaurantComplete: restaurantComplete, restaurantProvider: _provider,);
          } else if (state.state == ResultState.NoData) {
            return Center(child: Text(state.message));
          } else if (state.state == ResultState.Error) {
            return Center(child: Text("Tidak ada koneksi Internet."));
          } else {
            return Center(child: Text(''));
          }
        },
      ),
    );
  }
}
