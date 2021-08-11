import 'package:submission_2/data/api/api_service.dart';
import 'package:submission_2/widgets/card_restaurant.dart';
import 'package:submission_2/data/model/restaurant.dart';
import 'package:flutter/material.dart';


class RestaurantListPage extends StatefulWidget {
  static const routeName = '/restaurant_list';

  @override
  _RestaurantListPageState createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  late Future<RestaurantList> _restaurantList;

  @override
  void initState() {
    super.initState();
    _restaurantList = ApiService().restaurantList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Restaurant',
        ),
      ),
      body: FutureBuilder(
        future: _restaurantList,
        builder: (context, AsyncSnapshot<RestaurantList> snapshot) {
          var state = snapshot.connectionState;
          if (state != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data?.count,
                itemBuilder: (context, index) {
                  var restaurant = snapshot.data?.restaurants[index];
                  return CardRestaurant(restaurant: restaurant!);
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return Text('');
            }
          }
        },
      ),
    );
  }
}
