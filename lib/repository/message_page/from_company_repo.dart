import '../../core/base_api_service.dart';
import '../../core/network_api_service.dart';
import '../api_error_model.dart';
import '../../repository/api_url.dart';
import '../../model/message_page/from_company.dart';

class FromCompanyRepo {
  final BaseApiService _apiService = NetWorkApiService();
  FromCompanyRepo._privateConstructor();
  static final FromCompanyRepo _instance = FromCompanyRepo._privateConstructor();
  factory FromCompanyRepo() => _instance;

  Future<FromCompanyList> getMessages(String userID) async {
    try{
      ///テストデータ挿入
      // Map<String, dynamic> response = await _apiService.getGetApiWithParamResponse(
      //     AppUrl.getMessageFromCompanyEndpoint,
      //     userID
      // );
      // テストデータの挿入
      Map<String, dynamic> response = {
        "noReadCount":0,
        "messages": [
          {
            "name":"Officialテスト",
            "appeal":"こちらはテスト内容を表示しています。",
            "imageUrl":"https://paragongi.com/wp-content/uploads/2014/12/hd-background-wallpaper-office-desk-1084005-1920x1080-768x432.jpg",
            "recruitmentDetails":"東京　システムエンジニア",
            "salary":"500万〜700万",
            "isOfficial":true,
            "isRead":true,
          },
          {
            "name":"Officialテスト",
            "appeal":"こちらはテスト内容を表示しています。",
            "imageUrl":"https://paragongi.com/wp-content/uploads/2014/12/hd-background-wallpaper-office-desk-1084005-1920x1080-768x432.jpg",
            "recruitmentDetails":"東京　システムエンジニア",
            "salary":"500万〜700万",
            "isOfficial":true,
            "isRead":false,
          },
          {
            "name":"テスト001株式会社",
            "appeal":"こちらはテスト内容を表示しています。ステータスは未読状態を表示。",
            "imageUrl":"https://images.unsplash.com/photo-1553696590-4b3f68898333?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            "recruitmentDetails":"東京　システムエンジニア",
            "salary":"500万〜700万",
            "isOfficial":false,
            "isRead":false,
          },
          {
            "name":"テスト002株式会社",
            "appeal":"こちらはテスト内容を表示しています。ステータスは既読状態を表示。",
            "imageUrl":"https://images.unsplash.com/photo-1553696590-4b3f68898333?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            "recruitmentDetails":"東京　システムエンジニア",
            "salary":"500万〜700万",
            "isOfficial":false,
            "isRead":true,
          },
          {
            "name":"テスト001株式会社",
            "appeal":"こちらはテスト内容を表示しています。",
            "imageUrl":"",
            "recruitmentDetails":"東京　システムエンジニア",
            "salary":"500万〜700万",
            "isOfficial":false,
            "isRead":false,
          }
        ]
      };
      return FromCompanyList.fromJson(response);
    }catch (error) {
      throw ApiErrorModel.create(error);
    }
  }
}