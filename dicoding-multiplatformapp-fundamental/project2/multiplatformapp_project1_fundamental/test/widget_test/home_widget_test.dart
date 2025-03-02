import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multiplatformapp_project1_fundamental/data/models/restaurant/list_restaurant_model.dart';
import 'package:multiplatformapp_project1_fundamental/screen/home/widget/home_card_widget.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  setUpAll(() {
    HttpOverrides.global = MyHttpOverrides();
  });

  testWidgets(
      'HomeCardWidget displays restaurant data correctly and handles tap',
      (WidgetTester tester) async {
    final listRestaurant = ListRestaurantModel(
      id: "rqdv5juczeskfw1e867",
      name: "Melting Pot",
      description:
          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...",
      pictureId: "14",
      city: "Medan",
      rating: 4.2,
    );

    bool wasTapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HomeCardWidget(
            listRestaurant: listRestaurant,
            onTap: () {
              wasTapped = true;
            },
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Melting Pot'), findsOneWidget);
    expect(
        find.text(
            'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...'),
        findsOneWidget);
    expect(find.text('Medan'), findsOneWidget);
    expect(find.text('4.2'), findsOneWidget);

    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    expect(wasTapped, isTrue);
  });
}
