import 'package:flutter/material.dart';
import 'package:submission_final/common/styles.dart';
import 'package:submission_final/ui/restaurant_detail_page.dart';
import 'package:submission_final/data/model/restaurant.dart';

class CardRestaurant extends StatelessWidget {
  final Restaurant restaurant;

  const CardRestaurant({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor, // Dark Mode Bug
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: restaurant.pictureId,
          child: Image.network(
            "https://restaurant-api.dicoding.dev/images/large/" + restaurant.pictureId,
            width: 100,
          ),
        ),
        title: Text(
          restaurant.name,
        ),
        subtitle: Row(
          children: [
            Text(restaurant.city + " - " + '${restaurant.rating.toString()}'),
            const Icon(
              Icons.star,
              color: Colors.black26,
            ),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, RestaurantDetailPage.routeName,
              arguments: restaurant);
        },
      ),
    );
  }
}
