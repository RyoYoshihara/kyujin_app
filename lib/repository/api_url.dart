

class AppUrl {

  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'https://test_url_link.com',
  );

  /// パス生成
  static vUrl({String path = ""}) {
    return '$baseUrl/$path';
  }

  static var getProfileEndpoint = vUrl(path: 'profile');

}