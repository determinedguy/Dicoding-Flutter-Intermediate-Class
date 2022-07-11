import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission_final/provider/database_provider.dart';
import 'package:submission_final/utils/result_state.dart';
import 'package:submission_final/widgets/card_restaurant.dart';

class FavoritesPage extends StatelessWidget {
  static const String favoritesTitle = 'Favorites';

  final DatabaseProvider provider;

  const FavoritesPage({required this.provider});

  Widget _buildList() {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        if (provider.state == ResultState.HasData) {
          return ListView.builder(
            itemCount: provider.favorites.length,
            itemBuilder: (context, index) {
              return CardRestaurant(restaurant: provider.favorites[index]);
            },
          );
        } else {
          return Center(
            child: Text(provider.message),
          );
        }
      },
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(favoritesTitle),
      ),
      body: _buildList(),
    );
  }
}