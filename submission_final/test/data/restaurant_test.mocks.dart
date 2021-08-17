// Mocks generated by Mockito 5.0.14 from annotations
// in submission_final/test/data/restaurant_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i7;
import 'dart:ui' as _i8;

import 'package:mockito/mockito.dart' as _i1;
import 'package:submission_final/data/api/api_service.dart' as _i9;
import 'package:submission_final/data/db/database_helper.dart' as _i2;
import 'package:submission_final/data/model/restaurant.dart' as _i3;
import 'package:submission_final/data/model/review.dart' as _i4;
import 'package:submission_final/provider/database_provider.dart' as _i5;
import 'package:submission_final/utils/result_state.dart' as _i6;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeDatabaseHelper_0 extends _i1.Fake implements _i2.DatabaseHelper {}

class _FakeRestaurantList_1 extends _i1.Fake implements _i3.RestaurantList {}

class _FakeRestaurantDetail_2 extends _i1.Fake implements _i3.RestaurantDetail {
}

class _FakeRestaurantSearch_3 extends _i1.Fake implements _i3.RestaurantSearch {
}

class _FakeResponseReview_4 extends _i1.Fake implements _i4.ResponseReview {}

/// A class which mocks [DatabaseProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseProvider extends _i1.Mock implements _i5.DatabaseProvider {
  MockDatabaseProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.DatabaseHelper get databaseHelper =>
      (super.noSuchMethod(Invocation.getter(#databaseHelper),
          returnValue: _FakeDatabaseHelper_0()) as _i2.DatabaseHelper);
  @override
  _i6.ResultState get state => (super.noSuchMethod(Invocation.getter(#state),
      returnValue: _i6.ResultState.Loading) as _i6.ResultState);
  @override
  String get message =>
      (super.noSuchMethod(Invocation.getter(#message), returnValue: '')
          as String);
  @override
  List<_i3.Restaurant> get favorites =>
      (super.noSuchMethod(Invocation.getter(#favorites),
          returnValue: <_i3.Restaurant>[]) as List<_i3.Restaurant>);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  void addFavorite(_i3.Restaurant? restaurant) =>
      super.noSuchMethod(Invocation.method(#addFavorite, [restaurant]),
          returnValueForMissingStub: null);
  @override
  _i7.Future<bool> isFavorite(String? id) =>
      (super.noSuchMethod(Invocation.method(#isFavorite, [id]),
          returnValue: Future<bool>.value(false)) as _i7.Future<bool>);
  @override
  void removeFavorite(String? id) =>
      super.noSuchMethod(Invocation.method(#removeFavorite, [id]),
          returnValueForMissingStub: null);
  @override
  void addListener(_i8.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i8.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}

/// A class which mocks [ApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiService extends _i1.Mock implements _i9.ApiService {
  MockApiService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i3.RestaurantList> restaurantList() =>
      (super.noSuchMethod(Invocation.method(#restaurantList, []),
              returnValue:
                  Future<_i3.RestaurantList>.value(_FakeRestaurantList_1()))
          as _i7.Future<_i3.RestaurantList>);
  @override
  _i7.Future<_i3.RestaurantDetail> restaurantDetail(String? id) =>
      (super.noSuchMethod(Invocation.method(#restaurantDetail, [id]),
              returnValue:
                  Future<_i3.RestaurantDetail>.value(_FakeRestaurantDetail_2()))
          as _i7.Future<_i3.RestaurantDetail>);
  @override
  _i7.Future<_i3.RestaurantSearch> restaurantSearch(String? query) =>
      (super.noSuchMethod(Invocation.method(#restaurantSearch, [query]),
              returnValue:
                  Future<_i3.RestaurantSearch>.value(_FakeRestaurantSearch_3()))
          as _i7.Future<_i3.RestaurantSearch>);
  @override
  _i7.Future<_i4.ResponseReview> postReview(_i4.Review? review) =>
      (super.noSuchMethod(Invocation.method(#postReview, [review]),
              returnValue:
                  Future<_i4.ResponseReview>.value(_FakeResponseReview_4()))
          as _i7.Future<_i4.ResponseReview>);
  @override
  String toString() => super.toString();
}
