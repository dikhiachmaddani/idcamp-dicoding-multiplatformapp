import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiplatformapp_project1_fundamental/data/api/api_services.dart';
import 'package:multiplatformapp_project1_fundamental/data/models/response/base_list_restaurant_response.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/home/list_restaurant_provider.dart';
import 'package:multiplatformapp_project1_fundamental/static/list_restaurant_result_state.dart';

class MockApiServices extends Mock implements ApiServices {}

void main() {
  late MockApiServices mockApiServices;
  late ListRestaurantProvider provider;

  setUp(() {
    mockApiServices = MockApiServices();
    provider = ListRestaurantProvider(mockApiServices);
  });

  test('should set state to loading and then loaded when fetch is successful',
      () async {
    final mockResponse = BaseListRestaurantResponse(
        error: false, message: "success", count: 0, restaurants: []);

    when(() => mockApiServices.getRestaurantList())
        .thenAnswer((_) async => mockResponse);

    expect(provider.resultState, isA<ListRestaurantNoneState>());

    final future = provider.fetchListRestaurant();

    expect(provider.resultState, isA<ListRestaurantLoadingState>());

    await future;

    expect(provider.resultState, isA<ListRestaurantLoadedState>());
  });

  test('should set state to error when API returns an error', () async {
    final mockResponse = BaseListRestaurantResponse(
        error: true,
        message: "Failed to fetch data",
        count: 0,
        restaurants: []);

    when(() => mockApiServices.getRestaurantList())
        .thenAnswer((_) async => mockResponse);

    await provider.fetchListRestaurant();

    expect(provider.resultState, isA<ListRestaurantErrorState>());
    expect((provider.resultState as ListRestaurantErrorState).error,
        "Failed to fetch data");
  });

  test('should set state to error when an exception occurs', () async {
    when(() => mockApiServices.getRestaurantList())
        .thenThrow(Exception('Network error'));

    await provider.fetchListRestaurant();

    expect(provider.resultState, isA<ListRestaurantErrorState>());
    expect((provider.resultState as ListRestaurantErrorState).error,
        contains('Network error'));
  });
}
