import 'package:flutter/material.dart';
import 'package:submission_final/data/model/restaurant.dart';
import 'package:submission_final/data/model/review.dart';
import 'package:submission_final/provider/restaurant_provider.dart';
import 'package:submission_final/ui/add_review_dialog.dart';

class DetailRestaurant extends StatelessWidget {
  final RestaurantComplete restaurant;
  final RestaurantProvider provider;

  const DetailRestaurant({required this.restaurant, required this.provider});

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
                Divider(color: Colors.grey),
                // Bagian Review
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.chat_bubble,
                            color: Colors.black26,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Review',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.black54,
                            onSurface: Colors.grey,
                            textStyle: Theme.of(context).textTheme.subtitle2,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AddReviewDialog(
                                  provider: provider, id: restaurant.id),
                            );
                          },
                          child: const Text('Tambahkan Review')),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: restaurant.reviews.length,
                    itemBuilder: (BuildContext context, int index) {
                      Review review = restaurant.reviews[index];
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
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          review.name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          review.date,
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 12),
                                        ),
                                        Text(
                                          review.review,
                                          maxLines: 5,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ));
                    }),
                // Bagian Tombol Add Review
              ],
            ),
          ),
        ],
      ),
    );
  }
}
