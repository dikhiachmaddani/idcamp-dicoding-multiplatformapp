import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:multiplatformapp_project1_fundamental/data/models/restaurant/list_restaurant_model.dart';
import 'package:provider/provider.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/home/list_restaurant_provider.dart';
import 'package:multiplatformapp_project1_fundamental/screen/home/home_screen.dart';
import 'package:multiplatformapp_project1_fundamental/static/list_restaurant_result_state.dart';

class MockListRestaurantProvider extends Mock
    implements ListRestaurantProvider {}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  group('HomeScreen Integration Test', () {
    late MockListRestaurantProvider mockProvider;

    setUp(() {
      HttpOverrides.global = MyHttpOverrides();
      mockProvider = MockListRestaurantProvider();
      when(() => mockProvider.fetchListRestaurant()).thenAnswer((_) async {});
    });

    Widget createTestWidget() {
      return ChangeNotifierProvider<ListRestaurantProvider>.value(
        value: mockProvider,
        child: const MaterialApp(
          home: HomeScreen(),
        ),
      );
    }

    testWidgets('Displays the loading indicator when data is being loaded',
        (tester) async {
      when(() => mockProvider.resultState)
          .thenReturn(ListRestaurantLoadingState());

      await tester.pumpWidget(createTestWidget());
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets(
        'Display the list of restaurants when the data is successfully loaded',
        (tester) async {
      final List<ListRestaurantModel> dummyRestaurants = [
        ListRestaurantModel(
            id: "rqdv5juczeskfw1e867",
            name: "Melting Pot",
            description:
                "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...",
            pictureId: "14",
            city: "Medan",
            rating: 4.2),
      ];

      when(() => mockProvider.resultState)
          .thenReturn(ListRestaurantLoadedState(dummyRestaurants));

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byType(ListView), findsOneWidget);
      expect(find.text('Melting Pot'), findsOneWidget);
    });

    testWidgets('Display an error message when failing to load data',
        (tester) async {
      when(() => mockProvider.resultState)
          .thenReturn(ListRestaurantErrorState(""));

      await tester.pumpWidget(createTestWidget());
      expect(
          find.textContaining(
              'Mohon Maaf, Server gagal untuk memuat data restoran. Mohon untuk cek ulang jaringan internet anda'),
          findsOneWidget);
    });
  });
}
