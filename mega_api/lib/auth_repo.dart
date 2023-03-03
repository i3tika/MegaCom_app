import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

import 'models/send_code_models.dart';
import 'models/send_phone_models.dart';

class AuthRepo {
  final Dio dio;
  AuthRepo({required this.dio});

  final storage = FlutterSecureStorage();

  String basicAuth = 'Basic ${base64Encode(
    utf8.encode('testEmil12:11223344'),
  )}';

  Future<SendPhoneModel> sendPhone({required String phoneName}) async {
    final response = await dio.get('generateUserId/test?',
        queryParameters: {
          'msisdn': phoneName,
        },
        options: Options(headers: {'authorization': basicAuth}));
    final result = SendPhoneModel.fromJson(response.data);
    await storage.write(key: 'token', value: result.object);
    return result;
  }

  // Future<SendCodeModel> sendCode({required String code}) async {
  //   final responses = dio.get('/checkCode/test?',
  //       queryParameters: {
  //         'code': code,
  //         'uuId': '${await storage.read(key: 'token')}',
  //       },
  //       options: Options(headers: {'authorization': basicAuth}));
  //   return SendCodeModel.fromJson(responses.data);
  // }
   Future<SendCodeModel> sendCode({required String code}) async {
    final response = await dio.get(
      '/checkCode/test?',
      queryParameters: {
        'code': code,
        'uuId': '${await storage.read(key: 'token')}'
      },
      options: Options(headers: {'authorization': basicAuth}),
    );
    return SendCodeModel.fromJson(response.data);
  }
}
