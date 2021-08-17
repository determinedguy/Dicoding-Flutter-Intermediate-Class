import 'package:flutter_test/flutter_test.dart';
import 'package:submission_final/data/api/api_service.dart';
import 'package:submission_final/data/model/restaurant.dart';
import 'package:submission_final/data/model/review.dart';
import 'package:submission_final/provider/database_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'restaurant_test.mocks.dart';

@GenerateMocks([DatabaseProvider, ApiService])
void main() {
  group('Restaurant Test', () {
    late Restaurant restaurant;
    late RestaurantComplete restaurantComplete;
    late ApiService apiService;
    late DatabaseProvider databaseProvider;

    setUp(() {
      apiService = MockApiService();
      databaseProvider = MockDatabaseProvider();
      restaurant = Restaurant(
        id: "abc123",
        name: "Restaurant",
        description: "Lorem ipsum dolor sit amet",
        pictureId: "1",
        city: "Jakarta",
        rating: 4.7,
      );
      restaurantComplete = RestaurantComplete(
          id: "abc123",
          name: "Restaurant",
          description: "Lorem ipsum dolor sit amet",
          city: "Jakarta",
          address: "Jl. Tegangan Rendah No. 1",
          pictureId: "1",
          categories: [
            Category(name: "Indonesia"),
            Category(name: "Industrial"),
          ],
          menus: Menus(
            foods: [
              Category(name: "Nasi Uduk"),
              Category(name: "Ayam Geprek"),
            ],
            drinks: [
              Category(name: "Es Kelapa Muda"),
              Category(name: "Soda Gembira"),
            ],
          ),
          rating: 4.7,
          reviews: [
            Review(
              id: "xyz789",
              name: "Ahmad",
              review: "Not recommended!",
              date: "17 Agustus 2021",
            ),
            Review(
              id: "def456",
              name: "Zulaikha",
              review: "Recommended!",
              date: "17 Agustus 2021",
            ),
          ],
        );
    });

    test('Should success parsing JSON', () {
      var result = Restaurant.fromJson(restaurant.toJson());

      expect(result.name, restaurant.name);
    });

    test("Should return restaurant detail from API", () async {
      when(apiService.restaurantDetail(restaurant.id)).thenAnswer((_) async {
        return RestaurantDetail(
          error: false,
          message: 'success',
          restaurant: restaurantComplete,
        );
      });

      expect(await apiService.restaurantDetail(restaurant.id),
          isA<RestaurantComplete>());
    });

    test('Should return favorite restaurant', () {
      when(databaseProvider.databaseHelper.getFavorites()).thenAnswer((realInvocation) {
        Future<List<Restaurant>> restaurants = [restaurant] as Future<List<Restaurant>>;
        return restaurants;
      });
      expect(databaseProvider.databaseHelper.getFavorites(), isA<Future<List<Restaurant>>>());
    });
  });
}
