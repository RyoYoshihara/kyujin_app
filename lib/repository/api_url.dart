

class AppUrl {

  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'https://test_url_link.com',
  );

  /// パス生成
  static vUrl({String path = ""}) {
    return '$baseUrl/$path';
  }

  //プロフィール取得
  static var getProfileEndpoint = vUrl(path: 'profile');

  //メッセージ情報
  static var getMessageFromCompanyEndpoint = vUrl(path: 'fromCompany');
}