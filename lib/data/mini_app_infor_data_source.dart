import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../config/config.dart';
import '../model/mini_app_infor.dart';

class MiniAppClient {
  MiniAppClient({http.Client? client}) : classClient = client ?? http.Client();
  final http.Client classClient;

  Future<List<MiniAppInfor>> getMiniAppInfor () async{
    var uri = Uri.parse(miniAppUrl);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      return compute(parseInfor,response.body);
    }else {
      throw Exception('Failed to load album');
    }
  }
}

List<MiniAppInfor> parseInfor(String responseBody){
  final parse = (jsonDecode(responseBody) as List).cast<Map<String,dynamic>>();
  return parse.map<MiniAppInfor>((json) => MiniAppInfor.fromJson(json)).toList();
}