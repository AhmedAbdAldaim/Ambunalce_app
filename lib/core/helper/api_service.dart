import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  ApiService({required this.dio});

  //getData
  Future<dynamic> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token
    };
    var response = await dio.get(
      endPoint,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  //postData
  Future<Map<String, dynamic>> postData({
    required String endPoint,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token
    };
    var response = await dio.post(
      endPoint,
      data: data,
      queryParameters: queryParameters,
    );
    return response.data;
  }
}
