import 'package:submission_final/provider/restaurant_provider.dart';
import 'package:submission_final/utils/result_state.dart';
import 'package:submission_final/widgets/card_restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantListPage extends StatefulWidget {
  @override
  _RestaurantListPageState createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  final TextEditingController _filter = new TextEditingController();

  Icon _searchIcon = Icon(Icons.search);

  Widget _appBarTitle = Text('Restaurant');

  late RestaurantProvider provider;

  Widget _buildList() {
    return Consumer<RestaurantProvider>(
      builder: (context, state, _) {
        provider = state;
        if (state.state == ResultState.Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.HasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.result.restaurants.length,
            itemBuilder: (context, index) {
              var restaurant = state.result.restaurants[index];
              return CardRestaurant(restaurant: restaurant);
            },
          );
        } else if (state.state == ResultState.NoData) {
          return Center(child: Text(state.message));
        } else if (state.state == ResultState.Error) {
          return Center(child: Text("Tidak ada koneksi Internet."));
        } else {
          return Center(child: Text(''));
        }
      },
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
          onChanged: (value) => {
            if (value != '')
              {
                // Set the provider to show searched restaurant
                provider.fetchRestaurantSearch(value),
              }
          },
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Restaurant');
        // Set the provider to show all restaurant
        provider.fetchAllRestaurant();
        _filter.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _appBarTitle,
        actions: [
          IconButton(
            onPressed: _searchPressed,
            icon: _searchIcon,
          ),
        ],
      ),
      body: _buildList(),
    );
  }
}
