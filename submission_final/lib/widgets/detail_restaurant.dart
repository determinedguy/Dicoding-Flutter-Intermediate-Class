import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission_final/data/model/restaurant.dart';
import 'package:submission_final/data/model/review.dart';
import 'package:submission_final/provider/database_provider.dart';
import 'package:submission_final/provider/restaurant_provider.dart';
import 'package:submission_final/ui/add_review_dialog.dart';

class DetailRestaurant extends StatelessWidget {
  final RestaurantComplete restaurantComplete;
  final Restaurant restaurant;
  final RestaurantProvider restaurantProvider;

  const DetailRestaurant(
      {required this.restaurant, required this.restaurantComplete, required this.restaurantProvider});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
          future: provider.isFavorite(restaurant.id),
          builder: (context, snapshot) {
            var isFavorite = snapshot.data ?? false;
            return Material(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Bagian Gambar Restoran
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
                    // Bagian Nama-Lokasi-Rating Restoran
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Bagian Nama Restoran
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                restaurantComplete.name,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              isFavorite
                                  ? IconButton(
                                      icon: Icon(Icons.favorite),
                                      onPressed: () => provider
                                          .removeFavorite(restaurantComplete.id),
                                    )
                                  : IconButton(
                                      icon: Icon(Icons.favorite_border),
                                      onPressed: () =>
                                          provider.addFavorite(restaurant),
                                    ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_pin,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Lokasi: ${restaurantComplete.city}',
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
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Rating: ${restaurantComplete.rating.toString()}',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ),
                            ],
                          ),
                          Divider(color: Colors.grey),
                          // Bagian Deskripsi
                          Text(
                            restaurantComplete.description,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Divider(color: Colors.grey),
                          // Bagian Menu Makanan
                          Row(
                            children: [
                              const Icon(
                                Icons.restaurant_menu,
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
                              itemCount: restaurantComplete.menus.foods.length,
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Center(
                                            child: Text(restaurantComplete
                                                .menus.foods[index].name),
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
                              itemCount: restaurantComplete.menus.drinks.length,
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Center(
                                            child: Text(restaurantComplete
                                                .menus.drinks[index].name),
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
                          // Bagian Review
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.chat_bubble,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'Review',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Bagian Tombol Add Review
                              Expanded(
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor: Colors.black54,
                                      onSurface: Colors.grey,
                                      textStyle:
                                          Theme.of(context).textTheme.subtitle2,
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AddReviewDialog(
                                            provider: restaurantProvider,
                                            id: restaurantComplete.id),
                                      );
                                    },
                                    child: const Text('Tambahkan Review')),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: restaurantComplete.reviews.length,
                              itemBuilder: (BuildContext context, int index) {
                                Review review = restaurantComplete.reviews[index];
                                return Card(
                                    margin: EdgeInsets.all(8),
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 24,
                                            backgroundColor: Colors.black38,
                                            child: Text(
                                              review.name[0],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 24,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    review.name,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    review.date,
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 12),
                                                  ),
                                                  Text(
                                                    review.review,
                                                    maxLines: 5,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ));
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
