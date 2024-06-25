import 'dart:io';

abstract class BaseApiService {
  Future<dynamic> getGetApiResponse(String url);

  Future<dynamic> getGetApiWithParamResponse(String url,dynamic data);

  Future<dynamic> getPostApiResponse(String url, dynamic data);

  Future<dynamic> getPutApiResponse(String url);

  Future<dynamic> getPutApiWithBodyResponse(String url, dynamic data);

  Future<dynamic> getDeleteApiResponse(String url);

  Future<dynamic> getDeleteApiResponseWithBody(String url, dynamic data);
}
