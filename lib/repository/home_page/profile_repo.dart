

import '../../core/base_api_service.dart';
import '../../core/network_api_service.dart';
import '../../model/home_page/profile.dart';
import '../../repository/api_url.dart';
import '../api_error_model.dart';

class ProfileRepo {
  final BaseApiService _apiService = NetWorkApiService();
  ProfileRepo._privateConstructor();
  static final ProfileRepo _instance = ProfileRepo._privateConstructor();
  factory ProfileRepo() => _instance;

  Future<Profile> getProfile(String userID) async{
    try{
      ///テストデータ挿入
      //Map<String, dynamic> response = await _apiService.getGetApiWithParamResponse(AppUrl.getProfileEndpoint, userID);
      // テストデータの挿入
      Map<String, dynamic> response = {
        "user": {
          "family": "吉原",
          "name": "諒",
          "kanaFamily": "ヨシハラ",
          "kanaName": "リョウ"
        },
        "address": {
          "prefecture": "埼玉県",
          "other": "草加市旭町4-4-5"
        },
        "tel": "09035238198",
        "email": "test@gmail.com",
        "birthDay": "1988/05/10",
        "sex": 0,
        "lastAcademic": {
          "name": "草加市立草加",
          "category": "高等学校",
          "subject": "普通科",
          "graduation": "2007年 3月 卒業"
        },
        "language": {
          "motherTongue": "日本語",
          "other": "北京語：日常会話",
          "toeic": "未入力",
          "toefl": "未入力"
        },
        "qualification": "OracleBronze",
        "spouse": 0,
        "income": 500,
        "corporate": [
          {
            "name": "株式会社VSTA",
            "position": "正社員",
            "start": "2015年6月",
            "end": "2023年5月"
          },
          {
            "name": "株式会社ISECT",
            "position": "正社員",
            "start": "2023年6月",
            "end": "在籍中"
          }
        ],
        "industry": [
          "インターネット/WEBサービス：3年",
          "モバイル/アプリサービス：3年",
          "その他サービス系：3年"
        ],
        "occupation": [
          "PM・リーダー：１〜３年",
          "バックエンジニア：３年",
          "スマートフォンアプリエンジニア：３年"
        ]
      };
      return Profile.fromJson(response);
    }catch (error) {
      throw ApiErrorModel.create(error);
    }
  }
}