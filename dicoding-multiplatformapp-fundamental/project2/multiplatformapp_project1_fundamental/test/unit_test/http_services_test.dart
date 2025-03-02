import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:multiplatformapp_project1_fundamental/data/local/http_service.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  group('HttpService', () {
    late MockHttpClient mockClient;
    late HttpService httpService;

    setUp(() {
      mockClient = MockHttpClient();
      httpService = HttpService(client: mockClient);
    });

    test('returns data when the HTTP call completes successfully', () async {
      const url = 'https://example.com/data';
      const responseData = 'Success';

      when(() => mockClient.get(Uri.parse(url)))
          .thenAnswer((_) async => http.Response(responseData, 200));

      final result = await httpService.getDataFromUrl(url);
      expect(result, responseData);
    });

    test('throws an exception when the HTTP call fails', () async {
      const url = 'https://example.com/data';

      when(() => mockClient.get(Uri.parse(url)))
          .thenAnswer((_) async => http.Response('Error', 404));

      final result = await httpService.getDataFromUrl(url);
      expect(result, 'Error');
    });
  });
}
