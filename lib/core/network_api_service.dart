import 'dart:convert';
import 'package:http/http.dart' as http;

import 'base_api_service.dart';

enum HttpMethods {
  get('GET'),
  post('POST'),
  put('PUT'),
  delete('DELETE');

  final String httpMethod;

  const HttpMethods(this.httpMethod);

  @override
  String toString() => "API Bad Status Response: $httpMethod";
}

class NetWorkApiService extends BaseApiService {

  @override
  Future getGetApiResponse(String url) async {
    try {
      final response = await http.get(
          Uri.parse(url),
          headers: {}
      ).timeout(const Duration(minutes: 3));
      return returnResponse(response,
          crashMessage: '${HttpMethods.get.toString()} $url');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future getGetApiWithParamResponse(String url, data) async {
    try {
      final response = await http.get(
          Uri.parse(url),
          headers: {}
      ).timeout(const Duration(minutes: 3));
      return returnResponse(response,
          crashMessage: HttpMethods.get.toString() + url);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {
        'content-type': 'application/json',
      };
      String body = json.encode(data);
      http.Response response = await http
          .post(uri, headers: headers, body: body)
          .timeout(const Duration(minutes: 3));
      return returnResponse(response,
          crashMessage: HttpMethods.post.toString() + url);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future getPutApiResponse(String url) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {
        'content-type': 'application/json'
      };
      http.Response response = await http
          .put(uri, headers: headers)
          .timeout(const Duration(minutes: 3));
      return returnResponse(response,
          crashMessage: HttpMethods.put.toString() + url);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future getPutApiWithBodyResponse(String url, dynamic data) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {
        'content-type': 'application/json',
      };
      String body = json.encode(data);
      http.Response response = await http
          .put(uri, headers: headers, body: body)
          .timeout(const Duration(minutes: 3));
      return returnResponse(response,
          crashMessage: HttpMethods.put.toString() + url);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future getDeleteApiResponse(String url) async {
    try {
      final response = await http.delete(
          Uri.parse(url),
          headers: {}).timeout(const Duration(minutes: 3)
      );
      return returnResponse(response,
          crashMessage: HttpMethods.delete.toString() + url);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future getDeleteApiResponseWithBody(String url, dynamic data) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {
        'content-type': 'application/json'
      };
      String body = json.encode(data);
      http.Response response = await http
          .delete(uri, headers: headers, body: body)
          .timeout(const Duration(minutes: 3));
      return returnResponse(response,
          crashMessage: HttpMethods.delete.toString() + url);
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> returnResponse(http.Response response,
      {required String crashMessage}) {
    final isSuccessful =
        response.statusCode >= 200 && response.statusCode < 400;

    final Map<String, dynamic> responseJson = {
      'data': response.body.isEmpty ? null : jsonDecode(response.body),
      'status_code': response.statusCode,
    };

    if (!isSuccessful) {
      throw responseJson;
    }

    return responseJson;
  }
}