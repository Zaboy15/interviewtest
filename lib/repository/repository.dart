import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zakario_app_test/models/univ_model.dart';

class APIRepository {
  APIRepository({this.contextRepo});
  BuildContext? contextRepo;
  String host = 'http://universities.hipolabs.com';
  Dio _dio = Dio();

  getUniv(int? currentPage, int limit, String? keyword) async {
    try {
      var response = await _dio.get(
        '$host/search?country=Indonesia&name=$keyword&limit=$limit',
      );
      return {
        'code': response.statusCode.toString(),
        'data': response.data,
      };
    } on DioError catch (e) {}
  }
}
