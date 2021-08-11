import 'package:flutter/material.dart';
import 'package:submission_2/data/model/restaurant.dart';

class DetailRestaurant extends StatelessWidget {
  final RestaurantComplete restaurant;

  const DetailRestaurant({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Hero(
            tag: restaurant.pictureId,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.network(
                  "https://restaurant-api.dicoding.dev/images/large/" +
                      restaurant.pictureId),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.location_pin,
                      color: Colors.black26,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Lokasi: ${restaurant.city}',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.black26,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Rating: ${restaurant.rating.toString()}',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                  ],
                ),
                Divider(color: Colors.grey),
                // Bagian Deskripsi
                Text(
                  restaurant.description,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Divider(color: Colors.grey),
                // Bagian Menu Makanan
                Row(
                  children: [
                    const Icon(
                      Icons.restaurant_menu,
                      color: Colors.black26,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Makanan',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: restaurant.menus.foods.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          width: 150,
                          height: 50,
                          child: GestureDetector(
                            onTap: () => {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Coming Soon!'),
                                    content: Text(
                                        'This feature will be coming soon.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            },
                            child: Card(
                              elevation: 10,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Center(
                                  child:
                                      Text(restaurant.menus.foods[index].name),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Divider(color: Colors.grey),
                // Bagian Menu Minuman
                Row(
                  children: [
                    const Icon(
                      Icons.local_drink,
                      color: Colors.black26,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Minuman',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: restaurant.menus.drinks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SizedBox(
                          width: 150,
                          height: 50,
                          child: GestureDetector(
                            onTap: () => {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Coming Soon!'),
                                    content: Text(
                                        'This feature will be coming soon.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            },
                            child: Card(
                              elevation: 10,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Center(
                                  child:
                                      Text(restaurant.menus.drinks[index].name),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
