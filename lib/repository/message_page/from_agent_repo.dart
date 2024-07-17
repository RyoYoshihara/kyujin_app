import '../../core/base_api_service.dart';
import '../../core/network_api_service.dart';
import '../api_error_model.dart';
import '../../repository/api_url.dart';
import '../../model/message_page/from_agent.dart';

class FromAgentRepo {
  final BaseApiService _apiService = NetWorkApiService();
  FromAgentRepo._privateConstructor();
  static final FromAgentRepo _instance = FromAgentRepo._privateConstructor();
  factory FromAgentRepo() => _instance;

  Future<FromAgentList> getMessages(String userID) async {
    try{
      ///テストデータ挿入
      // Map<String, dynamic> response = await _apiService.getGetApiWithParamResponse(
      //     AppUrl.getMessageFromAgentEndpoint,
      //     userID
      // );
      // テストデータの挿入
      Map<String, dynamic> response = {
        "noReadCount":0,
        "messages": [
          {
            "name":"公式 テストユーザー",
            "companyName":"〇〇株式会社",
            "imageUrl":"https://paragongi.com/wp-content/uploads/2014/12/hd-background-wallpaper-office-desk-1084005-1920x1080-768x432.jpg",
            "content":"テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト ",
            "isRead":true,
          },
          {
            "name":"公式 テストユーザー",
            "companyName":"〇〇株式会社。",
            "imageUrl":"https://paragongi.com/wp-content/uploads/2014/12/hd-background-wallpaper-office-desk-1084005-1920x1080-768x432.jpg",
            "content":"テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト ",
            "isRead":true,
          },
          {
            "name":"公式 テストユーザー",
            "companyName":"〇〇株式会社。",
            "imageUrl":"https://paragongi.com/wp-content/uploads/2014/12/hd-background-wallpaper-office-desk-1084005-1920x1080-768x432.jpg",
            "content":"テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト ",
            "isRead":true,
          },
          {
            "name":"公式 テストユーザー",
            "companyName":"〇〇株式会社。",
            "imageUrl":"https://paragongi.com/wp-content/uploads/2014/12/hd-background-wallpaper-office-desk-1084005-1920x1080-768x432.jpg",
            "content":"テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト テスト ",
            "isRead":true,
          },
        ]
      };
      return FromAgentList.fromJson(response);
    }catch (error) {
      throw ApiErrorModel.create(error);
    }

  }

}