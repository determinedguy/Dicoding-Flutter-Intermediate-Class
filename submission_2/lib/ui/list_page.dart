import 'package:submission_2/data/api/api_service.dart';
import 'package:submission_2/provider/restaurant_provider.dart';
import 'package:submission_2/widgets/card_restaurant.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class RestaurantListPage extends StatelessWidget {
  static const routeName = '/restaurant_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Restaurant',
        ),
      ),
      body: _buildRestaurantItem(context),
    );
  }

  Widget _buildRestaurantItem(BuildContext context) {
    return ChangeNotifierProvider<RestaurantProvider>(
      create: (_) => RestaurantProvider(apiService: ApiService()),
      child: Consumer<RestaurantProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.Loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.state == ResultState.HasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.result.count,
              itemBuilder: (context, index) {
                var restaurant = state.result.restaurants[index];
                return CardRestaurant(restaurant: restaurant);
              },
            );
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
